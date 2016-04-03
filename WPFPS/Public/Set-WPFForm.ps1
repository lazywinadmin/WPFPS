function Set-WPFForm
{
	PARAM (
		[System.Windows.Window]$Form,
		[String]$Title
	)
	BEGIN 
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSBoundParameters['Title'])
		{
			$Form.Title = $Title
		}
	}
	END
	{
		
	}
}