Attribute VB_Name = "Módulo2"
Sub generar_word()
RutaActual = ActiveWorkbook.Path
CarpetaWords = RutaActual + "\" + "WordsCreados"
ExisteCarpeta = Dir(CarpetaWords, vbDirectory)
FicheroTemplate = RutaActual + "\Plantilla.docm"
Dim remplazar As String
With ActiveSheet
lastrow = .Cells(.Rows.Count, "A").End(xlUp).Row
End With

If ExisteCarpeta = "" Then
    MsgBox "Creando carpeta para Words"
    MkDir CarpetaWords
Else
    MsgBox "La carpeta para Words existe"
End If


For i = 2 To lastrow
    expediente = Hoja1.Range("A" & i).Text
    nombre = Hoja1.Range("B" & i).Text
    sruta = CarpetaWords + "\" + expediente + ".docx"
    Set objWord = CreateObject("Word.Application")
    remplazarT = "***"
    remplazarN = "Sr/sra"
    
    
    objWord.Documents.Add , Template:=FicheroTemplate, NewTemplate:=True, DocumentType:=0
        With objWord.Selection.Find
        .Text = remplazarT
        .Replacement.Text = expediente
        .Execute Replace:=2
    End With
    
    With objWord.Selection.Find
        .Text = remplazarN
        .Replacement.Text = nombre
        .Execute Replace:=2
    End With
    
    objWord.ActiveDocument.SaveAs2 Filename:=sruta, FileFormat:= _
        wdFormatXMLDocument, LockComments:=False, Password:="", AddToRecentFiles _
        :=True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts _
        :=False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False, CompatibilityMode:=15
        
    objWord.ActiveDocument.Close _
    SaveChanges:=wdPromptToSaveChanges, _
    OriginalFormat:=wdPromptUser
        
Next i
End Sub
