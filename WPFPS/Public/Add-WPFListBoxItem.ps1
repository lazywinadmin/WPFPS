function Add-WPFListBoxItem
{
<#

#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		$Items,
		
		[Switch]$Append
		
	)
	BEGIN
	{
		#Add-Type -AssemblyName System.Windows.Controls
	}
	PROCESS
	{
		IF (-not $PSBoundParameters['Append'])
		{
			# Clear ListBox
			$ListBox.items.Clear()
		}
		
		# Add Items
		FOREACH ($item in $Items)
		{
			$ListBox.Items.Add($item)
		}
	} #PROCESS
}