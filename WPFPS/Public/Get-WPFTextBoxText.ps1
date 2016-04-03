function Get-WPFTextBoxText
{
<#
	.SYNOPSIS
		Function to get the text from the TextBox Control
	
	.DESCRIPTION
		Function to get the text from the TextBox Control
	
	.PARAMETER TextBox
		Specifies the TextBox Control
	
	.EXAMPLE
		PS C:\> Get-WPFTextBoxText -TextBox $TextBox1
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$TextBox.Text
}