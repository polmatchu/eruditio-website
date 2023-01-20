/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.*;
import javax.servlet.ServletOutputStream;


/**
 *
 * @author Marvin
 */
public class UserPdf 
{
    Connection con;
    String filename = "UserReport";
    BaseColor violet = new BaseColor(99, 66, 178);
    BaseColor lg = new BaseColor(185, 187, 182);      //(185, 187, 182);    //try other shade (217, 221, 220)
    ServletOutputStream out;//(185, 187, 182);    //try other shade (217, 221, 220)
   
    public UserPdf(ServletOutputStream s)
    {
        out = s;
    }
    
    public void create(String username)
    {
        connect();
        
        // initialize the document
        Document document = new Document();
        document.setPageSize(PageSize.LETTER);
        document.setMargins(72f, 72f, 110f, 50f);
        
        PdfWriter writer;
        try{
           // BaseFont bf = BaseFont.createFont("fonts/Roboto-Regular.ttf", BaseFont.IDENTITY_H, true);
           // BaseFont tf =  BaseFont.createFont("fonts/Roboto-Medium.ttf", BaseFont.IDENTITY_H, true);
            Font t = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font cells = new Font(Font.FontFamily.HELVETICA, 18, Font.NORMAL, BaseColor.BLACK);
            //Font titleFont = new Font(bf, 22, Font.NORMAL, BaseColor.BLACK);
            Font data = new Font(Font.FontFamily.HELVETICA, 18, Font.NORMAL, BaseColor.BLACK); //new Font(bf, 14);
            Font head = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.WHITE);// new Font(bf, 18, Font.NORMAL, BaseColor.WHITE);
            
            // sets up the object that will write in the pdf
            writer = PdfWriter.getInstance(document, new FileOutputStream(filename + "initial.pdf")); 
            
            // adds the header and footer for each page in the document
            HeaderFooterPageEvent hf = new HeaderFooterPageEvent();
            writer.setPageEvent(hf);
            
            // opens the document
            document.open();
            
            Paragraph title = new Paragraph(new Phrase("ACCOUNT INFORMATION", t));
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(10f);
            
            document.add(title);
            
            String query = "SELECT * FROM USERS WHERE USERNAME = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            ResultSet rs =  pstmt.executeQuery();
            
            String email;
            String role;
            
            while(rs.next())
            {
                email = rs.getString("EMAIL");
                role = rs.getString("ROLE");
                Paragraph te = new Paragraph(new Phrase("Username: " + username + "\n", data));
                //te.add(new Chunk(new VerticalPositionMark()));
                te.add(new Phrase("Email: "  + email + "\n", data));
                te.add(new Phrase("Role: " + role + "\n", data));
                te.setSpacingAfter(10f);
                document.add(te);
            }
            
            rs.close();
            
            // sets up the table
            float[] columnWidth = {300f, 300f};
            PdfPTable table = new PdfPTable(columnWidth);            
            PdfPCell tabTitle = new PdfPCell(new Phrase("PROGRAMS AVAILABLE", t));
            tabTitle.setBorder(Rectangle.NO_BORDER);
            tabTitle.setFixedHeight(35f);
            tabTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
            tabTitle.setVerticalAlignment(Element.ALIGN_CENTER);
            table.setWidthPercentage(100);
            
            
            BaseColor[] colors = {new BaseColor(255, 255, 255),
                                 new BaseColor(239, 239, 239)};
            tabTitle.setColspan(2);
            tabTitle.setBorderColor(BaseColor.WHITE);
            
            table.addCell(tabTitle);
            table.setHeaderRows(2);
            
            PdfPCell h1 = new PdfPCell(new Phrase("PROGRAMS", head));
            h1.setBorder(Rectangle.RIGHT);
            h1.setBorderColor(BaseColor.WHITE);
            h1.setBackgroundColor(violet);
            h1.setHorizontalAlignment(Element.ALIGN_CENTER);
            h1.setVerticalAlignment(Element.ALIGN_CENTER);
            h1.setFixedHeight(25f);
            
            PdfPCell h2 = new PdfPCell(new Phrase("DESCRIPTON", head));
            h2.setBorder(Rectangle.NO_BORDER);
            h2.setBackgroundColor(violet);
            h2.setFixedHeight(25f);
            h2.setHorizontalAlignment(Element.ALIGN_CENTER);
            h2.setVerticalAlignment(Element.ALIGN_CENTER);
            
            table.addCell(h1);
            table.addCell(h2);
            
            int i = 0;
            
            query = "SELECT * FROM PROGRAMS";
            pstmt = con.prepareStatement(query);
            ResultSet prog = pstmt.executeQuery();
            
            while(prog.next())
            {
                PdfPCell c1 = new PdfPCell(new Phrase(prog.getString("PROGRAM_NAME"), data));
                PdfPCell c2 = new PdfPCell(new Phrase(prog.getString("BRIEF_DESCRIPTION"), data));
                
                c1.setBorder(Rectangle.BOTTOM);
                c1.setBorderColor(lg);
                c1.setFixedHeight(25f);
                c1.setHorizontalAlignment(Element.ALIGN_LEFT);
                c1.setVerticalAlignment(Element.ALIGN_CENTER);
                
                c2.setBorder(Rectangle.BOTTOM);
                c2.setBorderColor(lg);;
                c2.setHorizontalAlignment(Element.ALIGN_LEFT);
                c2.setVerticalAlignment(Element.ALIGN_CENTER);
                c2.setPaddingBottom(5f);
                
                if(i == 0)
                {
                    c1.setBackgroundColor(colors[0]);
                    c2.setBackgroundColor(colors[0]);
                    i = 1;
                }
                else
                {
                    c1.setBackgroundColor(colors[1]);
                    c2.setBackgroundColor(colors[1]);
                    i = 0;
                }
                
                table.addCell(c1);
                table.addCell(c2);
            }
            
            document.add(table);
            document.close();
            prog.close();
            pstmt.close();
            con.close();
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        typeTotalNumberOfPages(filename);

    }
    
    public String getFilename()
    {
        return filename;
    }
    
    private void connect()
    {
        try
        {
            // Load the drivers
            String driver = "org.apache.derby.jdbc.ClientDriver";
            Class.forName(driver);
            System.out.println("Driver Loaded ---> " + driver);

            // URL, Username and Password and Connect to DB
            String url = "jdbc:derby://localhost:1527/EruditioAcademyDB";
            con = DriverManager.getConnection(url, "app", "app");
        }catch(ClassNotFoundException | SQLException e)
        {
            e.getMessage();
        }
    }
    
 
    private void typeTotalNumberOfPages(String path)
    {
        try
        {
            Font footerText = new Font(Font.FontFamily.HELVETICA, 18, Font.NORMAL, BaseColor.BLACK);
            PdfReader reader = new PdfReader(path + "initial.pdf");
            int n = reader.getNumberOfPages();
            PdfStamper stamper = new PdfStamper(reader, out);//new FileOutputStream(path + ".pdf"));
            PdfContentByte pagecontent;
            for (int i = 1; i <= n; i++) 
            {
                pagecontent = stamper.getOverContent(i);
                ColumnText.showTextAligned(pagecontent, Element.ALIGN_RIGHT, new Phrase("" + n, footerText), 60f + 470, 20f, 0);
            }
            stamper.close();
            reader.close();
            out.flush();
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        File file = new File(path + "initial.pdf");
        file.delete();
    }
    
}
