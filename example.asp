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
 If Not videoObject is Nothing Then
	videoObject.height = "550"
	videoObject.width = "700"
	videoObject.play()
 End If
 %>
 <br />
 A text after the video
</body>
</html>
