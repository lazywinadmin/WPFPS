function Show-WPFForm
{
	PARAM (
	[Alias("Window")]	
	$Form)
	$Form.ShowDialog() | out-null
}