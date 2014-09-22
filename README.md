VdoCipherSDK
=========

Language
----

ASP, ASP.NET

Version
----

Beta


Installation
--------------

Save the file VdoCipherSDK.asp at some place from where it can be included and use the following code at the place to render video.

```asp
<!--#include file="VdoCipherSDK.asp"-->
<%
  Set oVDOCIPHER = New VdoCipherSDK
  Set videoObject = oVDOCIPHER.searchByTitle("name_of_video.mp4")
  videoObject.height = "550"
  videoObject.width = "700"
  videoObject.play()
%>
```

Improvements
----
If you think this SDKcould have been better or there are more features that can be added to the SDK, please add a new issue.

License
----

MIT

---
***Reach to the audience that you deserve***

[What is VdoCipher]:http://beta.vdocipher.com/    
