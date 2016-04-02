function Get-WPFTextBoxText
{
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$TextBox.Text
}