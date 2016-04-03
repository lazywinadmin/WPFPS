function Show-WPFForm
{
<#
	.SYNOPSIS
		Function to show the Form
	
	.DESCRIPTION
		Function to show the Form
	
	.PARAMETER Form
		Specifies the Form to Show
	
	.EXAMPLE
		PS C:\> Show-WPFForm -Form $Window
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
<#
	
	#>
	[CmdletBinding()]
	PARAM (
		[Parameter(Mandatory)]
		[Alias("Window")]
		[System.Windows.Window]
		$Form)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$Form.ShowDialog() | out-null
	}
}