<!DOCTYPE html>
<html lang="pt-br">


    <title>Space Wide</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color:#edffff;">

    <%
        //Lê dados da sessão
        String acesso = (String) request.getSession().getAttribute("acesso");

        //Se não há sessão, usuário não logou, retorna pcla o login
        if (acesso == null) {
            response.sendRedirect("../index.jsp");
        }
    %>
    <div class="container-lg-6">
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand " href="#"><img src="../imagens/logo .svg" alt="logo" width="60" height="80" class="d-inline-block align-text-top">
                </a><a>SpaceWide</a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../usuarioscontrolar.jsp?pag=1">Usuários</a>
                    <li class="nav-item">

                    </li>
                    <li class="nav-item dropdown dropstart">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                           Usuário: <%=request.getSession().getAttribute("nome")%>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="../deslogar.jsp">Deslogar</a></li>
                          
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</body>
</html>
