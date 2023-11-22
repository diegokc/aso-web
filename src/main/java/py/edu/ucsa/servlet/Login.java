package py.edu.ucsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Login
 */
@WebServlet(description = "Login servlet", 
		urlPatterns = {"/Login","/Logout"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		if(request.getParameter("usuario")!=null) {
			session.setAttribute("usuario", request.getParameter("usuario"));
		}
		
		PrintWriter pw = response.getWriter();
		pw.print("<html>");
		pw.print("<head><title>Login</title></head>");
		pw.print("<body><p>Login</p></body>");
		pw.print("<p><a href=\"index.jsp\">ir al inicio</a></p>");
		pw.print("</html>");
	} 

}
