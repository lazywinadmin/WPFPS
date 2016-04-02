Function Get-WPFFormVariable
{
	PARAM ($Name)
	if ($Name)
	{
		Get-Variable $Name
	}
	else { Get-Variable }
}