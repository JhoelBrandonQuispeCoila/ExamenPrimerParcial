<%@page import="com.emergentes.modelo.Calificaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Calificaciones calificacion = (Calificaciones)request.getAttribute("calificacion");
    // Calcular la nota como la suma de P1, P2 y EF
    int nota = calificacion.getP1() + calificacion.getP2() + calificacion.getEF();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar calificación</title>
    <style>
        body {
                font-family: Consolas;
                color: white;
                background-color: #333333; /* Cambia el color de fondo del cuerpo de la página */
            }
    </style>
</head>
<body>
    <h1>Editar calificación</h1>
    <form action="MainServlet" method="post">
        <input type="hidden" name="op" value="guardar">
        <input type="hidden" name="id" value="<%= calificacion.getID() %>">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="<%= calificacion.getID() %>" readonly></td>             
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nombre" value="<%= calificacion.getNombre() %>"></td>
            </tr>
            <tr>
                <td>P1(30)</td>
                <td><input type="text" name="p1" value="<%= calificacion.getP1() %>"></td>
            </tr>
            <tr>
                <td>P2(30)</td>
                <td><input type="text" name="p2" value="<%= calificacion.getP2() %>"></td>
            </tr>
            <tr>
                <td>EF(40)</td>
                <td><input type="text" name="ef" value="<%= calificacion.getEF() %>"></td>
            </tr>
            <tr>
                <td>Nota</td>
                <td><%= nota %></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Enviar"></td>
            </tr>
        </table>
    </form>
</body>
</html>
