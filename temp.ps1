$securePassword = ConvertTo-SecureString "dRoFOzU!1D4@j&D4*#tR" -AsPlainText -force
$credential = New-Object System.Management.Automation.PsCredential("mobiuslogic.com\itadmin",$securePassword)
$session = New-PSSession -computername hostname -credential $credential
$command = {$connectTestResult = Test-NetConnection -ComputerName nistpocfilesharesa.file.core.windows.net -Port 445
    if ($connectTestResult.TcpTestSucceeded) {
        # Mount the drive
        New-PSDrive -Name Z -PSProvider FileSystem -Root "\\nistpocfilesharesa.file.core.windows.net\profiles" -Persist
    } else {
        Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
    }}
Invoke-Command -session $session -scriptblock $command
