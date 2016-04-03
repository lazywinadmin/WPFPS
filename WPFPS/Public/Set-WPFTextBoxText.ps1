function Set-WPFTextBoxText
{
<#
	.SYNOPSIS
		function to set the Text property on a TextBox control
	
	.DESCRIPTION
		function to set the Text property on a TextBox control
	
	.PARAMETER TextBox
		Specifies the TExtBox Control
	
	.PARAMETER Text
		Specifies the Text property value
	
	.EXAMPLE
		PS C:\> Set-WPFTextBoxText -TextBox $TextBox1 -Text 'Some text here'
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM (
		[Parameter(Mandatory)]
		[System.Windows.Controls.TextBox]
		$TextBox,
		
		[String]$Text)
		$TextBox.Text = $Text
}