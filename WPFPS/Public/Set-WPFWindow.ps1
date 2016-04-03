function Set-WPFWindow
{
<#
	.SYNOPSIS
		Function to set properties on the Window Control
	
	.DESCRIPTION
		Function to set properties on the Window Control
	
	.PARAMETER Window
		Specifies the Window Control
	
	.PARAMETER Title
		Specifies the Title to set on the Window
	
	.EXAMPLE
		PS C:\> Set-WPFWindow -Window $Window -Title 'Super GUI'
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM (
		[parameter(Mandatory)]
		[Alias('Form')]
		[System.Windows.Window]
		$Window,
		
		[String]$Title
	)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSBoundParameters['Title'])
		{
			$Window.Title = $Title
		}
	}
}