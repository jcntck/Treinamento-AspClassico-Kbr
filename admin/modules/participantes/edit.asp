<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html lang="pt-br">
<!-- #include file = "../../inc/head.asp" -->
<body>
    <%
        participante = getByIdSQL("participantes", Request.queryString("ingresso"), "ingresso")

        SQL = "SELECT distinct tipo_ingresso FROM participantes;"
        Set tipo_ingresso = getSQL(SQL)
    %>
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- #include file = "../../inc/header.asp" -->
         <!-- Content Wrapper -->
        <div id="content-wrapper">
            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    
                    <!-- Page Heading -->
                    <h1 class="h3 my-4 text-gray-800">Participantes</h1>
                    <p>Está é a área de edição de Participantes. Aqui é onde você edita os dados das pessoas que vão em seu evento.</p>

                    <div class="card shadow mb-4">

                        <div class="card-header d-flex justify-content-between">
                            <h6 class="m-0 font-weight-bold align-self-center">Formulário de edição:</h6>
                            <a class="btn btn-primary align-self-center" href="default.asp" role="button">
                                <i class="fas fa-arrow-left"></i>
                                <span>Voltar</span>    
                            </a>
                        </div>    

                        <div class="card-body">
                            
                            <form method="post" action="update.asp" name="formParticipantes">

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="razao_social">Num. do Ingresso: <small>Não é possivel editar</small></label>
                                        <input type="text" class="form-control" name="ingresso" id="ingresso" value="<%=participante(0)%>" readonly>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    
                                    <div class="col">
                                        <label for="razao_social">Nome: </label>
                                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome do participante" value="<%=participante(1)%>" maxlength="255" required >
                                    </div>

                                    <div class="col">
                                        <label for="razao_social">Sobrenome: </label>
                                        <input type="text" class="form-control" name="sobrenome" id="sobrenome" placeholder="Sobrenome do participante" value="<%=participante(2)%>" maxlength="255" required >
                                    </div>

                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="nome_responsavel">Tipo do ingresso: </label>
                                        <select class="form-control" id="tipo_ingresso" name="tipo_ingresso" required>
                                            <option value=""> -- Selecione uma opção -- </option>
                                            <%
                                                do until tipo_ingresso.EOF
                                                    Dim stringOpcao
                                                    stringOpcao = "<option "
                                                    for each opcao in tipo_ingresso.Fields
                                                        If participante(3) = opcao Then stringOpcao = stringOpcao&"selected " End if
                                                        stringOpcao = stringOpcao&">"&opcao&"</option>"
                                                    next
                                                    response.write stringOpcao
                                                    tipo_ingresso.MoveNext
                                                Loop
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="email">Endereço de e-mail: </label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Endereço de e-email do participante" value="<%=participante(4)%>" maxlength="255" required>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="contato">Telefone para contato: </label>
                                        <input type="tel" class="form-control" name="contato" id="contato" placeholder="Contato do participante" value="<%=participante(5)%>" maxlength="11">
                                    </div>
                                    <div class="col">
                                        <label for="data_evento">Data do Evento: </label>
                                        <input type="date" class="form-control" name="data_evento" id="data_evento" placeholder="Data do evento, se definida" value="<% If participante(6) <> "" Then response.write formatDateTimeMySql(participante(6)) End if %>">
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="status_evento">Em que fase está o planejamento da sua festa? </label>
                                        <select class="form-control" id="fase_evento" name="fase_evento">
                                            <option value=""> -- Selecione uma opção -- </option>
                                            <option <% If participante(7) = "Estou somente pesquisando" Then response.write "selected" End If %>>Estou somente pesquisando</option>
                                            <option <% If participante(7) = "Estou bem no início, ainda não tenho data e local" Then response.write "selected" End If %>>Estou bem no início, ainda não tenho data e local</option>
                                            <option <% If participante(7) = "Estou bem no início, mas já tenho data definida" Then response.write "selected" End If %>>Estou bem no início, mas já tenho data definida</option>
                                            <option <% If participante(7) = "Estou bem no início da organização da festa, ainda não tenho nem data e local" Then response.write "selected" End If %>>Estou bem no início da organização da festa, ainda não tenho nem data e local</option>
                                            <option <% If participante(7) = "Estou bem no início da organização da festa, mas já tenho data definida" Then response.write "selected" End If %>>Estou bem no início da organização da festa, mas já tenho data definida</option>
                                            <option <% If participante(7) = "Estou no meio, já contratei algumas empresas" Then response.write "selected" End If %>>Estou no meio, já contratei algumas empresas</option>
                                            <option <% If participante(7) = "Estou no meio da organização da festa, já contratei algumas empresas" Then response.write "selected" End If %>>Estou no meio da organização da festa, já contratei algumas empresas</option>
                                            <option <% If participante(7) = "Estou no final, faltando pouca coisa para contratar" Then response.write "selected" End If %>>Estou no final, faltando pouca coisa para contratar</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mt-4 d-flex flex-row-reverse">
                                    <button type="submit" class="btn btn-primary align-self-center">
                                        <i class="fas fa-edit"></i>
                                        <span>Editar</span>
                                    </button>
                                </div>

                            </form>
                        </div>
                    
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Treinamento ASP Clássico 2019</span>
                </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
<!-- #include file = "../../inc/footer.asp" -->
</body>
</html>