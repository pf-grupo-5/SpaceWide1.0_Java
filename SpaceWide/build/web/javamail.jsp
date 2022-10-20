
<%@page import="jdk.internal.net.http.websocket.Transport"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@page import="java.net.Authenticator"%>
<%@page import="classes.Usuario"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.util.Properties, javax.mail.*, 
         javax.mail.internet.*, javax.activation.*, 
         java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.mail.Authenticator.*" %>
<%@ page import = "javax.mail.PasswordAuthentication.*" %>
<%@ page import = "javax.mail.Authenticator .*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Connection.*"%>
<%@ page import="java.sql.PreparedStatement.*"%>
<%@ page import="java.sql.ResultSet.*"%>
<%@ page import="java.util.ArrayList.*"%>
<%@ page import="java.util.List.*"%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/site2023"
                   user = "root" password = ""/>
<sql:query dataSource = "${snapshot}" var = "result">
    SELECT * from utente;
</sql:query>
    
<table border = "1" width = "100%" class="table">
    <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <thead>
    <tr>
        <th scope="column">ID</th>
        <th scope="column">Email</th>
        <th scope="column">Status</th>
        <th scope="column"></th>
    </tr>
    <c:forEach var = "row" items = "${result.rows}">
        <tr>
            <td  scope="column"> <c:out value = "${row.idCliente}"/></td>
            <td  scope="column"> <c:out value = "${row.email}"/></td>
            <td>Email enviado para os listados usuários</td>
        </tr>
        </thead>
    </c:forEach>
</table>


<%

    Usuario user = null;
    try {
        Connection con = con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site2023", "root", "");
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from utente");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {

            

            Authenticator auth = new Authenticator() {
                //override the getPasswordAuthentication method
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
            props.put("mail.smtp.port", "587"); //TLS Port
            props.put("mail.smtp.auth", "true"); //enable authentication
            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

            Session sessao = Session.getInstance(props, auth);
            MimeMessage msg = new MimeMessage(sessao);

            //set message headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("spacewide1305@gmail.com", "SpaceWide"));

            msg.setReplyTo(InternetAddress.parse("spacewid1305@gmail.com", false));

            msg.setSubject(request.getParameter("assunto"), "UTF-8");

            msg.setText(request.getParameter("comenta"), "UTF-8");

        
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse((request.getParameter("email")), false));
            Transport.send(msg);

            System.out.println("Email enviado.");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<!--//final String fromEmail = "spacewide1305@gmail.com"; //requires valid gmail id
            final String password = "gaurdvatiuoednkf"; // correct password for gmail id
             msg.setFrom(new InternetAddress("spacewide1305@gmail.com", "SpaceWide"));

            msg.setReplyTo(InternetAddress.parse("spacewid1305@gmail.com", false));

-->