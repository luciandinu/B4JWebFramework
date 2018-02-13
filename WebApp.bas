﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Handler class
Sub Class_Globals
	Dim FIXED_LAYOUT = True As Boolean
End Sub

Public Sub Initialize

End Sub

Sub Handle(req As ServletRequest, resp As ServletResponse)
	
'	Dim mPage As Object = LWAppShared.LWPages.GetValueAt(0) 'Need to change this
''	Contructor For page layout
'	If SubExists(mPage, "HTML_Layout") Then
'		LWAppShared.LWElements.Clear
'		CallSub(mPage, "HTML_Layout")
'	End If
'	Log(req.ParameterMap)
'	If req.GetParameter("loadpage") = "true" Then
'		resp.Write(LWAppShared.PageContent)
'	Else
'		resp.Write(generateHTMLLayout(LWAppShared.LWElements))
'	End If

	Log(req.ParameterMap)
	If LWAppShared.PageContent.Length>0 Then
		resp.Write(generateHTMLLayout(LWAppShared.PageContent))
		LWAppShared.PAGEISNEW = False
	Else
		resp.Write(generateHTMLLayout(LWAppShared.PageContent))
	End If

'resp.Write("")
End Sub


Private Sub generateHTMLLayout(WebElementList As String) As String
	Dim returnHTML="" As String
	Dim webSB As StringBuilder
	webSB.Initialize
	'Iterate trought the web elements
'	For Each webElement As Object In WebElementList
'		Dim elHTML As String = CallSub(webElement, "HTML")
'		If elHTML <> Null Then
'			If elHTML.Length >0 Then
'				webSB.Append(elHTML)
'			End If
'		End If
'	Next
	
	If FIXED_LAYOUT Then 
		
	End If
	'Write the return html
	returnHTML = _
$"<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${LWAppShared.Title}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<!-- <meta http-equiv="Pragma" content="no-cache"> -->
	<link rel="shortcut icon" href="/favicon.ico" />
	<script src="/jquery.js"></script>
	<script src="/b4j_ws.js"></script>
	<script src="/reconnecting-websocket.js"></script> 
	<script src="/jquery-ui.js"></script>
</head>
<body>	
<div id="lw-app" style="position:absolute;">
${webSB.ToString}
${WebElementList}
</div>
    <script>
    //connect To the web socket when the page Is ready.
    $( document ).ready(function() {
        b4j_connect("/ws");

    });
    </script>
</body>
</html>
"$
Return returnHTML
End Sub