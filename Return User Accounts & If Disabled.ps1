Import-Module activedirectory

$ResultList = Get-Content -Path \\navitus.local\navitus\Home\atw1115f\Documents\termedaccounts.txt | ForEach-Object {
    Get-ADUser -LDAPFilter "(anr=$_)" | Select-Object -Property samaccountname,name,enabled
}


#write-host $ResultList
$ResultList | Export-Csv -Path \\navitus.local\navitus\Home\atw1115f\Documents\Results.csv -NoTypeInformation 

#foreach($user in $gpADusers){
 #   $splitUsers = $user.Split(',')
  #  $ADUsers = $splitUsers.trimStart().trimEnd()
   # foreach($id in $ADUsers){
    #    get-aduser -Identity $id | select name,samaccountname
    #}
#}