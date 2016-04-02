function Find-WPFControl
{
	PARAM($Form,$ControlName)
	$Form.FindName("$ControlName")
}