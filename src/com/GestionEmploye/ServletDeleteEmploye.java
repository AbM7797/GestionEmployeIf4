package com.GestionEmploye;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletDeleteEmploye")
public class ServletDeleteEmploye extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Delete Employe");
        String id = request.getParameter("id");
        Employe employe = new Employe(Integer.parseInt(id));
        employe.deleteEmploye();
        response.sendRedirect("supprimer.jsp");
    }
}
