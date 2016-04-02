Function Set-WPFFormVariable
{
	[CmdletBinding()]
	PARAM (
		[parameter(Mandatory)]
		[alias("Window")]
		$Form,
		
		[parameter(Mandatory)]
		[XML]$XAML,
		
		$Prefix="WPF")
	
	BEGIN
	{
		$GUI = $XAML.SelectNodes("//*[@Name]")
	}
	PROCESS
	{
		IF ($PSBoundParameters['Prefix'])
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "$Prefix$($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
		ELSE
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
	} #Process
}