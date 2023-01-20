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
import org.apache.commons.codec.binary.*;


/**
 *
 * @author Marvin
 */
public class LoginProcessServlet extends HttpServlet {

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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String enteredUsername = request.getParameter("username").trim();
        String enteredPassword = request.getParameter("password").trim();
        String loginVerification = "SELECT * FROM USERS WHERE USERNAME = ?";
        try
        {
            if(conn != null)
            {
                PreparedStatement log = conn.prepareStatement(loginVerification);
                log.setString(1, enteredUsername);
                ResultSet user = log.executeQuery();
                String errMessage;
                if(user.next())
                {
                    String properUser = user.getString("username");
                    String properPass = user.getString("password");
                    if(properUser.equals(enteredUsername) && passwordMatched(enteredUsername, enteredPassword, properPass))
                    {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", user.getString("USERNAME"));
                        session.setAttribute("userRole", user.getString("ROLE"));
                        session.setAttribute("email", user.getString("EMAIL"));
                        
                        user.close();
                        response.sendRedirect(request.getContextPath() + "/user");
                    }
                    else if(properUser.equals(enteredUsername) && !passwordMatched(enteredUsername, enteredPassword, properPass))
                    {
                        errMessage = "Oops! Looks like you have entered an invalid password. Please try again.";
                        request.getSession().setAttribute("failedL", true);
                        request.getSession().setAttribute("errMessage", errMessage);
                        response.sendRedirect(request.getContextPath() + "/login");
                    }
                    log.close(); 
                }
                
                else
                {
                    errMessage = "The username and password that you have entered were both incorrect. Please try again";
                    request.getSession().setAttribute("errMessage", errMessage);
                    request.getSession().setAttribute("failedL", true);
                    response.sendRedirect(request.getContextPath() + "/login");
                }
            }
            else
            {
                out.println("<h1>error</h1>");
            }
        }
        catch (SQLException sqle){
            out.println(sqle.getMessage());
            out.println("<h1>error in SQL!</h1>");
        }
    }
    
    private boolean passwordMatched(String enteredUName, String enteredPass, String storedPass)
    {
        String decPassword = decrypt(storedPass, enteredUName);
        if(decPassword == null)
            return false;
        return enteredPass.equals(decPassword);
    }
    

    private String decrypt(String codeDecrypt,  String user){
        String decryptedString = null;
        ByteBuffer key = ByteBuffer.allocate(16);
        key.putInt(Math.abs(user.hashCode()));
        key.putInt(user.length());
        try{
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                final SecretKeySpec secretKey = new SecretKeySpec(key.array(), "AES");
                cipher.init(Cipher.DECRYPT_MODE, secretKey);
                decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
        } catch (Exception e) {
                System.err.println(e.getMessage());
        }
        return decryptedString;
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
