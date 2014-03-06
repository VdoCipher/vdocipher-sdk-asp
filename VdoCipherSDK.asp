<SCRIPT LANGUAGE=JavaScript RUNAT=SERVER>
	var VDOCIPHER = {
		PostData: "clientSecretKey=b60ea897b1b19bc5586b03b9daf6decef6ba21de3737ca8234c5de2169ae0b87",
		type: "xml",
		maxSeek: 25,
		maxData: 250,
		findByTitle: function(query){
			this.sendCommand()
		},
		createOtp: function(){
			this.sendCommand()
		},
		sendCommand: function(action, getData){
			var ServerXmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
			ServerXmlHttp.open("POST", "http://beta.vdocipher.com/index.php/?r=api/" + action + "&"+getData + "&type=xml")
			ServerXmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
			ServerXmlHttp.send(this.PostData)
			//Response.Write(ServerXmlHttp.responseText)
			if(ServerXmlHttp.status == 200)
				return ServerXmlHttp.responseXML
			return null
		},
		playByTitle: function(title){
			videoId = this.sendCommand('searchVideo', "videoName="+title)
			videoId = videoId.getElementsByTagName('videoId')[0].text
			otp = this.sendCommand('otp', 'videoId='+videoId)
			otp = otp.getElementsByTagName('otp')[0].text
			this.playByOtp(otp)
		},
		playByOtp: function(otp){
			Response.Write('<iframe src="http://videos.vdocipher.com/utils/newplayer.php?autoplay=false&h=')
			Response.Write(otp)
			Response.Write('" scrolling="no" style="border:1px solid #999999;width:640px;height:400px;background-color:#999999"></iframe>')
		}
	}
</SCRIPT>
