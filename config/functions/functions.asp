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

	function messageSuccess( ByVal msg )
		Response.Write("<div class='alert alert-success'><strong>"&msg&"</strong></div>")
	end function

	Function activePage( ByVal link )
		PaginaAtual		= Request.ServerVariables( "SCRIPT_NAME" )
		aPaginaAtual 	= Split(PaginaAtual, "/")
		PaginaAtual		= LCase( aPaginaAtual( UBound( aPaginaAtual ) - 1 ) )

		If link = PaginaAtual Then
			Response.Write("active")
		End if
	End function 

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

	Function formatDateTimeMySql( ByVal pData )
		'AAAA-MM-DD
		fRetorno = ""
		
		dia		= Day( pData )
		mes		= Month( pData )
		ano		= Year( pData )

		if dia < 10 Then dia = "0" & dia
		if mes < 10 then mes = "0" & mes
				
		fRetorno = ano & "-" & mes & "-" & dia

		formatDateTimeMySql = fRetorno
	End Function

	Function limparString( ByVal pString )
		fRetorno = ""

		Dim regEx
		Set regEx = New RegExp
		regEx.Pattern = "[^\w]"
		regEx.Global = True

		if pString <> "" Then fRetorno = regEx.Replace(pString,"") End if

		limparString = fRetorno
	End Function

	Function sendEmail(destino,assunto,corpo)
		Set Mail = Server.CreateObject("Persits.MailSender")

		Mail.Host = "smtp.abmbrasilkbrtec.hospedagemdesites.ws"
		Mail.Port = 587
		Mail.Username = "webmaster@abmbrasilkbrtec.hospedagemdesites.ws"
		Mail.Password = "wB8736m48x25Jh"
		Mail.From = "webmaster@abmbrasilkbrtec.hospedagemdesites.ws"
		Mail.FromName = Mail.EncodeHeader("Na Mosca Eventos", "iso-8859-1")
		Mail.AddAddress destino
		Mail.Subject = Mail.EncodeHeader(assunto, "iso-8859-1")
		Mail.Body = corpo
		Mail.IsHTML = True
		Mail.CharSet = "UTF-8"
		Mail.ContentTransferEncoding = "quoted-printable"

		On Error Resume Next
		Mail.Send
		If Err <> 0 Then
			'Response.Write "Ocorreu um erro: " & Err.Description
		Else 
			'Response.Write "E-mail enviado."
		End If
		Set mail = nothing
	End Function

	Sub gerarEmail( ByVal query )
		linhas = ""
		do until query.EOF
			linhas = linhas & "<tr>"
			linhas = linhas & "<td>"&query("ingresso")&"</td>"
			linhas = linhas & "<td>"&query("nome")&" "&query("sobrenome")&"</td>"
			linhas = linhas & "<td>"&query("tipo_ingresso")&"</td>"
			linhas = linhas & "<td>"&query("email")&"</td>"
			linhas = linhas & "<td>"&query("telefone")&"</td>"
			linhas = linhas & "<td>"&query("data_evento")&"</td>"
			linhas = linhas & "<td>"&query("fase_evento")&"</td>"
			linhas = linhas & "</tr>"
			query.MoveNext
		Loop

		corpo = "<body style='font-family: sans-serif;'><div style='background-color: #343a40; text-align:center'><br><h1>Na Mosca Eventos</h1><h2 style='font-weight: 300'>Relatório da consulta realizada</h2><br></div><br><p style='text-align:center'>Confira abaixo a relação dos contatos dos visitantes em seu stand na feira do Na Mosca Eventos: </p><br><table style='border-collapse: collapse'><thead style='background-color: #0066cc; color: white; text-align: left'><tr><th>Num. ingresso</th><th>Nome Completo</th><th>Tipo ingresso</th><th>E-mail</th><th>Telefone</th><th>Data festa</th><th>Status planejamento</th></tr></thead><tbody>"&linhas&"</tbody></table></body>"
		call sendEmail("joao.neto@kbrtec.com.br", "Teste acentuação", corpo)
	End Sub

%>