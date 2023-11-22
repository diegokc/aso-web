package py.edu.ucsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import py.com.ucsa.jdbc.dao.DAOFactory;
import py.com.ucsa.jdbc.dao.SocioDao;
import py.com.ucsa.jdbc.dto.Socio;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

/**
 * Servlet implementation class SocioServlet
 */
@WebServlet(
		description = "Primer servlet", 
		urlPatterns = {"/SocioServlet"	})
public class SocioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SocioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SocioDao socioDAO = DAOFactory.getSocioDao();
		
		if( Objects.isNull(request.getParameter("ACCION"))
			|| "".equals(request.getParameter("ACCION"))
			|| "LISTAR".equals(request.getParameter("ACCION")) ) {

			System.out.println("listar socio");
			
				List<Socio> socios = socioDAO.listar();
				
				System.out.println(socios.toString());
				
				request.getSession().setAttribute("SOCIOS", socios);
				
				request.getRequestDispatcher("listar-socio.jsp").forward(request, response);
				
			} else if(  "NUEVO".equals(request.getParameter("ACCION")) ) {
				System.out.println("nuevo socio");
				
				List<Socio> socios = socioDAO.listar();
				request.getSession().setAttribute("SOCIOS", socios);
				request.getSession().setAttribute("ESTADOS_SOCIOS", DAOFactory.getOpcionesDao().getOpcionByCodDominio("ESTSOC"));
				request.getSession().setAttribute("TIPOS_SOCIO", DAOFactory.getOpcionesDao().getOpcionByCodDominio("TIPSOC"));
				
				request.getRequestDispatcher("abm-socio.jsp").forward(request, response);
				
			} else if(  "INSERTAR".equals(request.getParameter("ACCION")) ) {
				System.out.println("insertar socio");
				Socio nuevo = new Socio();
				nuevo.setNombres(request.getParameter("nombres-socio"));
				nuevo.setApellidos(request.getParameter("apellidos-socio"));
				socioDAO.insertar(nuevo);
				request.setAttribute("MENSAJE","EL SOCIO HA SIGO GUARDADO CON EXITO");
				
				request.getSession().setAttribute("SOCIOS", socioDAO.listar());
				
				request.getRequestDispatcher("listar-socio.jsp").forward(request, response);
			}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter pw = response.getWriter();
		pw.print("<html>");
		
	}

}
