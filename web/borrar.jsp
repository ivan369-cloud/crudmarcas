<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement stt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyecto_final?user=usr_empresa&password=Empresa@123");
                stt = con.createStatement();
                stt.executeUpdate("delete FROM marcas where id_marca='" + request.getParameter("id") + "';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {

            }
        %>    
    </body>
</html>
