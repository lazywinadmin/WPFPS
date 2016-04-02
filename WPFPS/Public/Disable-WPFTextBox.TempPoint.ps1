function Disable-WPFTextBox
{
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$Textbox.IsEnabled = $false
}