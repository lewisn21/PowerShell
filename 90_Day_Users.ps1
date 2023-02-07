import-module activedirectory
$90Days = (get-date).adddays(-90)
#OUPath example - [OU] is the location to search such as All Users.  To add additional layers add more OU flags in front of all users (OU=Active Users, OU=All Users, DC...) 
#DC is the full domain broken at the period (ex. example.domain.com)
$OUPath = 'OU=All Users, DC=example, DC=domain, DC=com'
#Gets all active users within the defined OU where the password is set to expire (ignores most service accounts) and they haven't logged in for 90 days or more
Get-ADUser -properties * -filter {(enabled -eq $True) -and (PasswordNeverExpires -eq $false) -and (whencreated -le $90days) -and (lastlogondate -le $90Days)} -SearchBase $OUPath | 
select-object Name, SAMaccountname, lastlogondate | export-csv c:\Temp\90days.txt