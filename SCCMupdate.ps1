param (
    [string]$ComputerName = $env:computername
)
try {
	$SCCMClient = [wmiclass] "\\$ComputerName\root\ccm:sms_client"
	$SCCMClient.RequestMachinePolicy() | Out-Null
	$SCCMClient.EvaluateMachinePolicy() | Out-Null
	echo "Updated SCCM Machine Policy on $ComputerName."
}
catch {
	echo "Failed to update SCCM Machine Policy on $ComputerName."
	exit(1)
}