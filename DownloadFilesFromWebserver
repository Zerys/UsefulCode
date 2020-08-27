# Powershell Script
# Langauge: C# 
# Written to download files from a Web Server with a proxy. 
# Uses WebClient. 

$MyUsername = "Username"
$MyPassword = "Password"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$proxy = [System.Net.WebRequest]::GetSystemWebProxy()
$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
$pair = "$($MyUsername):$($MyPassword)"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"

$Headers = @{Authorization = $basicAuthValue}
$proxy = [System.Net.WebRequest]::GetSystemWebProxy()
$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
$WebClient = New-Object System.Net.WebClient
$WebClient.proxy = $proxy
$WebClient.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)

$baseurl = "Webserver-URL"
$homeDirectory = "Location to place files"
$a = "a.7z","b.7z","c.txt.7z","d.txt.7z","e.7z"


Foreach ($i in $a)
{
    try
         {
           $url = ("{0}{1}" -f $baseurl,$i)
           ("{0}{1}" -f $baseurl,$i) | Write-Host -ForegroundColor Green
           $Response = Invoke-WebRequest -Uri $url -Headers $Headers -OutFile $homeDirectory$i -ErrorAction Stop
           $StatusCode = $Response.StatusCode
           Invoke-WebRequest -Uri $url -Headers $Headers -Method Delete -ErrorAction Stop
          }
    catch
            {
                 $StatusCode = $_.Exception.Response.StatusCode.value__
            }
            $StatusCode
            Write-Output $StatusCode

}
