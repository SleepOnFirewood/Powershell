$mailme = @(test@test.com)

 

 

$urls = @("")

$appNames = @("","","","")

 

 

$status = (get-process | ? {$_.processname -match 'Outlook'})

$outlook = new-object -comobject outlook.application

 

 

for($i =0; $i -le $mailme.Length-1; $i++)

{

 

    $theUrls = $urls[$i].split(",")

    $allUrls = ""

    foreach ($g in $theUrls)

    {

    $allUrls += "`n$g"

    }

 

    $email = $outlook.CreateItem(0)

    $email.To = $mailme[$i]

    $email.Subject = "REVISION: Bypassed " +$appNames[$i] +" Urls"

    $email.Body = "this is my email body" + $allUrls + "  "

 

    $email.Cc = "test@test.com; test@test.com"

 

    $email.Send()

    IF($status){break}

        else{$outlook.Quit()}

   

}