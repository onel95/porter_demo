function installModulesForMSTeamsPolicies {

    Write-Host "Installing  Microsoft Teams module"
    Install-Module -Name MicrosoftTeams -Force -AllowClobber -Scope AllUsers
    Write-Host "Installation of Microsoft Teams module completed"
}

function installAzureADModule {
    Write-Host "Installing Azure AD module"
    Install-Module AzureAD -Force -Scope AllUsers
    Write-Host "Installation of Azure AD module completed"
}

#ALSO ENSURE after installation path to PAC CLI is added to system environment variables
function installPac {
    $uri = "https://aka.ms/PowerAppsCLI"
    $out = "powerapps-cli.msi"

    Write-Host "Dowloading PAC CLI msi file"
    Invoke-WebRequest -uri $uri -OutFile $out
    Write-Host "Dowload PAC CLI msi file complete"

    Write-Host "Installing PAC CLI"
    $uri = "https://aka.ms/PowerAppsCLI"
    $out = "PowerApps-CLI.msi"
    Invoke-WebRequest -uri $uri -OutFile $out
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l .\installlog.txt"
    Write-Host "Installation of PAC CLI completed"
}

function installPacLinux {
    curl -L https://www.nuget.org/api/v2/package/Microsoft.PowerApps.CLI.Core.linux-x64/1.21.13 --output /cnab/app/pac.nuget
    cd /cnab/app/
    unzip pac.nuget
    chmod u+x /cnab/app/tools/pac
}

installModulesForMSTeamsPolicies
#installAzureADModule
#installPac # Installed in Dcokerfile.tmp linstead
