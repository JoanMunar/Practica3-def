package classes;

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

/**
 * Created by aleat on 20/02/2017.
 */
public class CheckAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ApplicationContext beans = new ClassPathXmlApplicationContext("bean-config.xml");

        UserDaoImpl userDaoImp = (UserDaoImpl) beans.getBean("userDaoImp");

        String user_role = req.getRemoteUser();

        Boolean admin = false;

        try {
            User user = userDaoImp.findUser(user_role,true);

            for (Rol rol : user.getRols()) {

                if(rol.getNomRol().equals("admin")){

                    admin = true;

                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("admin", admin);

    }
}
