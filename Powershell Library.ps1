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



# search for files, return parent directory, and open
(ls -fil "*nemsy*" -r).Directory.FullName | Select-Object -Last 1 | ii


# total file size of directory and subfolders
write-host "Folder sizes:"
ls -dir | ForEach-Object {$_.name, "{0} MB" -f ((ls $_.name -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)}
write-host "`n"
write-host "`n"
write-host "Total size:"

"{0} MB" -f ((ls -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)
Pause
