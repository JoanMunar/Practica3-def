package controller;

/**
 * Created by alea on 16/02/2017.
 */

import dao.RolDaoImpl;
import dao.UserDaoImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Rol;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ControllerUserForm extends HttpServlet {

    private static ApplicationContext beans = new ClassPathXmlApplicationContext("bean-config.xml");
    UserDaoImpl userDaoImp = (UserDaoImpl) beans.getBean("userDaoImp");
    RolDaoImpl rolDaoImp = (RolDaoImpl) beans.getBean("rolDaoImp");

    private List<Rol> llistaRol = new ArrayList<Rol>();

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            llistaRol = rolDaoImp.getAllRols();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("llistaRol", llistaRol);

        req.getRequestDispatcher("crearUsuari.jsp").forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nom;
        String password;
        String[] rols;

        if (req.getParameter("nom") != null) {

            nom = req.getParameter("nom");
            password = req.getParameter("password");
            rols = req.getParameterValues("rol");

            try {
                userDaoImp.altaUser(nom, password, rols);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect("llistaUsuaris");

    }
}
