# Powershell Commands

- list all items w/ filter string, select all their properties
ls -fil all*.csv | select *

- text search in files
ls -fil all*.csv | select-string t.*?t
