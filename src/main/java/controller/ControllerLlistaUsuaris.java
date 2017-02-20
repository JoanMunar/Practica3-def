package controller;

/**
 * Created by aleat on 16/02/2017.
 */

import dao.RolDaoImpl;
import dao.UserDaoImpl;
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


public class ControllerLlistaUsuaris extends HttpServlet {

    private List<User> llistaUsuaris = new ArrayList<User>();
    private List<Rol> llistaRols = new ArrayList<Rol>();
    private static ApplicationContext beans = new ClassPathXmlApplicationContext("bean-config.xml");

    UserDaoImpl userDaoImp = (UserDaoImpl) beans.getBean("userDaoImp");
    RolDaoImpl rolDaoImp = (RolDaoImpl) beans.getBean("rolDaoImp");

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("findUser") != null) {
            try {
                if (userDaoImp.findUser(req.getParameter("findUser")) != null) {

                    if (req.getParameter("fillRol") != null) {

                        if (req.getParameter("fillRol").equals("fillRol")) {
                            req.setAttribute("findUser", userDaoImp.findUser(req.getParameter("findUser"), true));

                        }
                    } else {
                        req.setAttribute("findUser", userDaoImp.findUser(req.getParameter("findUser"), false));

                    }

                } else {
                    req.setAttribute("error", "L'usuari no existeix");

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        try {
            llistaUsuaris = userDaoImp.getAllUsers();
            llistaRols = rolDaoImp.getAllRols();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("llistaUsuaris", llistaUsuaris);
        req.setAttribute("llistaRol", llistaRols);

        req.getRequestDispatcher("llistaUsuaris.jsp").forward(req, resp);

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom;
        String nouNom;
        List<Rol> rols;

        if (req.getParameter("baixaUser") != null) {

            nom = req.getParameter("baixaUser");

            try {
                userDaoImp.baixaUser(nom);
                resp.sendRedirect("llistaUsuaris");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(req.getParameter("nouNom") != null){
            nom = req.getParameter("nom");
            nouNom = req.getParameter("nouNom");

            try {
                rols = userDaoImp.findUser(nom, true).getRols();
                userDaoImp.modUser(nom, nouNom, rols);
                resp.sendRedirect("llistaUsuaris");
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
