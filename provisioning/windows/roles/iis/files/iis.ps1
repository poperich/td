Install-WindowsFeature -name Web-Server -IncludeManagementTools

Import-Module "WebAdministration"

$iisAppName = "TestSystems"
$directoryPath = "C:\TestSystems"
$iisAppPoolName = "testAppPool"
New-Item C:\$iisAppName -force -type Directory
Set-Content -force $directoryPath\Default.htm '<html><head><title>Benvenuto</title></head><body><div align=”center”>Hello TestSystems!</div></body></html>'


New-WebAppPool -force $iisAppPoolName
New-WebSite -force -Name TestSystems -Port 80 -HostHeader $iisAppName -PhysicalPath "C:\TestSystems" -ApplicationPool $iisAppPoolName
New-WebBinding -force -Name TestSystems -IPAddress "*"  -Port 80 -HostHeader systems.test
New-WebBinding -force -Name TestSystems -IPAddress "*" -Port 80 -HostHeader vagrant.systems

Invoke-WebRequest 'http://localhost' -Headers @{host="TestSystems"}
Invoke-WebRequest 'http://localhost' -Headers @{host="systems.test"} 
Invoke-WebRequest 'http://localhost' -Headers @{host="vagrant.systems"} 