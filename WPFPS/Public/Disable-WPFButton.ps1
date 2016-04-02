function Disable-WPFButton
{
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $false
}