function Add-WPFDataGridRow
{
<#
	.SYNOPSIS
		This function add a row to a DataGrid
	
	.DESCRIPTION
		This function add a row to a DataGrid

        By default it will add an empty row (if -values is not specified)
	
	.PARAMETER DataGrid
		Specifies the DataGridView Control to use
	
	.PARAMETER Values
		Specities the values to add
	
	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1
	
		Add an empty row
	
	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1 -Values "Francois-Xavier","Cat","fxcat"
	
		Add a row with the values specified.

	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1 -Object (Get-Process|select name,id.path)
	
		Add an object to the Datagrid. The column must exist
	
	.NOTES
		Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding(DefaultParameterSetName = 'EmptyRow')]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
		[Parameter(ParameterSetName = 'Row')]
		[Array]$Values,

        [Parameter(ParameterSetName = 'Object')]
        $Object
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSCmdlet.ParameterSetName -eq 'EmptyRow')
		{
            $Row = $DataGrid.ItemsSource.Table.NewRow()
			$DataGrid.ItemsSource.Table.Rows.add()
		}
		ELSEIF ($PSCmdlet.ParameterSetName -eq 'Row')
		{
			$Row = $DataGrid.ItemsSource.Table.NewRow()
            $Row.ItemArray = $Values
            $DataGrid.ItemsSource.Table.Rows.add($row)
		}
        ELSEIF ($PSCmdlet.ParameterSetName -eq 'Object')
		{
            Foreach ($i in $Object)
            {
                $Row = $DataGrid.ItemsSource.Table.NewRow()
                $RowProps = ($row|gm -MemberType Properties).name

                ($i|gm -MemberType Properties).name|%{
                    if ($RowProps -contains $_)
                    {
                        $row.$_ = $i.$_
                    }
                }
                $DataGrid.ItemsSource.Table.Rows.add($row)
            }
        }
	}
}