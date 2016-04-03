function Enable-WPFButton
{
<#
	.SYNOPSIS
		Function to Enable a Button control
	
	.DESCRIPTION
		Function to Enable a Button control
	
	.PARAMETER Button
		Specifies the Button Control
	
	.EXAMPLE
		PS C:\> Enable-WPFButton -Button $Button1
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $true
}