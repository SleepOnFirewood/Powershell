$servers = @("domain names")

 

Get-Content "C:\Users\_\Documents\ids.txt" |

 

ForEach-Object {

 

    foreach ($server in $servers) {

 

        $aduser = Get-ADUser -Filter "SamAccountName -eq '$_'" -Properties Name, Mail,UserPrincipalName -Server $server | Select-Object UserPrincipalName

 

        if ($aduser) {

 

            $aduser # send object down the pipeline

 

            break   # break out of server loop and move to next user

 

        }

    }

 

} | Export-Csv 'C:\temp\testemail.csv' -NoTypeInformation