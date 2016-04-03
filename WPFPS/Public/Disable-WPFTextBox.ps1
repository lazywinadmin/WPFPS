function Disable-WPFTextBox
{
<#
	.SYNOPSIS
		Function to disable a TextBox Control
	
	.DESCRIPTION
		Function to disable a TextBox Control
	
	.PARAMETER TextBox
		Specifies the TextBox Control
	
	.EXAMPLE
		PS C:\> Disable-WPFTextBox -Textbox $TextBox1
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$Textbox.IsEnabled = $false
}