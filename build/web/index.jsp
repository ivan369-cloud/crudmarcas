<%-- 
    Document   : index
    Created on : 17 oct. 2022, 21:12:22
    Author     : IVAN
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Marcas</title>
    </head>
    <body>
        <div class="container">
            <h1>Formulario Marcas</h1>
        </div>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>        
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm">
                                <form action="index.jsp" method="post">
                                    <div class="form-group">
                                        <label for="direccion"><b>MARCAS</b></label>   
                                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ejemplo Samsung" required>
                                    </div>                       
                                    <button type="submit" class="btn btn-primary" name="enviar">Guardar<i class="" aria-hidden="true"></i></button>
                                </form>
                            </div>
                        </div>
                        <br>
                    </div>                  
                    <table class="table table-striped text-center">
                        <thead class="text-center">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Marcas</th>
                                <th scope="col">Editar/Eliminar</th>
                            </tr>
                        </thead>
                        <tbody class ="tbl_marcas">
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyecto_final?user=usr_empresa&password=Empresa@123");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM marcas;");
                                    while (rs.next()) {
                            %>
                        <th scope="row"><%= rs.getString(1)%></th>
                        <td><%= rs.getString(2)%></td>
                        <td>
                            <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>" class="btn btn-success" name="enviar">Editar<i aria-hidden="true"></i></a>
                            <a href="borrar.jsp?id=<%= rs.getString(1)%>" ><i class="btn btn-danger" aria-hidden="true" onclick="javascript:if (!confirm('¿Desea Eliminar'))return false">Eliminar</i> </a>                                                                     
                            </tr>                                    
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error mysql " + e);
                                }
                            %>
                            </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String direccion = request.getParameter("direccion");
                try {
                    Connection conn = null;
                    Statement stt = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyecto_final?user=usr_empresa&password=Empresa@123");
                    stt = conn.createStatement();
                    stt.executeUpdate("insert into marcas (marca) values('" + direccion + "')");
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                }
            }
        %>
    </body>
</html>