# $SourceTenantId = "285e860f-dddd-4c8c-b644-dc61af82ed41"
# $SourceUserName = "admin@CRM625729.onmicrosoft.com"
# $SourcePswd = ""
# t6a54L8xiB
# $SourceProfileName = "FixMeSource"
# $SourceEnvironment = "CRM625729"
# $SolutionFilePath = "C:\Repos\WhiteBox\Automation\Solution1.zip"
# $SolutionName = "Fixme"
# $SettingsFilePath = "C:\Repos\WhiteBox\Automation\Settings1.json"




param (
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceTenantId,

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceUserName,

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$SourcePswd,

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceProfileName,

    [Parameter(Mandatory=$true, Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceEnvironment,

    [Parameter(Mandatory=$true, Position=5)]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionFilePath,

    [Parameter(Mandatory=$true, Position=6)]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionName,

    [Parameter(Mandatory=$true, Position=7)]
    [ValidateNotNullOrEmpty()]
    [string]$SettingsFilePath
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
    pac auth create --tenant $TenantId --username $UserName --password $Pswd --name $ProfileName --environment $Environment

}

function selectEnvironment {

    param (
        [String] $Environment
    )

    Write-Host "Selecting Environment"
    pac org select --environment $Environment
}

function exportSolution {
    param (
        [String] $SolutionFilePath,
        [string] $SolutionName
    )

    Write-Host "Exporting Solution"
    pac solution export --path $SolutionFilePath --name $SolutionName --managed false --include general
}

function generateSolutionSettings {
    param (
        [String] $SolutionFilePath,
        [String] $SettingsFilePath
    )

    pac solution create-settings -z $SolutionFilePath -s $SettingsFilePath
}



function updateSettingsFile {
    param (
        [String] $SolutionFilePath,
        [String] $SettingsFilePath
    )
}

function listAuthProfiles {
    $profiles = pac auth list
    Write-Host $profiles
}


generateProfile $SourceTenantId $SourceUserName $SourcePswd $SourceProfileName $SourceEnvironment
listAuthProfiles
selectEnvironment $SourceEnvironment
exportSolution $SolutionFilePath $SolutionName
generateSolutionSettings $SolutionFilePath $SettingsFilePath
