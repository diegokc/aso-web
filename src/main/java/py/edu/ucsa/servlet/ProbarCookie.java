package py.edu.ucsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/ProbarCookie")
public class ProbarCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public ProbarCookie() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//CREAMOS LA PÁGINA HTML A SER ENVIADA AL BROWSER
		out.print("<html><head><title>Enviar Cookies</title></head>");
		//CONTENIDO QUE ENVIAMOS EN EL BODY
		out.print("<body><h1>Estamos enviando cookies al navegador!!!</h1>");
		//INSTANCIAMOS LA COOKIE, EL CONTENIDO ES EL VALOR DEL PARAMETRO DE REQUEST "usuario"
		Cookie cookie = new Cookie("cookieUsuario", request.getParameter("usuario"));
		//HACEMOS QUE LA COOKIE NO SEA PERSISTENTE EN EL CLIENTE, SERÁ BORRADA AL CERRAR EL BROWSER
		cookie.setMaxAge(-1);
		//AGREGAMOS LA COOKIE AL RESPONSE
		response.addCookie(cookie);
		//TERMINAMOS LA PÁGINA HTML
		out.print("<p><a href=\"index.jsp\">ir al inicio</a></p>");
		out.print("</body></htm1>");

	}

}
