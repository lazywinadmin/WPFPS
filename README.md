# WPFPS

The WPFPS powershell module allows you to interact with Windows Presentation Foundation (or WPF) controls.

If you are among those creating complexe/advanced PowerShell Graphical User Interface, you will realize the need for functions to interact with the different Controls.

![alt text](https://raw.githubusercontent.com/lazywinadmin/WPFPS/master/Examples/WPFDataGrid02/WPFDataGrid02.jpg "DataGrid Example")

If your need is only to create simple GUI, without too many controls you might want to take a look at [ShowUI](https://showui.codeplex.com/).

## Installation
#### Download from PowerShell Gallery
Coming soon...
#### Download from GitHub repository

* Download the repository
* Unblock the zip file
* Extract the folder to a module path (e.g. $home\Documents\WindowsPowerShell\Modules)


## Usage

```powershell

# Import the module.
Import-Module -Name WPFPS

# Get the commands available
Get-Command -Module WPFPS

# Get help
Get-Help Get-WPFForm
```

You would most likely copy the functions you need inside your GUI project

# Cmdlets
* Add-WPFComboBoxItem
* Add-WPFDataGridRow
* Add-WPFListBoxItem
* Clear-WPFDataGrid
* Clear-WPFListBox
* Clear-WPFRichTextBox
* Disable-WPFButton
* Disable-WPFTextBox
* Enable-WPFButton
* Enable-WPFTextBox
* Get-WPFListBoxItem
* Get-WPFTextBoxText
* Import-WPFDataGrid
* New-WPFInputBox
* New-WPFMessageBox
* New-WPFOpenFileDialog
* New-WPFOpenFolderDialog
* New-WPFSpeakerBeep
* Remove-WPFComboBoxItem
* Remove-WPFListBoxItem
* Set-WPFListBox
* Set-WPFTextBoxText
* Set-WPFWindow
* Set-WPFWindowVariable
* Show-WPFWindow
* Update-WPFDataGrid

# Examples

[Some example here](https://github.com/lazywinadmin/WPFPS/tree/master/Examples)

# Resources

* [WPF Samples(Microsoft's github repo)](https://github.com/Microsoft/WPF-Samples/)
* [WPFTutorials.net](http://www.wpftutorial.net/)
* [WPF-Tutorial.com](http://www.wpf-tutorial.com/)
* [Code Project - WPF Controls](http://www.codeproject.com/KB/WPF/#Controls)
