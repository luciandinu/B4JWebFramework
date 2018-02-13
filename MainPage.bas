﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'WebSocket class
Sub Class_Globals
	Private mWS As WebSocket 'ignore
	Private mPageController As LWPageController

	Dim aButton As LWButton

End Sub

Public Sub Initialize
	mPageController.Initialize
	
	aButton.Initialize(Me, "bla", "blabla")
	aButton.InlineCSS = "border: 2px solid #ededed;"
	aButton.Left = 2
	
	mPageController.AddElement(aButton)
End Sub

Private Sub WebSocket_Connected (WS As WebSocket)
	mWS = WS
	Log("WS Connected!")

	mPageController.SetWS(mWS)
	
	
	LWAppShared.PageContent = aButton.HTML
	If LWAppShared.PAGEISNEW Then mWS.Eval("location.reload();",Null)
	
	'Registering events
	mPageController.RegisterEvents
End Sub

Private Sub WebSocket_Disconnected
	Log("WS Disconnected!")
End Sub


'Forward/process WebApp events
Private Sub WebSocket_Events(Params As Map)
	mPageController.ProcessEvents(Me, Params)
End Sub

Private Sub bla_Click(Params As Map)
	Log(Params)
'	aButton.Shake
	aButton.Label = "Bla " & Rnd(30, 1200)
	aButton.Left = Rnd(0, 200)
End Sub
