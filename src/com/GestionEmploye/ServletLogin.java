package com.GestionEmploye;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String userID = "admin";
    private final String password = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        Boolean wrong = false;
        if(userID.equals(user) && password.equals(pwd)){
            wrong = false;
            HttpSession session = request.getSession();
            session.setAttribute("user", "Admin");
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(60*30);
            Cookie userName = new Cookie("user", user);
            userName.setMaxAge(60*30);
            response.addCookie(userName);
            response.sendRedirect("home.jsp");
        }else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            wrong = true;
            request.setAttribute("wrong",wrong);
            rd.include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
