param (
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetTenantId,

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetUserName,

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetPswd,

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetEnvironment,

    [Parameter(Mandatory=$true, Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionName,

    [Parameter(Mandatory=$true, Position=5)]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionFilePath,

    [Parameter(Mandatory=$true, Position=6)]
    [ValidateNotNullOrEmpty()]
    [string]$SettingsFilePath,

    [Parameter(Mandatory=$true, Position=7)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetProfileName
)


function generateProfile {

    param (
        [String] $TenantId,
        [String] $UserName,
        [String] $Pswd,
        [String] $ProfileName,
        [String] $Environment
    )

    Write-Host "Generating Profile"
  
    /cnab/app/tools/pac auth create --url https://orga68a4dfd.crm.dynamics.com --name "porter-creds-spn" --applicationId 4d980eee-d74f-46a9-a658-6d2853aa561b --clientSecret "VQO8Q~oBEYtxgURecnVlM11tn2rmHQ2vrCc2pbz4" --environment $Environment --tenant $TenantId
   
    /cnab/app/tools/pac auth create --name $ProfileName --kind Admin --applicationId 4d980eee-d74f-46a9-a658-6d2853aa561b --clientSecret "VQO8Q~oBEYtxgURecnVlM11tn2rmHQ2vrCc2pbz4" --environment $Environment --tenant $TenantId

}

function selectEnvironment {

    param (
        [String] $Environment
    )

    Write-Host "Selecting Environment"
    /cnab/app/tools/pac org select --environment $Environment
    Write-Host "Selecting Environment completed"
}

function importSolution {
    param (
        [String] $SolutionFilePath,
        [String] $SettingsFileselePath
    )
    Write-Host "Importing solution"port
    #TODO: Remove --settigns-file for now
    #pac solution import --path $SolutionFilePath --activate-flows --settings-file $SettingsFilePath // also --activate-flow unrecognized
    /cnab/app/tools/pac solution import --path $SolutionFilePath --settings-file $SettingsFilePath 
    Write-Host "Solution import completed"
}

function listAuthProfiles {
    $profiles = /cnab/app/tools/pac auth list
    Write-Host $profiles
}

#Ensure latest PAC CLI is installed.
#pac install latest

function updatePACCli {
    Write-Host "Updating PAC CLI"
    /cnab/app/tools/pac install latest
    Write-Host "Installation of PAC CLI completed"
}

Write-Host "Start import"


#updatePACCli
generateProfile $TargetTenantId $TargetUserName $TargetPswd $TargetProfileName $TargetEnvironment
#TODO remove for now, "Error: Organization listing was called with incompatible auth profile"
#listAuthProfiles
selectEnvironment $TargetEnvironment
importSolution $SolutionFilePath $SettingsFilePath

Write-Host "Finish import"
