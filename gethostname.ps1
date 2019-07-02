$ipaddress=Get-Content -Path D:\ip.txt | Where-Object {$_.Trim() -ne ''}
$csv = @()

ForEach ($i in $ipaddress){ 
  try{
    $value=new-object psobject
    $value | Add-Member -MemberType NoteProperty -Name IP -Value ($i)
    $value | Add-Member -MemberType NoteProperty -Name Hostname -Value ([System.Net.Dns]::GetHostByAddress($i).HostName)
    $csv +=$value
    }
    catch{
      Write-Host "Unable to obtain hostname from:"$i
    }
}

$csv | Export-Csv D:\hostnames.csv
