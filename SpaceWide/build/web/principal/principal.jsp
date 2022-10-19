<!DOCTYPE html>
<html lang="pt-br">

   
    <title>Space Wide</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    
    <script src="../js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <%
        //Lê dados da sessão
        String acesso = (String) request.getSession().getAttribute("acesso");

        //Se não há sessão, usuário não logou, retorna pcla o login
        if (acesso == null) {
            response.sendRedirect("../index.jsp");
        }
    %>

  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="../usuarioscontrolar.jsp?pag=1">Usuarios</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>

     
    </div>
</body>

</html>
