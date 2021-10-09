new-eventlog -LogName "WVD" -Source "WVD"

$msg = $env:UserName

Write-EventLog -LogName "WVD" -Source "WVD" -EventID 3001 -EntryType Information -Message $msg -Category 1 -RawData 10,20
