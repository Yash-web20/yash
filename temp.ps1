new-eventlog -LogName "WVD" -Source "WVD"
try {
    $connectTestResult = Test-NetConnection -ComputerName nistpocfilesharesa.file.core.windows.net -Port 445
    if ($connectTestResult.TcpTestSucceeded) {
        # Mount the drive
        New-PSDrive -Name Z -PSProvider FileSystem -Root "\\nistpocfilesharesa.file.core.windows.net\profiles" -Persist
        Write-EventLog -LogName "WVD" -Source "WVD" -EventID 3001 -EntryType Information -Message "SucessFulll Mount The Drive" -Category 1 -RawData 10,20
    } else {
        Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
        Write-EventLog -LogName "WVD" -Source "WVD" -EventID 3001 -EntryType Information -Message "Error Mount The Drive" -Category 1 -RawData 10,20
    }

    Write-EventLog -LogName "WVD" -Source "WVD" -EventID 3001 -EntryType Information -Message "Sucess" -Category 1 -RawData 10,20
}
catch {
    Write-EventLog -LogName "WVD" -Source "WVD" -EventID 3001 -EntryType Information -Message "Fail" -Category 1 -RawData 10,20
    
}
