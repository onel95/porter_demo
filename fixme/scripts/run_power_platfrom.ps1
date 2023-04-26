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

$TargetTenantId = "51050b0f-0a71-472f-b0b8-03e51aed84e2"
$HelpDeskUserName = "admin@CRM465671.onmicrosoft.com"
$HelpDeskUserPswd = "0vk]XOND7$06[e^x"
$AdminUserName = $HelpDeskUserName
$AdminPswd = $HelpDeskUserPswd
$AccessPolicyUserId = ""
$TargetEnvironment = "CRM465671"
$SolutionName = "FixmeSolution"
$SolutionFilePath = "./Solution/FixmeSolution.zip"
$SettingsFilePath = "./Solution/FixmeSettings_raw.json"
$TargetProfileName = "power-platform-admin"

./scripts/power_platform.ps1 $AdminUserName $AdminPswd $AccessPolicyUserId $TargetTenantId 
