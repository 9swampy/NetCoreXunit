function Invoke-AppVeyorTest 
{
    [CmdletBinding()]
    param()
    
    $result = "true"
    Get-ChildItem NetCoreXunit* -Recurse -Directory | % { 
        $output = & dotnet test $_.FullName
        if ($output -notcontains "Failed: 0.")
        {
            $result = "false"
        }   
    }
    if ($result -eq "false")
    {
        exit 1
    }
}