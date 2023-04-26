param (

    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]$AdminUserName,

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$AdminPswd,

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$AccessPolicyUserId,

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetTenantId,

    [Parameter(Mandatory=$true, Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]$HelpDeskUserName,

    [Parameter(Mandatory=$true, Position=5)]
    [ValidateNotNullOrEmpty()]
    [string]$HelpDeskUserPswd,

    [Parameter(Mandatory=$true, Position=6)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetEnvironment,

    [Parameter(Mandatory=$true, Position=7)]
    [ValidateNotNullOrEmpty()]
    [string]$SqlConnectionId,

    [Parameter(Mandatory=$true, Position=8)]
    [ValidateNotNullOrEmpty()]
    [string]$OneDriveConnectionId,

    [Parameter(Mandatory=$true, Position=9)]
    [ValidateNotNullOrEmpty()]
    [string]$TeamsConnectionId

)

$TargetProfileName = "Fixme"
$SolutionName = "Fixme"
$SolutionFilePath = Join-Path $PSScriptRoot "FixmeSolution.zip"
$SettingsFilePath = Join-Path $PSScriptRoot "FixmeSettings.json"


$accessPolicyScriptPath = Join-Path $PSScriptRoot "access_policy.ps1"
Invoke-Expression "& `"$accessPolicyScriptPath`" $AdminUserName $AdminPswd $AccessPolicyUserId $TargetTenantId"

#TODO: Not needed, just use FixmeSettings_raw.json
#$genDeploymentScriptPath = Join-Path $PSScriptRoot "generate_deployment_settings.ps1"
#Invoke-Expression "& `"$genDeploymentScriptPath`" $HelpDeskUserName $SqlConnectionId $OneDriveConnectionId $TeamsConnectionId"

$importSolutionScriptPath = Join-Path $PSScriptRoot "import_powerplatform_solution.ps1"
Invoke-Expression "& `"$importSolutionScriptPath`" $TargetTenantId $HelpDeskUserName $HelpDeskUserPswd $TargetEnvironment $SolutionName $SolutionFilePath $SettingsFilePath $TargetProfileName" 

$archieveDeploymentScriptPath = Join-Path $PSScriptRoot "archieve_deployment_settings.ps1"
Invoke-Expression "& `"$archieveDeploymentScriptPath`" "