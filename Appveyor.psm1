function Invoke-AppVeyorTest 
{
    [CmdletBinding()]
    param()
    
    $result = "true"
    Get-ChildItem NetCoreXunit* -Recurse -Directory | % { 
        $test_path = $_.FullName
        $output = & dotnet test $test_path
        if ($output.contains(", Failed: 0."))
        {
            Write-Output "All tests passed in $test_path"
        }
        else
        {
            Write-Output "Located failed tests in $test_path"
            $result = "false"
        }  
    }
    if ($result -eq "false")
    {
        $host.ui.WriteErrorLine("Failed tests detected.")
        exit 1
    }
}