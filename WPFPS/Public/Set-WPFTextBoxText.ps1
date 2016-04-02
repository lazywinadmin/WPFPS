function Set-WPFTextBoxText
{
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox,
		
		[String]$Text)
	$TextBox.Text = $Text
}