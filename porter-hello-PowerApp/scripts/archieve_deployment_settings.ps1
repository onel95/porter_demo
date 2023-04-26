
$settingsJson = Join-Path $PSScriptRoot .\FixmeSettings.json

function achieveFile {
    if (Test-Path $settingsJson) {
        Write-Host "Renaming the FixmeSettings.json"
        $fileObj = get-item $settingsJson
        $DateStamp = get-date -uformat "%Y-%m-%d@%H-%M-%S"
        $extOnly = $fileObj.extension
        if ($extOnly.length -eq 0) {
        $nameOnly = $fileObj.Name
        rename-item "$fileObj" "$nameOnly-$DateStamp"
        }
        else {
        $nameOnly = $fileObj.Name.Replace( $fileObj.Extension,'')
        rename-item "$settingsJson" "$nameOnly-$DateStamp$extOnly"
        }
        Write-Host "Renaming the FixmeSettings.json completed"
    }
}

achieveFile

