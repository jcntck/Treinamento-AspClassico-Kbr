<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/config.asp"-->
<%
corpo = "<body style='font-family: sans-serif;'><div style='background-color: #343a40; text-align:center'><br><h1>Na Mosca Eventos</h1><h2 style='font-weight: 300'>Relatório da consulta realizada</h2><br></div></body>"

SQL = "SELECT * FROM participantes WHERE ingresso in ('QH5UBGDPVY','QH03B4YU41','QFKZNUWKVL','QFQDBLFYKG','QFDU1RC2G3','QF3LX7EST8');"

Set query = getSQL(SQL)

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
%>
<!-- <body style='font-family: sans-serif;'>
<div style='background-color: #343a40; color: white; text-align:center'>
    <h1><span style='border-bottom: 5px solid #0066cc'>Na Mosca Eventos</span></h1>
    <h2 style='font-weight: 300'>Relatório da consulta</h2>
</div> -->
<!-- <br>
<p style='text-align:center'>Confira abaixo a relação dos contatos dos visitantes em seu stand na feira do Na Mosca Eventos: </p>
<br>
<table style='border-collapse: collapse'>
<thead style='background-color: #0066cc; color: white; text-align: justify'>
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
<tbody>
</tbody>
</table>
</body> -->

<!-- <br><p style='text-align:center'>Confira abaixo a relação dos contatos dos visitantes em seu stand na feira do Na Mosca Eventos: </p><br><table style='border-collapse: collapse'><thead style='background-color: #0066cc; color: white; text-align: justify'><tr><th>Num. ingresso</th><th>Nome Completo</th><th>Tipo ingresso</th><th>E-mail</th><th>Telefone</th><th>Data festa</th><th>Status planejamento</th></tr></thead><tbody></tbody></table></body> -->