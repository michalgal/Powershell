#region SETUP

Param (
               [String]$SITE_URL = "Site_URL_here",

               [String]$GROUP_NAME = "Group_Name_here",

               [String]$CSV_LOCATION = "C:\Users\mg1\Documents\My\Temp\TestFilec.CSV"
)

#endregion

function addSP-users ($siteURL, $group_name, $csvLocation) { 
    
Begin{
#module instalation

        $a = @()
        $a = Get-InstalledModule | % {$_.name -contains "SharePointPnPPowerShell2016"}
        If($a -notcontains $true)
        {
            Try{

                Install-Module -Name SharePointPnPPowerShell2016 -Scope CurrentUser -SkipPublisherCheck -AllowClobber}

            Catch{write-host "Failed to instal module. Please download module here: https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps" -f Red}
        }

#import CSV

        Try{

            $inputCSV = Import-Csv -Path $csvLocation}

        Catch{Write-host "Failed to import CSV file, check file location" -f Red}
    }


process {

#connect to sharePoint

        ForEach ($user in $inputCSV.username)
        {
            Try{
            
                Add-PnPUserToGroup -LoginName $user -Identity $group_name}

            Catch{write-host($user + " not added to the: " + $group_name) -F Red}

        }

    }

}

#SCRIPT starts here:

Try{

    addSP-users -siteURL $SITE_URL -group_name $GROUP_NAME -csvLocation $CSV_LOCATION}

Catch{write-host $Error[0] -f red; break}

Write-Host "Finished!" -f Green