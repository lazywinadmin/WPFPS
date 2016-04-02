function Enable-WPFButton
{
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $true
}