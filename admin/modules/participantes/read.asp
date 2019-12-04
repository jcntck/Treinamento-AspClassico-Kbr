<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 
    
    fileUpload.Path = Server.MapPath("..\..\uploads\excel\")

    If IsObject(fileUpload.Form("excel")) AND Not fileUpload.Form("excel").IsEmpty Then    
        fileUpload.Save
    
        'initialize variables
        ExcelFile = Server.MapPath("../../uploads/excel/"&fileUpload.UserFilename)
        SQL = "SELECT * FROM [Lista de Participantes$]"

        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ExcelFile & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;IMEX=1"";"
        SET RS = Server.CreateObject("ADODB.Recordset")

        RS.Open SQL, conn

        Response.Write("<table border=1><thead><tr>")
        For each Column in RS.Fields
            Response.Write("<th>"& Column.Name &"</th>")
        Next 
        Response.Write("</tr></thead><tbody>")
        if not RS.EOF then
            while not rs.EOF
                response.write "<tr>"
                for each Field in RS.Fields
                    response.write"<td>"& Field.value &"</td>"
                Next
                response.write "</tr>"
                Rs.MoveNext
            WEnd
        End if
        response.write "</tbody></table>"
        RS.close
        conn.Close

        fileUpload.Delete
    End If
%>