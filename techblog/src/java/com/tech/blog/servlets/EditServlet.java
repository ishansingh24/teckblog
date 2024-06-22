/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author gauta
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            user u = (user) s.getAttribute("current_user");
            if (u != null) {
                u.setEmail(email);
                u.setName(name);
                u.setAbout(about);
                u.setPassword(password);
                String oldProfile = u.getProfile();
                u.setProfile(imageName);

                Connection con = connectionProvider.getConnection();
                userDao userdao = new userDao(con);
                boolean result = userdao.updateUser(u);

                if (result) {

                    String PathOldFIle = request.getRealPath("/") + "pics" + File.separator + oldProfile;
                    if(! PathOldFIle.equals("default.jpg")) helper.deleteFile(PathOldFIle);
                    String path = request.getRealPath("/") + "pics" + File.separator + u.getProfile();
                    if (helper.saveFile(part.getInputStream(), path)) {
                        out.println("profilr updated to database");

                        Message msg = new Message("Profilr Updated SuccessFully", "Success", "alert-success");
                        s.setAttribute("msg", msg);
                        
                    } 
//                    else {
//                        out.println("Profile not updated to database");
//                        Message msg = new Message("Profilr not Updated ", "Error", "alert-danger");
//                        s.setAttribute("msg", msg);
//                        
//                    }
                } else {
                    out.println("Failed to update to database");
                    Message msg = new Message("Profilr not Updated ", "Error", "alert-danger");
                    s.setAttribute("msg", msg);
                    
                }
            } else {
                out.println("user is not present");
            }
            response.sendRedirect("profile.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
