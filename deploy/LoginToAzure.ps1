# Install Az module if not already installed
if (-not (Get-Module -Name Az -ListAvailable)) {
    Install-Module -Name Az -Force -AllowClobber -Scope CurrentUser
}

# Import the Az module
Import-Module Az

# Log in to Azure
Connect-AzAccount

# List available subscriptions and prompt user to select one
$subscriptions = Get-AzSubscription | Out-GridView -OutputMode Single -Title "Select Azure Subscription"
Set-AzContext -SubscriptionId $subscriptions.Id

# Display the selected subscription
Write-Host "Logged in to Azure and selected subscription: $($subscriptions.Name)"
