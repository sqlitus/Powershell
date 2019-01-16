Powershell 

# list all items matching string, select all their properties
ls -fil all*.csv | select *

# text search within all csv files
ls -fil all*.csv | select-string t.*?t

# search through folders, open
ls ../../work -r -fil *powershell-lib* | invoke-item

# search files, get properties
ls ../../work/tools -fil vba* | select *

# search files with property like value, time >= date, extension like ".filetype", etc
ls ../../work/notepad++ -fil *vb* | where{$_.length -ge 5000}
ls ../../work/notepad++ -fil *vb* | where{$_.creationtime -ge "10/5/2016"}
ls ../../work/notepad++ -fil *vb* | where{$_.extension -eq ".js"}

# regex search: find all files w/ name -match "string"
ls downloads | where {$_.name -match "skype"}



## reference: https://stackoverflow.com/questions/21310538/get-all-lines-containing-a-string-in-a-huge-text-file-as-fast-as-possible
# search & list files with text within file. 
ls -r | select-string "phil" | select-object -unique path

# ... and also output the matching line
ls -r | select-string "phil" | select-object -unique path | get-content -readcount 1000 | foreach {$_ -match "phil"}




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





$username = "" 
$password = "" 
$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.navigate("https://www.htmx") 

# if already logged in, skip some code
# https://10.2.89.122:8444/cuic/Main.htmx



# skip warning page
while($ie.ReadyState -ne 4) {start-sleep -m 500} 
$ie.document.getelementbyid("overridelink").click()

# wait for page to load
while($ie.ReadyState -ne 4) {start-sleep -m 500} 
start-sleep 1


# login
$ie.document.getElementById("j_username").value= "$username" 
$ie.document.getElementById("j_password").value = "$password" 
$ie.document.getElementById("cuesLoginSubmitButton").Click()
while($ie.ReadyState -ne 4) {start-sleep -m 500} 

# go to report
start-sleep 1
$ie.document.getElementById("reportDrawerToggler").Click()

start-sleep 1
$ie.document.getElementById("reportDrawer_22 span , reportDrawerToggler").Click()



start-sleep 1
$link = @($ie.Document.getElementsByTagName('reportDrawer_23')) | Where-Object {$_.innerText -like '*Abandoned Calls*'}
$link.click()



<#

$link = @($ie.Document.getElementsById('reportDrawer_23')) | Where-Object {$_.innerText -like '*Abandoned Calls*'}
$link.click()

start-sleep 1
$ie.document.getElementById("reportDrawer_22").Click()
start-sleep 1
$ie.document.getElementById("creportDrawer_0").Click()
start-sleep 1
$ie.document.getElementById("reportDrawer_39").Click()

# try again

# class, name*
# options index, submit

#>