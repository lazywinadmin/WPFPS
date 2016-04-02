function Enable-WPFTextBox
{
	PARAM ([System.Windows.Controls.TextBox]
		$TextBox)
	$Textbox.IsEnabled = $True
}