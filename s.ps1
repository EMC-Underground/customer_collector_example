#!/usr/bin/pwsh
$user = (get-childitem -path env:\VSPHERE_USERNAME).value
$password = (get-childitem -path env:\VSPHERE_PASSWORD).value
$vsphere = (get-childitem -path env:\VCENTER).value
$vsphere_name = (get-childitem -path env:\NAME).value
Connect-VIserver $vsphere -user $user -password $password
#$cluster = get-cluster | select-object name
#Write-output $cluster
Write-Host "Getting all clusters from ${vsphere_name}"
get-cluster | select-object -expandproperty name | sort-object name
Write-Host "Sending to a fancy API"
#$csv_output = get-content -Path report\test.csv
