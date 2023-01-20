/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.text.TextAlignment;

/**
 *
 * @author Marvin
 */

public class HeaderFooterPageEvent extends PdfPageEventHelper {
    BaseColor grey = new BaseColor(61, 61, 61);
    Font hf = new Font(Font.FontFamily.HELVETICA, 11, Font.NORMAL, BaseColor.WHITE);
    Font head = new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD, BaseColor.WHITE);
    BaseColor violet = new BaseColor(99, 66, 178);
    String headerTitle;
    String timeStamp;
    
    public HeaderFooterPageEvent()
    {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        timeStamp = df.format(cal.getTime());
    }
    
    @Override
    public void onStartPage(PdfWriter writer, Document document) {
        // DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        // Calendar cal = Calendar.getInstance();
        float columnWidth[] = {PageSize.LETTER.getWidth()};
        PdfPTable table = new PdfPTable(columnWidth);
        try {
            //#6342B2
            // cellName.setBackgroundColor(new BaseColor(99, 66, 178)
            Image img = Image.getInstance("report_header2.png");
            //img.setScaleToFitHeight(true);
            img.scaleAbsolute(PageSize.LETTER.getWidth(), 90f);
            img.setScaleToFitLineWhenOverflow(true);
            PdfPCell logo = new PdfPCell(img);
//            logo.setBackgroundColor(violet);
            logo.setHorizontalAlignment(Element.ALIGN_CENTER);
            logo.setVerticalAlignment(Element.ALIGN_CENTER);
            logo.setBorder(Rectangle.NO_BORDER);
            logo.setFixedHeight(80f);
            
            /*
            PdfPCell blank = new PdfPCell();
            blank.setBackgroundColor(new BaseColor(99, 66, 178));
            blank.setBorder(Rectangle.NO_BORDER);
            blank.setPadding(0);
            
            PdfPTable sub = new PdfPTable(new float[] {10f, 240f});
            PdfPCell address = new PdfPCell(new Phrase(new Chunk("47 Kalayaan Avenue, Diliman,\nQuezon City 1101 Philippines", hf)));
            address.setBackgroundColor(violet);
            address.setHorizontalAlignment(Element.ALIGN_CENTER);
            address.setVerticalAlignment(Element.ALIGN_CENTER);
            address.setBorder(Rectangle.NO_BORDER);
            address.setFixedHeight(45f);
            address.setPadding(0);
            
            
            PdfPCell title = new PdfPCell(new Phrase(new Chunk("Eruditio Academy\n", head)));
            title.setBackgroundColor(violet);
            title.setHorizontalAlignment(Element.ALIGN_CENTER);
            title.setVerticalAlignment(Element.ALIGN_BOTTOM);
            title.setBorder(Rectangle.NO_BORDER);
            title.setFixedHeight(35f);
            
            sub.addCell(blank);
            sub.addCell(title);
            sub.addCell(blank);
            sub.addCell(address);
            
            PdfPCell mid = new PdfPCell(sub);
            mid.setBackgroundColor(violet);
            mid.setPadding(0);
            mid.setBorder(Rectangle.NO_BORDER);
            mid.setHorizontalAlignment(Element.ALIGN_CENTER);
            mid.setVerticalAlignment(Element.ALIGN_CENTER);
            mid.setFixedHeight(sub.getTotalHeight());   
            
            
            
            PdfPCell contacts = new PdfPCell(new Phrase("Contact us\n Phone: (02) 7213 7246 | (02) 8478 5165 \n Mobile: 0906 058 5888 | 0921 766 8148\n"+
                    "0917 322 0507\nEmail: Eruditio.Academy21@gmail.com", hf));
            contacts.setBackgroundColor(violet);
            contacts.setHorizontalAlignment(Element.ALIGN_CENTER);
            contacts.setVerticalAlignment(Element.ALIGN_CENTER);
            contacts.setBorder(Rectangle.NO_BORDER);
            contacts.setFixedHeight(80f);
            
            
            table.addCell(logo);
            table.addCell(blank);
            table.addCell(mid);
            table.addCell(blank);
            table.addCell(contacts);
            table.addCell(blank);
            */
            
            table.addCell(logo);

            float tableHeight = table.getTotalHeight();
            table.setTotalWidth(PageSize.LETTER.getWidth()); // document.right() - document.left()
            table.writeSelectedRows(0, -1,
            0f,//document.left(),
            PageSize.LETTER.getHeight() -10, // + tableHeight,    //((document.topMargin() + tableHeight))
            writer.getDirectContent());
        } catch (BadElementException ex) {
            Logger.getLogger(HeaderFooterPageEvent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HeaderFooterPageEvent.class.getName()).log(Level.SEVERE, null, ex);
        }catch(DocumentException e){
            e.getMessage();
        }
        
        
        Paragraph para= new Paragraph();
        Phrase header = new Phrase(headerTitle, hf);
        //Chunk glue = new Chunk(new VerticalPositionMark());
        //header.add(glue);
        //Phrase date = new Phrase(df.format(cal.getTime()),hf);
        
    }

    // for footer table xpos = 0f, ypos = 80f
    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        
  
            Font footerText = new Font(Font.FontFamily.HELVETICA, 18, Font.NORMAL, BaseColor.BLACK);
                  
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar cal = Calendar.getInstance();
        
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_LEFT, new Phrase(timeStamp, footerText), 65f, 20f, 0);
             ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_RIGHT, new Phrase("Page " + document.getPageNumber()
                    + " of ", footerText), 60f + 460, 20f, 0);
            
 
        
        PdfContentByte canvas = writer.getDirectContent();
        canvas.setColorStroke(violet);
        canvas.setLineWidth(6f);
        canvas.moveTo(0, PageSize.LETTER.getBottom() + 3);
        canvas.lineTo(PageSize.LETTER.getWidth(), PageSize.LETTER.getBottom() + 3);
        canvas.stroke();
        canvas.setLineWidth(2f);
        canvas.moveTo(0, PageSize.LETTER.getBottom() + 61);
//        canvas.lineTo(PageSize.LETTER.getWidth(), PageSize.LETTER.getBottom() + 61); //60f + 490
//        canvas.stroke();
    }

}
