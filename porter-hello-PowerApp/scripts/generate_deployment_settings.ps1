param (

    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]$ActivateFlowUserEmail,

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$SqlConnectionId,

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$OneDriveConnectionId,

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    [string]$TeamsConnectionId


)

$rawJson = Join-Path $PSScriptRoot .\FixmeSettings_raw.json
$settingsJson = Join-Path $PSScriptRoot .\FixmeSettings.json

function updateActivateFlowAsUser {
    param (
        [String] $ActivateFlowUserEmail
    )

    (Get-Content $rawJson) -Replace 'ActivateFlowUserEmail', $ActivateFlowUserEmail | Set-Content $settingsJson
}

function updateConnectionIds {
    param (
        [String] $SqlConnectionId,
        [String] $OneDriveConnectionId,
        [String] $TeamsConnectionId
    )

    (Get-Content $settingsJson) -Replace 'SqlConnectionId', $SqlConnectionId | Set-Content $settingsJson
    (Get-Content $settingsJson) -Replace 'OneDriveConnectionId', $OneDriveConnectionId | Set-Content $settingsJson
    (Get-Content $settingsJson) -Replace 'TeamsConnectionId', $TeamsConnectionId | Set-Content $settingsJson

}

updateActivateFlowAsUser $ActivateFlowAsUser
updateConnectionIds $SqlConnectionId $OneDriveConnectionId $TeamsConnectionId