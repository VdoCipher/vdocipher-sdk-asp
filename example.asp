<!--#include file="VdoCipherSDK.asp"-->
<!DOCTYPE html>
<html>
<head>
	<title>SDK ASP Example</title>
</head>
<body>
<%
	videoObject = new VDO
	videoObject.id = "video_id"
	videoObject.height = "550"
	videoObject.width = "700"
	videoObject.play()
 End If
 %>
 <br />
 A text after the video
</body>
</html>
