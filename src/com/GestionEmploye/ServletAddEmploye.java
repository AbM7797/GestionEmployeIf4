package com.GestionEmploye;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;
import java.io.IOException;

@WebServlet("/ServletAddEmploye")
public class ServletAddEmploye extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Add Employe");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String age = request.getParameter("age");
        String sexe = request.getParameter("sexe");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String post = request.getParameter("post");
        String id = request.getParameter("id");
        Employe test = new Employe().getEmploye(Integer.parseInt(id));
        Boolean userExist = false;
        Boolean CINVerif = false;
        if(id.length()!=8){
            CINVerif = true;
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Ajouter.jsp");
            request.setAttribute("CINVerif",CINVerif);
            rd.include(request, response);
        } else if(test==null){
            userExist = false;
            Employe employe = new Employe(nom,prenom, Integer.parseInt(age),Integer.parseInt(id),sexe,email,adresse,post);
            employe.addEmploye();
            response.sendRedirect("home.jsp");
        }else{
            userExist = true;
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Ajouter.jsp");
            request.setAttribute("userExist",userExist);
            rd.include(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
