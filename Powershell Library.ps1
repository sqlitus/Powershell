Powershell 

# list all items matching string, select all their properties
ls -fil all*.csv | select *

# text search within files
ls -fil all*.csv | select-string t.*?t

# search through folders, open
ls ../../work -r -fil *powershell-lib* | invoke-item