#./scripts/set_variables.ps1
$TargetTenantId = "51050b0f-0a71-472f-b0b8-03e51aed84e2"
$HelpDeskUserName = "admin@CRM465671.onmicrosoft.com"
$HelpDeskUserPswd = "0vk]XOND7$06[e^x"
$TargetEnvironment = "CRM465671"
$SolutionName = "FixmeSolution"
$SolutionFilePath = "./Solution/FixmeSolution.zip"
$SettingsFilePath = "./Solution/FixmeSettings_raw.json"
$TargetProfileName = "power-platform-admin"

./scripts/import_powerplatform_solution.ps1 $TargetTenantId $HelpDeskUserName $HelpDeskUserPswd $TargetEnvironment $SolutionName $SolutionFilePath $SettingsFilePath $TargetProfileName

