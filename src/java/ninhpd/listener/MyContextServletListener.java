/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ninhpd.listener;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author ACER
 */
public class MyContextServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("app deploying.....");
        // get site maps
        ServletContext context = sce.getServletContext();
        String siteMapFilePath = context.getInitParameter("SITE_MAPS_FILE_PATH");
        // read file store 
        Properties siteMaps = new Properties();
        InputStream is = null;
        
        try {
            is = context.getResourceAsStream(siteMapFilePath);
            siteMaps.load(is);
            context.setAttribute("SITE_MAPS", siteMaps);
            
        } catch (IOException ex) {
            context.log("My context "+ex.getMessage());
        } finally {
            if(is != null){
                try {
                    is.close();
                } catch (IOException ex) {
                      context.log("My context "+ex.getMessage());
                }
            }
        }
        
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("app destroying....");
    }
}
