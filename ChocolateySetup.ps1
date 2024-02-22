# Prendo i permessi correnti per quanto riguarda le ExecutionPolicy
$currentExecutionPolicy = Get-ExecutionPolicy
Write-Output "La ExecutionPolicy corrente è: $currentExecutionPolicy"

# Setto una ExecutionPolicy per far funzionare il mio script
Write-Output "Sto cambiando la ExecutionPolicy…"
Set-ExecutionPolicy Bypass -Scope Process -Force
Write-Output "ExecutionPolicy cambiata con successo!"

# Salva la configurazione di sicurezza iniziale
Write-Output "Sto attivando il TSL 1.2…"
$InitialSecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol

# Attiva TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Write-Output "TSL 1.2 attivato con successo!"

# Variabile per indicare se Hashtable è stato installato in questo script
$ChocolateyHasBeenInstalled = $false

# Installo chocolatey
Write-Host "Controllo se il Chocolatey è installato..."
if (-not (Get-Command -Name choco)) {
    Write-Host "Non presente. Installazione di Chocolatey in corso..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    Write-Host "Chocolatey installato correttamente!"
    $ChocolateyHasBeenInstalled = $true
}
        
# Variabile per indicare se Hashtable è stato installato in questo script
$HashtableHasBeenInstalled = $false

# Controlla se il modulo Hashtable è già installato 
Write-Host "Controllo se il modulo Hashtable è installato..."
if (-not (Get-Module -Name Hashtable)) { 
    # Installa il modulo Hashtable
    Write-Host "Non presente. Installazione di Hashtable in corso..."
    Install-Module -Name Hashtable -Force

    Write-Host "Modulo Hashtable installato correttamente!" 
    $HashtableHasBeenInstalled = $true 
}

# Definisce un hashtable con nome software come chiave e riferimento chocolatey come valore
$SoftwareList = @{
    'Adobe Acrobat Reader' = 'adobereader'
    'Google Chrome' = 'googlechrome'
    'Firefox' = 'firefox'
    '7zip' = '7zip'
    'Notepad++' = 'notepadplusplus.install'
    'Dell Command | Update' = 'dellcommandupdate'
    'Putty' = 'putty.install'
    'WinSCP' = 'winscp'
    'Wireshark' = 'wireshark'
    'PowerToys' = 'powertoys'
    'Advanced IP Scanner' = 'advanced-ip-scanner'
    'Greenshot' = 'greenshot'
    'Audacity' = 'audacity'
    'Google Earth Pro' = 'googleearthpro'
    'FortiClient VPN' = 'forticlientvpn'
    'Remote Desktop Manager' = 'rdm'
    'OpenVPN Connect' = 'openvpn-connect'
    'AnyDesk' = 'anydesk.install'
    'TeamViewer' = 'teamviewer'
    'Zulip' = 'zulip'
    'mRemoteNG' = 'mremoteng'
}

# Crea un hashtable per memorizzare lo stato di installazione dei software
$SoftwareInstalled = @{}

# Ciclo per ogni software
$SelectedSoftware = $null
foreach ($SoftwareName in $SoftwareList.Keys) {
    $SoftwareValue = $SoftwareList[$SoftwareName]

    # Richiesta di conferma
    $InstallSoftware = Read-Host "Vuoi installare $SoftwareName? (S/n)"

    # Installazione solo se l'utente conferma
    if ($InstallSoftware -eq 'S' -or $InstallSoftware -eq 's' -or $InstallSoftware -eq '') {
        if (-not (Test-Path (Join-Path $env:ProgramFiles 'Chocolatey\bin' $SoftwareValue))) {
            choco install -y $SoftwareValue
            Write-Host "Installazione di $SoftwareName completata."
            $SoftwareInstalled[$SoftwareName] = $true
        } else {
            Write-Host "$SoftwareName è già installato!!!"
        }
    }
}

# Rimuovi Chocolatey (solo se installato in questo script)
if ($ChocolateyHasBeenInstalled)
    Write-Host "Rimuovo Chocolatey..."
    choco uninstall -y chocolatey
    Remove-Item -Path $env:ProgramData\chocolatey -Recurse -Force
    Write-Host "Chocolatey rimosso con successo!"
}

# Rimuovi Hashtable (solo se installato in questo script)
if ($HashtableHasBeenInstalled) {
    Write-Host "Rimuovo il Modulo Hashtable..."
    Uninstall-Module -Name Hashtable
    Write-Host "Modulo Hashtable rimosso con successo!"
}

# Ripristina la configurazione di sicurezza iniziale
Write-Host "Reimposto il TSL al valore di default"
[System.Net.ServicePointManager]::SecurityProtocol = $InitialSecurityProtocol
Write-Host "Valore del TSL reimpostato con successo!"

# Ripristina la ExecutionPolicy originale
Write-Output "Ripristino la ExecutionPolicy originale…"
Set-ExecutionPolicy $currentExecutionPolicy -Scope Process -Force
Write-Output "ExecutionPolicy ripristinata con successo!"

# Messaggio di completamento
Write-Host 'Installazione completata! I software selezionati sono stati installati.'

# Mostra un elenco dei software installati
Write-Host 'Software installati:'





# Prendo i permessi correnti per quanto riguarda le ExecutionPolicy
$currentExecutionPolicy = Get-ExecutionPolicy
Write-Output "La ExecutionPolicy corrente Ã¨: $currentExecutionPolicy"

# Setto una ExecutionPolicy per far funzionare il mio script
Write-Output "Sto cambiando la ExecutionPolicy..."
Set-ExecutionPolicy Bypass -Scope Process -Force
Write-Output "ExecutionPolicy cambiata con successo!"

# Salva la configurazione di sicurezza iniziale
Write-Output "Sto attivando il TSL 1.2..."
$InitialSecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol

# Attiva TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Write-Output "TSL 1.2 attivato con successo!"

# Variabile per indicare se Hashtable e' stato installato in questo script
$ChocolateyHasBeenInstalled = $false

# Installo chocolatey
Write-Host "Controllo se il Chocolatey e' installato..."
if (-not (Get-Command -Name choco)) {
    Write-Host "Non presente. Installazione di Chocolatey in corso..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    Write-Host "Chocolatey installato correttamente!"
    $ChocolateyHasBeenInstalled = $true
}

# Definisce un hashtable con nome software come chiave e riferimento chocolatey come valore
$SoftwareList = @{
    'Adobe Acrobat Reader' = 'adobereader'
    'Google Chrome' = 'googlechrome'
    'Firefox' = 'firefox'
    '7zip' = '7zip'
    'Notepad++' = 'notepadplusplus.install'
    'Dell Command | Update' = 'dellcommandupdate'
    'Putty' = 'putty.install'
    'WinSCP' = 'winscp'
    'Wireshark' = 'wireshark'
    'PowerToys' = 'powertoys'
    'Advanced IP Scanner' = 'advanced-ip-scanner'
    'Greenshot' = 'greenshot'
    'Audacity' = 'audacity'
    'Google Earth Pro' = 'googleearthpro'
    'FortiClient VPN' = 'forticlientvpn'
    'Remote Desktop Manager' = 'rdm'
    'OpenVPN Connect' = 'openvpn-connect'
    'AnyDesk' = 'anydesk.install'
    'TeamViewer' = 'teamviewer'
    'Zulip' = 'zulip'
    'mRemoteNG' = 'mremoteng'
}

# Crea un hashtable per memorizzare lo stato di installazione dei software
$SoftwareInstalled = @{}

# Ciclo per ogni software
$SelectedSoftware = $null
foreach ($SoftwareName in $SoftwareList.Keys) {
    $SoftwareValue = $SoftwareList[$SoftwareName]

    # Richiesta di conferma
    $InstallSoftware = Read-Host "Vuoi installare"$SoftwareName"? (S/n)"

    # Installazione solo se l'utente conferma
    if ($InstallSoftware -eq 'S' -or $InstallSoftware -eq 's' -or $InstallSoftware -eq '') {
        if (-not (Test-Path (Join-Path $env:ProgramFiles 'Chocolatey\bin' ($SoftwareValue)))) {
            choco install -y $SoftwareValue
            Write-Host "Installazione di $SoftwareName completata."
            $SoftwareInstalled[$SoftwareName] = $true
        } else {
            Write-Host "$SoftwareName e' già  installato!!!"
        }
    }
}

# Rimuovi Chocolatey (solo se installato in questo script)
if ($ChocolateyHasBeenInstalled){
    Write-Host "Rimuovo Chocolatey..."
    choco uninstall -y chocolatey
    Remove-Item -Path $env:ProgramData\chocolatey -Recurse -Force
    Write-Host "Chocolatey rimosso con successo!"
}

# Ripristina la configurazione di sicurezza iniziale
Write-Host "Reimposto il TSL al valore di default"
[System.Net.ServicePointManager]::SecurityProtocol = $InitialSecurityProtocol
Write-Host "Valore del TSL reimpostato con successo!"

# Ripristina la ExecutionPolicy originale
Write-Output "Ripristino la ExecutionPolicy originale..."
Set-ExecutionPolicy $currentExecutionPolicy -Scope Process -Force
Write-Output "ExecutionPolicy ripristinata con successo!"

# Messaggio di completamento
Write-Host 'Installazione completata! I software selezionati sono stati installati.'

# Mostra un elenco dei software installati
Write-Host 'Software installati:'
foreach ($SoftwareName in $SoftwareInstalled.Keys) {
    Write-Host " - $SoftwareName"
}

foreach ($SoftwareName in $SoftwareInstalled.Keys) {
    Write-Host " - $SoftwareName"
}
