function Show-WPFForm
{
	PARAM (
		[Parameter(Mandatory)]
		[Alias("Window")]
		[System.Windows.Window]
		$Form)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$Form.ShowDialog() | out-null
	}
}