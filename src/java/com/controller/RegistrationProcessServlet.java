/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.sql.*;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.*;
import javax.servlet.http.*;
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author Marvin
 */
public class RegistrationProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection conn;
    
    @Override
    public void init() throws ServletException
    {
       try
        {
            ServletContext con = getServletContext();
            Class.forName(con.getInitParameter("jdbcClassName"));
            String username = con.getInitParameter("dbUserName");
            String password = con.getInitParameter("dbPassword");
            
            // Sets up the url
            StringBuffer url = new StringBuffer(con.getInitParameter("jdbcDriverURL"))
                .append("://")
                .append(con.getInitParameter("dbHostName"))
                .append(":")
                .append(con.getInitParameter("dbPort"))
                .append("/")
                .append(con.getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), username, password);
        }
        catch (SQLException sqle){
            System.out.println("SQLException error occured - " 
                + sqle.getMessage());
        } catch (ClassNotFoundException nfe){
            System.out.println("ClassNotFoundException error occured - " 
                + nfe.getMessage());
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String captchaAnswer = request.getParameter("captchaAnswer").trim();
        boolean isAudio = (Boolean) request.getSession().getAttribute("isAudio");
        
        String newUsername = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String newPassword = request.getParameter("password").trim();
        String confirmPass = request.getParameter("confirmPassword").trim();
        String role = request.getParameter("role").trim();
        
        if(isAudio)
        {
            AudioCaptcha ac = (AudioCaptcha) request.getSession().getAttribute("audioCaptcha");
            if(!ac.isCorrect(captchaAnswer))
            {
                String message = "Incorrect Captcha Answer. Please try again.";
                request.getSession().setAttribute("message", message);
                request.getSession().setAttribute("failedR", true);
                response.sendRedirect(request.getContextPath() + "/register");
                return;
            }
        }
        else
        {
            Captcha captcha = (Captcha) request.getSession().getAttribute("captcha");
            if(!captcha.isCorrect(captchaAnswer))
            {
                String message = "Incorrect Captcha Answer. Please try again.";
                request.getSession().setAttribute("message", message);
                request.getSession().setAttribute("failedR", true);
                response.sendRedirect(request.getContextPath() + "/register");
                return;
            }
        }
        
        String verification = "SELECT * FROM USERS WHERE USERNAME = ? OR EMAIL = ?";
        
        try
        {
            if(conn != null)
            {
                PreparedStatement log = conn.prepareStatement(verification);
                log.setString(1, newUsername);
                log.setString(2, email);
                ResultSet user = log.executeQuery();
                if(user.next())
                {
                    String message = "Your username and/or email is already taken. Please try again.";
                    request.getSession().setAttribute("message", message);
                    request.getSession().setAttribute("failedR", true);
                    user.close(); 
                    response.sendRedirect(request.getContextPath() + "/register");
                    return;
                }
                else
                {
                    String registerCom = "INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, ROLE) VALUES (?, ?, ?, ?)";
                    log = conn.prepareStatement(registerCom);
                    String encryptedPass = encrypt(newPassword, newUsername);
                    log.setString(1, newUsername);
                    log.setString(2, encryptedPass);
                    log.setString(3, email);
                    log.setString(4, role);
                    log.executeUpdate();
                    RequestDispatcher success = request.getRequestDispatcher("registrationSuccess.jsp");
                    success.forward(request, response);
                }
                log.close();
            }
        }
        catch(SQLException e)
        {
            e.getMessage();
        }
      
    }
    
     private String encrypt(String strToEncrypt, String user) {
            String encryptedString = null;
            ByteBuffer key = ByteBuffer.allocate(16);
            key.putInt(Math.abs(user.hashCode()));
            key.putInt(user.length());
            try {
                    Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                    final SecretKeySpec secretKey = new SecretKeySpec(key.array(), "AES");
                    cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                    encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
            } catch (Exception e) {
                    System.err.println(e.getMessage());
            }
            return encryptedString;
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
