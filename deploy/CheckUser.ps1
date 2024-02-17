param(
    [string]$UserEmail,
    [string]$AzureTenantId
)

# Überprüfen, ob beide Parameter angegeben wurden
if (-not $UserEmail -or -not $AzureTenantId) {
    Write-Host "Bitte geben Sie sowohl die Benutzer-E-Mail-Adresse als auch die Azure-Tenant-ID an."
    exit
}

# Installieren Sie das Az-Modul, wenn es nicht bereits installiert ist
# Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser

# Anmelden beim Azure AD-Tenant
Connect-AzAccount -Tenant $AzureTenantId

# Benutzer abrufen
$user = Get-AzADUser -UserPrincipalName $UserEmail -ErrorAction SilentlyContinue

if ($user) {
    Write-Host "Benutzer gefunden:"
    Write-Host "Benutzername: $($user.UserPrincipalName)"
    Write-Host "Display Name: $($user.DisplayName)"
    Write-Host "Objekt-ID: $($user.Id)"
} else {
    Write-Host "Benutzer mit E-Mail-Adresse '$UserEmail' im Azure-Tenant '$AzureTenantId' nicht gefunden."
}

# Abmelden vom Azure-Konto (optional)
Disconnect-AzAccount
