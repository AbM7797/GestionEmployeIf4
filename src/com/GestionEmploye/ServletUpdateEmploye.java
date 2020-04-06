package com.GestionEmploye;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletUpdateEmploye")
public class ServletUpdateEmploye extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String age = request.getParameter("age");
        String sexe = request.getParameter("sexe");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String post = request.getParameter("post");
        String oldid = request.getParameter("oldid");
        String newId = request.getParameter("id");
        Employe test = new Employe().getEmploye(Integer.parseInt(newId));
        Boolean userExist = false;
        Boolean CINVerif = false;
        if(newId.length()!=8){
            CINVerif = true;
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Ajouter.jsp");
            request.setAttribute("CINVerif",CINVerif);
            rd.include(request, response);
        } else if(test==null || oldid.equals(newId) ){
            userExist = false;
            Employe employe = new Employe(Integer.parseInt(oldid));
            employe.updateEmploye(nom,prenom,sexe,post,adresse,email,Integer.parseInt(age),Integer.parseInt(newId));
            response.sendRedirect("home.jsp");
        }else{
            userExist = true;
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Ajouter.jsp");
            request.setAttribute("userExist",userExist);
            rd.include(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employe employe = new Employe();
        Employe employe1 = employe.getEmploye(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Ajouter.jsp");
        request.setAttribute("employe",employe1);
        dispatcher.forward(request,response);

    }
}
