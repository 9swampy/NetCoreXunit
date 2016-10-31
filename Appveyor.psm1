function Invoke-AppVeyorTest 
{
    [CmdletBinding()]
    param()
    
    $result = "true"
    Get-ChildItem NetCoreXunit* -Recurse -Directory | % { 
        $test_path = $_.FullName
        & dotnet test $test_path
        $output = & dotnet test $test_path
        if ($output -notcontains "Failed: 0.")
        {
            Write-Output "Located failed tests in $test_path"
            $result = "false"
        }
        else
        {
            Write-Output "All tests passed in $test_path"
        }  
    }
    if ($result -eq "false")
    {
        $host.ui.WriteErrorLine("Failed tests detected.")
        exit 1
    }
}