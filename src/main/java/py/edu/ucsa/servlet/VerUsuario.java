package py.edu.ucsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/VerUsuario")
public class VerUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public VerUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		
		PrintWriter pw = response.getWriter();
		pw.print("<html>");
		pw.print("<head><title>Ver usuario</title></head>");
		pw.print("<body>");
		
		pw.print("<h1>Ver usuario</h1>");
		pw.print("<p><a href=\"index.jsp\">ir al inicio</a></p>");
		
		if(session!=null) {
			String usuario = (String)session.getAttribute("usuario");
			pw.print("<h3>"+usuario+"</h3>");
		} else {
			pw.print("<h3>la aplicacion no obtuvo la session</h3>");
		}

		pw.print("</body>");
		pw.print("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
