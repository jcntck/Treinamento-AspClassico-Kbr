<%
    Function canBeNull( ByVal pString )
        fReturn = ""
        pString = Trim( pString )

        If pString <> "" Then
            fReturn = pString
        End if

        canBeNull = fReturn
    End Function 

    Function isNullOrEmpty( ByVal pString )
		fRetorno_isNullOrEmpty = false

		if isNull(pString) then
			fRetorno_isNullOrEmpty = true
		else
			if pString = "" then
				fRetorno_isNullOrEmpty = true
			end if
		end if

		isNullOrEmpty = fRetorno_isNullOrEmpty
	end Function

    function messageError( ByVal msg )
		Response.Write("<div class='alert alert-danger'><strong>"&msg&"</strong></div>")
	end function

	Function activePage( ByVal link )
		PaginaAtual		= Request.ServerVariables( "SCRIPT_NAME" )
		aPaginaAtual 	= Split(PaginaAtual, "/")
		PaginaAtual		= LCase( aPaginaAtual( UBound( aPaginaAtual ) - 1 ) )

		If link = PaginaAtual Then
			Response.Write("active")
		End if
	End function 

	Function gerarTabela( ByVal tabela, ByVal array, ByVal options )

		Set data = getAllSQL(tabela, options)
		linha = ""

		Do until data.EOF
			linha = linha & "<tr>"
			For Each td in array
				linha = linha & "<td class='p-2'>"&data(td)&"</td>"
			Next
			linha = linha & "<td><a href='edit.asp?id="&data("id")&"'>Atualizar</a></td>"&_
					 		"<td><a href='remove.asp?id="&data("id")&"'>Deletar</a></td>"
			linha = linha & "</tr>"
			data.MoveNext
		Loop 

		Response.Write(linha)

	End Function
%>