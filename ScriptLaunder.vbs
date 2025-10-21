Set objShell = CreateObject("WScript.Shell")
Set objArgs = WScript.Arguments
If objArgs.Count = 0 Then
    WScript.Echo "No script specified."
    WScript.Quit 1
End If

targetScript = objArgs(0)

Select Case LCase(Right(targetScript, 4))
    Case ".bat", ".cmd"
        objShell.Run "cmd.exe /c """ & targetScript & """", 0, True
    Case ".ps1"
        objShell.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & targetScript & """", 0, True
    Case Else
        objShell.Run """" & targetScript & """", 0, True
End Select
