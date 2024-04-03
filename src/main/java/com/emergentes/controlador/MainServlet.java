package com.emergentes.controlador;

import com.emergentes.modelo.Calificaciones;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        Calificaciones calificacion = new Calificaciones();
        int id, pos;
        
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> listaCalificaciones = (ArrayList<Calificaciones>) ses.getAttribute("listaCalificaciones");
        
        switch(op){
            case "nuevo":
                // Enviar un objeto vacío a editar
                request.setAttribute("calificacion", calificacion);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "editar":
                // Enviar un objeto a editar pero con contenido
                id = Integer.parseInt(request.getParameter("id"));
                // Averiguar la posición del elemento en la lista
                pos = buscarPorIndice(request, id);
                // Obtener el objeto
                calificacion = listaCalificaciones.get(pos);
                request.setAttribute("calificacion", calificacion);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "eliminar":
                // Eliminar el registro de la colección según el id
                id = Integer.parseInt(request.getParameter("id"));
                // Averiguar la posición del elemento en la lista
                pos = buscarPorIndice(request, id);
                if (pos >= 0) {
                    listaCalificaciones.remove(pos);
                } 
                response.sendRedirect("index.jsp");
                break;
            default:
                
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> listaCalificaciones = (ArrayList<Calificaciones>) ses.getAttribute("listaCalificaciones");
        Calificaciones calificacion = new Calificaciones();
        calificacion.setID(id);
        calificacion.setNombre(request.getParameter("nombre"));
        calificacion.setP1(Integer.parseInt(request.getParameter("p1")));
        calificacion.setP2(Integer.parseInt(request.getParameter("p2")));
        calificacion.setEF(Integer.parseInt(request.getParameter("ef")));
        
        if(id == 0){
            // Nuevo registro
            int nuevoID = obtenerNuevoID(request);
            calificacion.setID(nuevoID);
            listaCalificaciones.add(calificacion);
        } else {
            // Edición de registro
            int pos = buscarPorIndice(request, id);
            listaCalificaciones.set(pos, calificacion);
        }
        response.sendRedirect("index.jsp");
    }
    
    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> listaCalificaciones = (ArrayList<Calificaciones>) ses.getAttribute("listaCalificaciones");
        int pos = -1;
        if(listaCalificaciones != null){
            for(Calificaciones calificacion : listaCalificaciones){
                ++pos;
                if(calificacion.getID() == id){
                    break;  
                }
            }
        }
        return pos;
    }
    
    public int obtenerNuevoID(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> listaCalificaciones = (ArrayList<Calificaciones>) ses.getAttribute("listaCalificaciones");
        int nuevoID = 0;
        for(Calificaciones calificacion : listaCalificaciones){
            nuevoID = calificacion.getID();
        }
        return nuevoID + 1;
    }
}
