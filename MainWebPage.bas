﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class module
Sub Class_Globals
	Public LWElements As List
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	LWElements.Initialize 'Initialize the list of web elements
	PageHTMLLayout
End Sub

'Create the webapp page layout
'Define all the necessary web elements here
Sub PageHTMLLayout
	Dim a As LWButton = Factory.CreateLWButtonWithID(Me, "gigisor","gigi", "gigi button")
	a.InlineCSS = "border: 2px solid #ededed;"

	Dim b As LWButton
	b.Initialize(Me, "mylabel","mylabel2")
	b.InlineCSS = "border: 12px solid #adadad;"

	LWElements.Add(a)
	LWElements.Add(b)
End Sub


Private Sub gigisor_Click(Params As Map)
	Log("Gigisor!")
	Log(Params)
End Sub

Private Sub mylabel_Click(Params As Map)
	Log("mylabel click!")
	Log(Params)
End Sub