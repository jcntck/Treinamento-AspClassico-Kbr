<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="pt-br">
<!-- #include file = "inc/head.asp" -->
<body>
<!-- #include file = "inc/header.asp" -->
<%
    Dim fileUpload
    Set fileUpload = Server.CreateObject("SoftArtisans.FileUp") 

    fileUpload.Path = Server.MapPath("..\admin\uploads\excel\")

    If IsObject(fileUpload.Form("csvFile")) AND Not fileUpload.Form("csvFile").IsEmpty Then 
        fileUpload.Save

        csvPath = Server.MapPath("..\admin\uploads\excel\"&fileUpload.UserFilename)
        set fso = createobject("scripting.filesystemobject")
        set objFile = fso.opentextfile(csvPath)

        Dim content
        Do until objFile.AtEndOfStream
            content = content & objFile.readline & "|"
        Loop

        arrayCod = split(content, "|")
        
        values = ""
        for each linha in arrayCod
            if linha <> "" then
                linha = replace(linha, chr(34), "")
                cod = split(linha, ",")
                values = values&"'"&cod(2)&"',"
            end if
        next
        objFile.Close

        values = Left(values, Len(values) - 1)

        SQL = "SELECT * FROM participantes WHERE ingresso in ("&values&");"

        Set query = getSQL(SQL)


        fileUpload.Delete
        Set fileUpload = Nothing
    End if
%>
<main class="container mt-5" style="height: 85vh">
    <div class="row">
        <div class="col text-center">
            <p>Confira abaixo a relação dos contatos dos visitantes em seu stand na feira do Na Mosca Eventos: </p>
        </div>
    </div>
    <div class="row my-3">
        <div class="col my-3">
           <a href="csv.asp" role="button" class="btn btn-info float-right">Realizar nova consulta</a>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-sm" id="participantesLojista">
                    <thead>
                        <tr>
                            <th>Num. ingresso</th>
                            <th>Nome Completo</th>
                            <th>Tipo ingresso</th>
                            <th>E-mail</th>
                            <th>Telefone</th>
                            <th>Data festa</th>
                            <th>Status planejamento</th>
                        </tr>
                    </thead>
                    <tbody class="text-justify">
                        <%
                            do until query.EOF
                                response.write "<tr>"
                                response.write "<td>"&query("ingresso")&"</td>"
                                response.write "<td>"&query("nome")&" "&query("sobrenome")&"</td>"
                                response.write "<td>"&query("tipo_ingresso")&"</td>"
                                response.write "<td>"&query("email")&"</td>"
                                response.write "<td>"&query("telefone")&"</td>"
                                response.write "<td>"&query("data_evento")&"</td>"
                                response.write "<td>"&query("fase_evento")&"</td>"
                                response.write "</tr>"
                                query.MoveNext
                            Loop
                        %>
                    </tbody>
                </table>
            </div>
            <a href="../config/functions/planilha.asp?values=<%=values%>">Exportar</a>
        </div>
    </div>
</main>
<!-- #include file="inc/footer.asp" -->
</body>
</html>
