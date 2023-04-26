
param (
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]$UserName,

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$Pswd,

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$AccessPolicyUserId,

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    $TargetTenantId

)

function importMSTeamsModule {

    Write-Host "Importing Microsoft Teams module"
    Import-Module MicrosoftTeams
    Write-Host "Import of Microsoft Teams module completed"
}


function createAppReg {
    param (
        [System.Management.Automation.PSCredential] $UserCredential
    )
    Import-Module AzureAD -UseWindowsPowerShell -WarningAction SilentlyContinue
    $appName = "Graph-API"
    Write-Host "Connecting to Azure AD"
    Connect-AzureAD -TenantId $TargetTenantId -Credential $UserCredential
    Write-Host "Verify if app already exists..."

    if(!($myApp = Get-AzureADApplication -Filter "DisplayName eq '$($appName)'"  -ErrorAction SilentlyContinue))
    {
        Write-Host "Creating App registration in azure AD"
        $myApp = New-AzureADApplication -DisplayName $appName -IdentifierUris $appURI -Homepage $appHomePageUrl -ReplyUrls $appReplyURLs  
        Write-Host "App registration creation completed"
    }

    Write-Host "Retrieve App Id from App"
    $applicationIdObj = $myApp | Select AppId
    Write-Host $applicationIdObj
    return $applicationIdObj
}

function generateCredentials {

    param (
        [String] $UserName,
        [String] $Pswd
    )

    Write-Host "Generating PSCredentials"

    $Password = ConvertTo-SecureString $Pswd -AsPlainText -Force
    $UserCredential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)

    Write-Host "Generation of PSCredentials completed"

    return $UserCredential;
}



function applyPolicies {

    param (
        [System.Management.Automation.PSCredential] $UserCredential,
        [String] $AppId,
        [String] $UserId
    )

    Write-Host "Connecting to Microsoft Teams"
    Connect-MicrosoftTeams -Credential $UserCredential

    Write-Host "*****Creating new MSGraph policy for appId*********"
    Write-Host $AppId
    New-CsApplicationAccessPolicy -Identity MSGraph-policy -AppIds $AppId -Description "access policy for Graph API"
    
    Write-Host "Granting MSGraph access policy to user"
    Grant-CsApplicationAccessPolicy -PolicyName MSGraph-policy -Identity $UserId
    
    Write-Host "Setting TeamsMeeting Policy to AllowTranscription"
    Set-CsTeamsMeetingPolicy -Identity Global -AllowTranscription $true
}


importMSTeamsModule
$UserCredential = generateCredentials $UserName $Pswd
$appIdObj = createAppReg $UserCredential 
applyPolicies $UserCredential $appIdObj."AppId" $AccessPolicyUserId
