$SourceFilePath = "PathLocation\Imports.7z"
$SiteAddress = "SiteAddress/"
$URLDest = "{0}/{1}" -f ($SiteAddress, "Imports.7z")
$MyUsername = "MyUsername"
$MyPassword = "MyPassword"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Function Upload-File { 
    Param (
        [string]$File, 
        [string]$URI, 
        [string]$Dest,
        [string]$Username,
        [string]$Password
    )
   
    $proxy = [System.Net.WebRequest]::GetSystemWebProxy()
    $proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
    
    $WebClient = New-Object System.Net.WebClient
    $WebClient.proxy = $proxy
    
    $WebClient.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)
    
    ("*** Uploading {0} file to {1} ***" -f ($File, $URI)) | Write-Host -ForegroundColor Green
    $WebClient.UploadFile($Dest, "PUT", $File)
} 

 

Upload-File -File $SourceFilePath -URI $SiteAddress -Dest $URLDest -Username $MyUsername -Password $MyPassword
