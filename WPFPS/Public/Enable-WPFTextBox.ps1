function Enable-WPFTextBox
{
<#
	.SYNOPSIS
		Function to Enable a TextBox Control
	
	.DESCRIPTION
		Function to Enable a TextBox Control
	
	.PARAMETER TextBox
		Specifies the TextBox Control
	
	.EXAMPLE
		PS C:\> Enable-WPFTextBox -Textbox $TextBox1
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$Textbox.IsEnabled = $True
}