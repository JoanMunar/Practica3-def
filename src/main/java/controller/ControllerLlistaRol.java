package controller;

/**
 * Created by alea on 16/02/2017.
 */

import dao.RolDaoImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Rol;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ControllerLlistaRol extends HttpServlet {

    private List<Rol> llistaRols = new ArrayList<Rol>();
    private static ApplicationContext beans = new ClassPathXmlApplicationContext("bean-config.xml");
    RolDaoImpl rolDaoImp = (RolDaoImpl) beans.getBean("rolDaoImp");

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            llistaRols = rolDaoImp.getAllRols();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("llistaRol", llistaRols);
        req.getRequestDispatcher("llistaRol.jsp").forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String rol;
        String nouRol;
        List<User> userList;

        if (req.getParameter("baixaRol") != null) {

            rol = req.getParameter("baixaRol");

            try {
                rolDaoImp.baixaRol(rol);
                resp.sendRedirect("llistaRol");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(req.getParameter("nouRol") != null){
            rol = req.getParameter("rol");
            nouRol = req.getParameter("nouRol");

            try {
                userList = rolDaoImp.obtenirRol(rol).getLlistaUsuaris();
                rolDaoImp.modRol(rol, nouRol, userList);
                resp.sendRedirect("llistaRol");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
