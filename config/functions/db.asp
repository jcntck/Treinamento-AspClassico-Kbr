<%
    Function getAllSQL ( ByVal tabela, ByVal options, ByVal id )
        If options <> "" Then
            pSQL = "SELECT * FROM "&tabela&" WHERE "&options&" order by "&id&" DESC;"
        Else
            pSQL = "SELECT * FROM "&tabela&" order by "&id&" DESC;"
        End If

        Set query = getSQL( pSQL )

        Set getAllSQL = query
    End Function

    Function getByIdSQL ( ByVal tabela, ByVal id )
        pSQL = "SELECT * FROM "&tabela&" WHERE id="&id&";"

        Set query = getSQL(pSQL)

        If Not query.EOF Then
            Dim stringItem
            stringItem = ""

            For Each x in query.Fields
                stringItem = stringItem & x.value&"|"
                arrayItem = Split(stringItem, "|")
            next
            
            getByIdSQL = arrayItem
        Else
            Response.Redirect("./")
        End If
    End Function

    Function getSQL ( ByVal pSQL )
        Set conn = Server.CreateObject("AdoDb.Connection")
        conn.CursorLocation = 3
        conn.Open DataSource
        Set query = Server.CreateObject("AdoDb.RecordSet")

        query.Open pSQL , conn , 3 , 1

        query.ActiveConnection = Nothing

        conn.Close
        Set conn = Nothing

        Set getSQL = query
    End Function

    Function execSQL( ByVal pSQL )
        Dim retorno
        retorno = ""

        Set conn = Server.CreateObject("AdoDb.Connection")
        conn.CursorLocation = 3
        conn.Open DataSource

        conn.Execute pSQL , RecordsAffected
        retorno = conn.Execute("SELECT @@IDENTITY")(0).Value

        conn.Close
        Set conn = Nothing

        execSQL = retorno
    End Function
%>