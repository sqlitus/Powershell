Powershell 

# list all items matching string, select all their properties
ls -fil all*.csv | select *

# text search within files
ls -fil all*.csv | select-string t.*?t

# search through folders, open
ls ../../work -r -fil *powershell-lib* | invoke-item

# search files, get properties
ls ../../work/tools -fil vba* | select *

# search files with property like value, time >= date, extension like ".filetype", etc
ls ../../work/notepad++ -fil *vb* | where{$_.length -ge 5000}
ls ../../work/notepad++ -fil *vb* | where{$_.creationtime -ge "10/5/2016"}
ls ../../work/notepad++ -fil *vb* | where{$_.extension -eq ".js"}




# log into website...
$username = "asdf" 
$password = "asdf" 
$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.navigate("https://asdf.htmx") 

# login
while($ie.ReadyState -ne 4) {start-sleep -m 500} 
$ie.document.getElementById("j_username").value= "$username" 
$ie.document.getElementById("j_password").value = "$password" 
$ie.document.getElementById("cuesLoginSubmitButton").Click()
while($ie.ReadyState -ne 4) {start-sleep -m 500} 

# go to report
$ie.document.getElementById("reportDrawer").Click()

# try again

# class, name*
# options index, submit