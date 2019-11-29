<%
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
%>