<!--#include file="../../../config/config.asp"-->
<!--#include file="../../auth/auth.asp"-->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 
    
    fileUpload.Path = Server.MapPath("..\..\uploads\excel\")

    If IsObject(fileUpload.Form("excel")) AND Not fileUpload.Form("excel").IsEmpty Then    
        fileUpload.Save
    
        'initialize variables
        ExcelFile = Server.MapPath("../../uploads/excel/"&fileUpload.UserFilename)
        SQL = "SELECT * FROM [Lista de Participantes$]"

        Set connExcel = Server.CreateObject("ADODB.Connection")
        connExcel.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ExcelFile & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;IMEX=1"";"
        SET RS = Server.CreateObject("ADODB.Recordset")

        RS.Open SQL, connExcel

        Dim campos(8)
        Dim cont
        if not RS.EOF then
            Dim values
            values = ""

            SQL = "SELECT ingresso FROM participantes;"
            Set query = getSQL(SQL)
            

            while not rs.EOF
                'Passa os campos do excel para um array
                cont = 0
                find = false
                for each Field in RS.Fields
                    campos(cont) = Field.value
                    cont = cont + 1
                Next
                
                ingresso      = campos(0)
                nome          = campos(1)
                sobrenome     = campos(2)
                tipo_ingresso = campos(3)
                email         = campos(4)
                If campos(5) <> "" Then telefone = campos(5) Else telefone = campos(6) End If
                data_evento   = campos(7)
                fase_evento   = campos(8)

                
                If Not query.EOF Then
                    do until query.EOF 
                        If query("ingresso") <> ingresso Then
                            find = true
                        End If  
                        query.MoveNext
                    loop
                    query.MoveFirst
                End If

                If Not find Then
                    If values <> "" Then
                        values = values & ", ('"&ingresso&"', '"&nome&"', '"&sobrenome&"', '"&tipo_ingresso&"', '"&email&"', '"&telefone&"', STR_TO_DATE('"&data_evento&"', '%d/%m/%Y'), '"&fase_evento&"')"
                    Else
                        values = values & "('"&ingresso&"', '"&nome&"', '"&sobrenome&"', '"&tipo_ingresso&"', '"&email&"', '"&telefone&"', STR_TO_DATE('"&data_evento&"', '%d/%m/%Y'), '"&fase_evento&"')"
                    End If
                End if

                Rs.MoveNext
            WEnd
            
            If values <> "" Then

                SQL = "INSERT INTO participantes (ingresso, nome, sobrenome, tipo_ingresso, email, telefone, data_evento, fase_evento) "&_
                      "VALUES "&values&";"

                execSQL( SQL )
            End If
        End if
        RS.close
        connExcel.Close

        fileUpload.Delete
        Set fileUpload = Nothing

    End If

    Response.redirect("./")
%>