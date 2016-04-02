function Get-WPFControlProperty
{
<#
.EXAMPLE
    Get-WPFControlProperty -Control $WPFdataGrid

		MemberType       : Property
		Name             : Columns
		DeclaringType    : System.Windows.Controls.DataGrid
		ReflectedType    : System.Windows.Controls.DataGrid
		MetadataToken    : 385880271
		Module           : PresentationFramework.dll
		PropertyType     : System.Collections.ObjectModel.ObservableCollection`1[System.Windows.Controls.DataGridColumn]
		Attributes       : None
		CanRead          : True
		CanWrite         : False
		GetMethod        : System.Collections.ObjectModel.ObservableCollection`1[System.Windows.Controls.DataGridColumn] 
		                   get_Columns()
		SetMethod        : 
		IsSpecialName    : False
		CustomAttributes : {}

		MemberType       : Property
		Name             : CanUserResizeColumns
		DeclaringType    : System.Windows.Controls.DataGrid
		ReflectedType    : System.Windows.Controls.DataGrid
		MetadataToken    : 385880273
		Module           : PresentationFramework.dll
		PropertyType     : System.Boolean
		Attributes       : None
		CanRead          : True
		CanWrite         : True
		GetMethod        : Boolean get_CanUserResizeColumns()
		SetMethod        : Void set_CanUserResizeColumns(Boolean)
		IsSpecialName    : False
		CustomAttributes : {}
#>
	PARAM ($Control)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		
		Add-Type –assemblyName PresentationCore
		
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		[System.Windows.Controls.DataGrid].GetProperties()
	}
}