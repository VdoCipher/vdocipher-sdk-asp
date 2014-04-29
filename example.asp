<!--#include file="VdoCipherSDK.asp"-->
<!DOCTYPE html>
<html>
<head>
	<title>SDK ASP Example</title>
</head>
<body>
<%
 Set oVDOCIPHER = New VdoCipherSDK
 Set videoObject = oVDOCIPHER.searchByTitle("name_of_video.mp4")
	videoObject.height = "550"
	videoObject.width = "700"
	videoObject.play()
 %>
 
</body>
</html>
