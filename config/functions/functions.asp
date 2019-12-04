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
				If td = "logotipo" AND data(td) <> "" Then
					linha = linha & "<td class='p-2'><div style='width: 75px'><img class='img-fluid' src='uploads/"&data(td)&"' alt='Logotipo'></div></td>"
				else
					linha = linha & "<td class='p-2'>"&data(td)&"</td>"
				end if
			Next
			linha = linha & "<td><a href='edit.asp?id="&data("id")&"'><button type='button' class='btn btn-light text-info'><i class='fas fa-edit'></i></button></a></td>"&_
					 		"<td><a href='remove.asp?id="&data("id")&"' class='btnExcluir' data-toggle='modal' data-target='#excluir'><button type='button' class='btn btn-light text-danger'><i class='fas fa-trash-alt'></i></button></a></td></a></td>"
			linha = linha & "</tr>"
			data.MoveNext
		Loop 

		Response.Write(linha)

	End Function

	function retornaNumeroAleatorio(qtd)
		str_aleatorio = ""
		if qtd="" or not isnumeric(qtd) then qtd=0
		for var_i=1 to qtd
			Randomize
			num_aleatorio = Int((10 * Rnd) + 1)
			num_aleatorio = num_aleatorio + 47
			str_aleatorio = str_aleatorio & chr( num_aleatorio )
		next
		retornaNumeroAleatorio = str_aleatorio
	end function

	function geraNomeArquivo( ByVal extensao )
		dataRef = Now
		geraNomeArquivo =	Year(dataRef)	& "_" &_
							Month(dataRef)	& "_" &_
							Day(dataRef)	& "_" &_
							Hour(dataRef)	& "_" &_
							Minute(dataRef)	& "_" &_
							Second(dataRef) & "_" &_
							retornaNumeroAleatorio(2) &_
							retornaNumeroAleatorio(3) &_ 
							"." &	extensao
	end function
%>