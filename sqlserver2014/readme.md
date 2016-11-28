# TODO
This hasn't been completed yet as I don't have any SQL2014 apps.

* Everything is orchestrated from the `tools\chocolateyinstall.ps1` powershell.
* A helper xls is used to generate the code that looks for env vars and to set the params

## Steps to create

* Clone structure of `sql2016` folder
* Edit `*.nuspec` as required
* Rename `docs\sql2016_ParamGenerator.xlsx` to `docs\sql2014_ParamGenerator.xlsx`
* Use [MSDN](https://msdn.microsoft.com/en-us/library/ms144259(v=sql.120).aspx) to copy/paste populate `docs\sql2014_ParamGenerator.xlsx` - columns A through F. This is tedious but necessary. 
* Decide on defaults for columns G-L
* Columns M, N, O generate Powershell for pasting into `tools\chocolateyinstall.ps1`
* Search and replace `tools\chocolateyinstall.ps1` for `2016` with `2014`
* Update `readme.md` as required
* You will need to find out how to install developer edition from CLI. This has changed through SQL editions. SQL2014 may like be SQL2016 (Special serial) or maybe SQL2012 (product edition).  