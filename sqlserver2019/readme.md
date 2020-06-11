# Adding a new SQL Server Version

* Everything is orchestrated from the `tools\chocolateyinstall.ps1` powershell.
* A helper xlsx is used to generate the code that looks for env vars and to set the params

## Steps to create

1. Clone structure of `sqlNext` folder and rename to `sql`
1. Rename `sqlserverNext.nuspec` to `sqlserver{new_version}.nuspec`
1. Edit `*.nuspec` as required
    * Search and replace for `{Next}` with `{new_version}`
    * Add url to product page as `projectUrl`
    * Update `description`
1. Rename `docs\sqlNext_ParamGenerator.xlsx` to `docs\sql{new_version}_ParamGenerator.xlsx`
1. Update version in D2
1. Find the new version in the `Other Versions` dropdown on [MSDN](https://msdn.microsoft.com/en-us/library/ms144259(v=sql.130).aspx) and copy/paste to populate `docs\sql{new_version}_ParamGenerator.xlsx`
    * Copy/paste first 2 column of table in `Install Parameters` into columns A & B
    * Copy/paste description column into Column F.

> Hint: Uploading to Google Sheets and copy/pasting tables is less tedious

> Hint 2: Column B `Parameter` should only have one line break in it, if you notice it being split over more than Columns C & D, then you will need to clean it up.

6. Enter appropriate values for Columns E, G & K
1. Columns L, M generate Powershell for pasting into `tools\chocolateyinstall.ps1`
    * Copy/paste Column L under the comment `# Copy/paste 'Set Default' column under here`
    * Copy/paste Column M under the comment `# Copy/paste 'Write Env Var to config' column under here`
1. Search and replace `tools\chocolateyinstall.ps1` for `{Next}` with `{new_version}`
1. Delete/rename `readme.md` and rename `readme.md.final` to `readme.md`
1. Update `readme.md` as required
    * Search and replace for `{Next}` with `{new_version}`
    * Add any prerequistes

>You will need to find out how to install developer edition from CLI. This has changed through SQL editions. SQL2014 may like be SQL2016 (Special serial) or maybe SQL2012 (product edition).