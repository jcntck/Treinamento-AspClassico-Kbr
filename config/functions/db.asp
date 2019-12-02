<%
    Function getAllSQL ( ByVal tabela, ByVal options )
        pSQL = "SELECT * FROM "&tabela&" WHERE "&options&" order by id DESC;"

        Set conn = Server.CreateObject("AdoDb.Connection")
        conn.CursorLocation = 3
        conn.Open DataSource
        Set query = Server.CreateObject("AdoDb.RecordSet")

        query.Open pSQL , conn , 3 , 1

        query.ActiveConnection = Nothing

        conn.Close
        Set conn = Nothing

        Set getAllSQL = query
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