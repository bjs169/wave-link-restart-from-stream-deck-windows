# wave-link-restart-from-stream-deck-windows

- Download `RestartWaveLink.bat` and put it where you want it on disk.
- Download `ScriptLaunder.vbs` and put it where you want it on disk. This is optional but it's a wrapper around BAT, CMD, and PS1 scripts that launches them without a console window popping up and disappearing. I use it for all my scheduled tasks.
- Look at `RestartWaveLinkTaskDefinition.png` and set up a scheduled task to match. Name it "Restart Wave Link". You can also look at `Restart Wave Link Clean.xml` to see the exported XML definition of the task. You won't be able to import this into Task Scheduler since I had to clean out my personal info. But it might help you if you get confused.
    - The two important settings are "Run with highest privileges" on the "General" tab and the details on the "Actions" tab.
    - Details of the action tab are in `RestartWaveLinkTaskDefinitionActionTabDetail.png`
        - Program / script should be set to `wscript.exe`
        - Add arguments should be set to: `"C:\Users\--- your-name-here ---\Documents\_BatchScipts\ScriptLaunder.vbs" "C:\Users\--- your-name-here ---\Documents\_BatchScipts\RestartWaveLink.bat"`
- Create a new button definition in Stream Deck
    - You will need the Windows Cockpit plug-in or a similar plug-in that can lanuch a command with arguments.
    - If using Windows Cockpit then choose option "#116 | Start Windows Process".
    - Set the Process Name to `"C:\Windows\System32\schtasks.exe" /run /tn "\Restart Wave Link"`
- You could skip the Task Scheduler definition and just set your SD button to call `wscript.exe "C:\Users\--- your-name-here ---\Documents\_BatchScipts\ScriptLaunder.vbs" "C:\Users\--- your-name-here ---\Documents\_BatchScipts\RestartWaveLink.bat` but . . .
    - I just have Wave Link restart every hour or so. This is fine for my workflow. Thus, my button just resues the existing task to force a restart when I need a forced restart.
    - I sometimes found I needed to be elevate to admin to kill the Wave Link process. I'd get the disruptive UAC dialog pop up. By setting the task to "Run with highest privileges" you auto-elevate to admin without UAC pop up. Cool trick. 
