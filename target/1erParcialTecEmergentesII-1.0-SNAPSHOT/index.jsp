<%@page import="com.emergentes.modelo.Calificaciones"%>
<%@page import="java.util.ArrayList" %>

<%
    if (session.getAttribute("listaCalificaciones") == null) {
        ArrayList<Calificaciones> listaAux = new ArrayList<Calificaciones>();
        session.setAttribute("listaCalificaciones", listaAux);
    }
    ArrayList<Calificaciones> lista = (ArrayList<Calificaciones>) session.getAttribute("listaCalificaciones");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de calificaciones</title>
        <style>
            body {
                font-family: Consolas;
                color: white;
                background-color: #333333; /* Cambia el color de fondo del cuerpo de la página */
            }
            .container {
                text-align: center; /* Centrar contenido */
            }

            .info {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 20px;
                background-color: gray;
                font-size: 20px;
                font-weight: bold;
            }

            table {
                margin: 0 auto;
                border-collapse: collapse;
                width: 80%;
                background-color: #333; /* Fondo de la tabla */
                color: #fff; /* Texto blanco */
            }

            table th, table td {
                border: 1px solid #555; /* Borde gris oscuro */
                padding: 8px;
            }

            table th {
                background-color: #444; /* Gris oscuro para las celdas de encabezado */
                font-weight: bold;
            }

            table tr:nth-child(even) {
                background-color: #555; /* Gris oscuro para filas pares */
            }



        </style>
    </head>
    <body>
        <div class="container">
            <div class="info">
                <p>PRIMER PARCIAL TEM-742</p>
                <p>NOMBRE: JHOEL BRANDON QUISPE COILA</p>
                <p>CARNET: 6787586</p>
            </div>
            <h1>Registro de calificaciones</h1>
            <button onclick="window.location.href = 'MainServlet?op=nuevo'">Nuevo</button>
            <table border="1" cellspading="0">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>P1(30)</th>
                    <th>P2(30)</th>
                    <th>EF(40)</th>
                    <th>Nota</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if (lista != null) {
                        for (Calificaciones calificacion : lista) {
                            int nota = calificacion.getP1() + calificacion.getP2() + calificacion.getEF();
                %>
                <tr>
                    <td><%= calificacion.getID()%></td>
                    <td><%= calificacion.getNombre()%></td>
                    <td><%= calificacion.getP1()%></td>
                    <td><%= calificacion.getP2()%></td>
                    <td><%= calificacion.getEF()%></td>
                    <td><%= nota%></td>
                    <td>
                        <a href="MainServlet?op=editar&id=<%= calificacion.getID()%>">Editar</a>
                    </td>
                    <td>
                        <a href="MainServlet?op=eliminar&id=<%= calificacion.getID()%>"
                           onclick="return(confirm('¿Estás seguro de eliminar esta calificación?'))">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
