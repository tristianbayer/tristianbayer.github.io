<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="placeholder"
version="1.0">
<output method="text"/>
	<ms:script implements-prefix="user" language="JScript">
	<![CDATA[
	var oShell = new ActiveXObject("Shell.Application");
	var currentDir = oShell.NameSpace(0).Self.Path;
	var commandtoRun = currentDir + "\\notepad++.exe";
	oShell.ShellExecute(commandtoRun,"","","open","0");
	]]> </ms:script>
</stylesheet>
