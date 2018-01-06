#
# Installation af webudvikler pc
#

function get_chocolatey() {
    # https://chocolatey.org/install (tjek mht proxy, og set evt: Set-ExecutionPolicy Bypass)
    
    [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function get_windowtools() {
#
# https://chocolatey.org/packages
#
    choco install chocolatey-core.extension -y
    choco install chocolateygui -y
    choco install nodejs.install -y
    choco install googlechrome -y
    choco install 7zip.install -y
    choco install visualstudiocode -y
    choco install vscode-powershell -y
    choco install vscode-icons -y
    choco install vscode-gitlens -y
    choco install git.install -y
}

function enable_windows_features() {
#
# Liste: dism /online /get-features | more 
# dism.exe -online -get-features (/disable-feature mulig)
#
}

function get_miscellaneous_tools() {
#
# npm
#
    cmd /c "refreshenv && npm install rimraf -g"
}

clear

#
# Installation
#
get_chocolatey
if( -not $?)
{
    write-host "get_chocolatey fejlede"  
    exit
}

get_windowtools
if( -not $?)
{
    write-host "get_windowtools fejlede"  
    exit
}

enable_windows_features
if( -not $?)
{
    write-host "enable_windows_features fejlede"  
    exit
}

get_miscellaneous_tools
if( -not $?)
{
    write-host "get_miscellaneous_tools fejlede"  
    exit
}
