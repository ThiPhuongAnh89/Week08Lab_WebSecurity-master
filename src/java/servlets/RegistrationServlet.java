/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.NotesDBException;
import database.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import services.AccountService;
import services.UserService;

/**
 *
 * @author awarsyle
 */
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null && action.equals("checkUsername")) {
            String username = request.getParameter("username");

            UserService us = new UserService();
            User user;
            try {
                user = us.get(username);

                // handle the reseponse by hardcoding values
                // the response is not a whole page, just some text
                if (user == null && !username.equals("")) {
                    response.getWriter().write("Hey that's cool");
                } else {
                    response.getWriter().write("Hey that's not cool");
                }
            } catch (Exception ex) {
                Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            return; // stop execution of servlet
        }

        getServletContext().getRequestDispatcher("/WEB-INF/registrations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //AccountService as = new AccountService();
        UserDB db = new UserDB();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordcheck = request.getParameter("passwordcheck");
        if(!password.equalsIgnoreCase(passwordcheck))
        {
            request.setAttribute("error", "Passwords don't match. Please try again");
            request.setAttribute("usernameReg", username);
            getServletContext().getRequestDispatcher("/WEB-INF/registrations.jsp").forward(request, response);
        }
        else
        {
            try {
                db.insert(new User(username, password));
                //response.getWriter().write("Successful!");
                Thread.sleep(2000);
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            } catch (NotesDBException | InterruptedException ex) {
                Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }

}
