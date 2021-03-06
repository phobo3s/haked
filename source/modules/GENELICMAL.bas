﻿Option Compare Database
Option Explicit

Sub newicmal(binaName As String, wbook As Excel.Workbook)
Dim paraBirim As String
Dim genicmName As String
Dim i As Long 'sayaç
Dim sayfaNo As Integer
Dim j As Integer 'sayaç2

genicmName = wbook.ActiveSheet.name

If binaName = "KAPAT" Then
Exit Sub
Else
End If

'BİLGİ TOPLA
paraBirim = Right(wbook.ActiveSheet.name, 3)
sayfaNo = wbook.ActiveSheet.Range("t3").Value

'yer belirleme!! KOPYALAMA
With wbook.Sheets("İMALAT İCMAL-SBLN")
    .Visible = True
    .Copy After:=wbook.Worksheets(wbook.Sheets(6).Index)
    .Visible = xlVeryHidden
End With
wbook.ActiveSheet.name = "İMALAT İCMAL-" & binaName & "-" & paraBirim
wbook.ActiveSheet.Tab.ColorIndex = 5

For j = 1 To sayfaNo - 1
    Call ICMAL.addIcmalPage
Next j

Dim adress As String

'BİLGİ YAZ
With wbook.ActiveSheet
    .Range("a3").Value = binaName & " İMALAT İCMAL TABLOSU"
    .Range("r2").Value = paraBirim
    .Range("e5").Value = wbook.Worksheets("Data").Range("C10") & "  (" & binaName & " BİNASI)"
'İLK KISMI GENEL İCMALDEN AL
Dim l As Long
Dim p As Long

For p = 0 To (sayfaNo - 1)
If p > 1 Then 'BİRDEN FAZLA SAYFASI VAR İSE BURADAN
l = 1
Else
l = 0
End If
    For j = 0 To 6
    For i = (l + (p * 31)) To (16 + (p * 31))
            adress = .Range("b9").Offset(i, j).Address
            adress = Replace(adress, "$", "")
            adress = "'" & genicmName & "'!" & adress
            .Range("b9").Offset(i, j).FormulaLocal = "=eğer(" & adress & "=" & Chr(34) & Chr(34) & ";" & Chr(34) & Chr(34) & ";" & adress & ")"
    Next i
    Next j
Next p
End With

Dim ifFormula As String

With wbook.Sheets(genicmName)
'SAYILARI İCMALLERDEN AL VE + ile FORMÜLE EKLE
For p = 0 To (sayfaNo - 1)
If p > 1 Then 'BİRDEN FAZLA SAYFASI VAR İSE BURADAN
l = 1
Else
l = 0
End If
    For j = 0 To 2
    For i = (l + (p * 31)) To (16 + (p * 31))
        adress = .Range("j9").Offset(i, j).Address
        adress = Replace(adress, "$", "")
        adress = "'" & wbook.ActiveSheet.name & "'!" & adress
        ifFormula = "eğer(" & adress & "=" & Chr(34) & Chr(34) & ";" & 0 & ";" & adress & ")"
        If .Range("j9").Offset(i, j).FormulaLocal = "" Then
            .Range("j9").Offset(i, j).FormulaLocal = "=" & ifFormula
        Else
            .Range("j9").Offset(i, j).FormulaLocal = "+" & CStr(.Range("j9").Offset(i, j).FormulaLocal) & "+" & ifFormula
            .Range("j9").Offset(i, j).FormulaLocal = Right(.Range("j9").Offset(i, j).FormulaLocal, (Len(.Range("j9").Offset(i, j).FormulaLocal) - 1))
        End If
    Next i
    Next j
Next p
End With

End Sub
