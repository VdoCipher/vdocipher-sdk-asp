<%
Class VdoCipherSDK
    Public clientSecretKey
    Public Property Get Secret()	
        Secret = clientSecretKey
    End Property
    Public Property Set Secret(sMsg)	
        clientSecretKey = sMsg
    End Property
    Private Sub Class_Initialize()	
        clientSecretKey = "CLIENT_SECRET_KEY"
    End Sub
    Public Function searchByTitle(title)	
		Set id = vdocipher_sendCommand("searchVideo", "videoName="+title)
		Set oVDO = new VDO
		oVDO.id=  id.getElementsByTagName("videoId").item(0).text
        Set searchByTitle = oVDO
    End Function

    Private Sub Class_Terminate()	
    End Sub
End Class

Public Function vdocipher_sendCommand(action, getData)
	Set ServerXmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
	ServerXmlHttp.open "POST", "http://www.vdocipher.com/api/" + action + "?"+getData + "&type=xml"
	ServerXmlHttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
	if (new VdoCipherSDK).clientSecretKey = "CLIENT_SECRET_KEY" Then
		Call Err.Raise(60001, "vdocipher", "Client key is not configured.")
	End If
	ServerXmlHttp.send("clientSecretKey="+(new VdoCipherSDK).clientSecretKey)
	if Not ServerXmlHttp.status = 200 Then
		Call Err.Raise(60001, "vdocipher", "Invalid Response from server " + CStr(ServerXmlHttp.status))
	End If
	Set vdocipher_sendCommand = ServerXmlHttp.ResponseXML
End Function

Class VDO
	Public title
	Public otp
	Public height
	Public width
	Public id

	Public Function getVideoInfo()
		Response.Write("video info is not yet implemented")
	End Function
	Public Sub play()
		Set otp = vdocipher_sendCommand("otp", "videoId="+id)
		if not IsNull(otp) Then
			otp_value = otp.getElementsByTagName("otp").item(0).text
			Response.Write("<div id='vdo"+ otp_value +"' ></div>")
			Response.Write("<scr"+"ipt src='https://de122v0opjemw.cloudfront.net/utils/playerInit.php?otp="+otp_value+"&height="+height+"&width="+width+"'></"+"scr"+"ipt>")
		End If
	End Sub
End Class
%>
