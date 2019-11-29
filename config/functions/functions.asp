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

%>