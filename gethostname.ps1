$ipaddress=Get-Content -Path D:\ip.txt | Where-Object {$_.Trim() -ne ''}
$csv = @()
ForEach ($i in $ipaddress){ 
$value=new-object psobject
$value | Add-Member -MemberType NoteProperty -Name IP -Value ([String]$i)
$value | Add-Member -MemberType NoteProperty -Name Hostname -Value ([System.Net.Dns]::GetHostByAddress($i).HostName)
$csv +=$value
}
$csv | Export-Csv D:\hostnames.csv