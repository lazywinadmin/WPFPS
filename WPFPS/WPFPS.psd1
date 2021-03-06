@{

# Script module or binary module file associated with this manifest.
RootModule = 'WPFPS.psm1'

# Version number of this module.
ModuleVersion = '1.0.0.0'

# ID used to uniquely identify this module
GUID = '85d58d70-0e67-4c08-8ecc-fd15dbe23861'

# Author of this module
Author = 'Francois-Xavier Cat'

# Company or vendor of this module
CompanyName = 'Lazywinadmin.com'

# Copyright statement for this module
Copyright = '(c) 2016 Francois-Xavier Cat. All rights reserved. Licensed under The MIT License (MIT)'

# Description of the functionality provided by this module
Description = 'The WPFPS powershell module allows you to interact with Windows Presentation Foundation (WPF) controls'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-WPFComboBoxItem','Add-WPFDataGridRow','Add-WPFListBoxItem','Clear-WPFDataGrid','Clear-WPFListBox','Clear-WPFRichTextBox','Disable-WPFButton','Disable-WPFTextBox','Enable-WPFButton','Enable-WPFTextBox','Get-WPFListBoxItem','Get-WPFTextBoxText','Import-WPFDataGrid','New-WPFInputBox','New-WPFMessageBox','New-WPFOpenFileDialog','New-WPFOpenFolderDialog','New-WPFSpeakerBeep','Remove-WPFComboBoxItem','Remove-WPFListBoxItem','Set-WPFListBox','Set-WPFProgressBar','Set-WPFTextBoxText','Set-WPFWindow','Set-WPFWindowVariable','Show-WPFWindow','Update-WPFDataGrid'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
#CmdletsToExport = '*'

# Variables to export from this module
#VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
#AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'WPF', 'WindowsPresentationFoundation', 'GUI', 'UI'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/lazywinadmin/WPFPS/blob/master/LICENSE.md'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/lazywinadmin/WPFPS/'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}