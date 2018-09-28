# Enable "Open PowerShell window here" in right click context menu

1. Open Registry Editor.
1. Go to the locations respectively:
   * HKEY_CLASSES_ROOT\Directory\shell\Powershell
   * HKEY_CLASSES_ROOT\Directory\Background\shell\Powershell
   * HKEY_CLASSES_ROOT\Drive\shell\Powershell
1. For each key,

    * Right click the key on the left panel, `Permissions`, `Advanced`, change the owner to `Admistrators`
    * Assign `Full Control` - `Allow` to `Admistrators`
    * For each key, delete the `Extended` key on the right panel.
