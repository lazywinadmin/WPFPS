# WPFPS

The WPFPS powershell module allows you to interact with Windows Presentation Foundation (WPF) controls.

If you are among those creating complexe/advanced PowerShell Graphical User Interface, you will realize the need for functions to interact with the different Controls.

If your need is only to create simple GUI, without too many controls you might want to take a look at [ShowUI](https://showui.codeplex.com/).


## Installation
#### Download from PowerShell Gallery
```powershell
Install-Module -Name WPFPS
```
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

## Help !!
Would love contributors, suggestions, feedback, and other help! Feel free to open an Issue


## Examples

[Some example here](https://github.com/lazywinadmin/WPFPS/tree/master/Examples)

![Alt text](/Examples/WPFDataGrid02/WPFDataGrid02.jpg?raw=true "DataGrid Example")


## More Information
![Alt text](/Examples/WPFListBox01/WPFListBox01.jpg "ListBox Example")


## Resources
* [WPF Samples(Microsoft's github repo)](https://github.com/Microsoft/WPF-Samples/)
* [WPFTutorials.net](http://www.wpftutorial.net/)
* [WPF-Tutorial.com](http://www.wpf-tutorial.com/)
* [Code Project - WPF Controls](http://www.codeproject.com/KB/WPF/#Controls)

## Notes

