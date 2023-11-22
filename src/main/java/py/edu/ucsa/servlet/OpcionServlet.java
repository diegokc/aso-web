package py.edu.ucsa.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import py.com.ucsa.jdbc.dao.DAOFactory;
import py.com.ucsa.jdbc.dao.DominioDao;
import py.com.ucsa.jdbc.dao.OpcionDao;
import py.com.ucsa.jdbc.dto.Dominio;
import py.com.ucsa.jdbc.dto.Opcion;

@WebServlet(description = "Primer servlet", urlPatterns = { "/OpcionServlet" })
public class OpcionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OpcionDao opcionDao = DAOFactory.getOpcionesDao();
		DominioDao dominioDao = DAOFactory.getDominiosDao();

		if (Objects.isNull(request.getParameter("ACCION")) || "".equals(request.getParameter("ACCION"))
				|| "LISTAR".equals(request.getParameter("ACCION"))) {
			System.out.println("LISTAR ACCION");
			if (Objects.isNull(request.getParameter("FORMATO")) || "HTML".equals(request.getParameter("FORMATO"))) {

				System.out.println("FORMATO HTML");

				request.getSession().setAttribute("OPCIONES", opcionDao.listar());
				request.getSession().setAttribute("DOMINIOS", dominioDao.listar());

				request.getRequestDispatcher("opcion-listar.jsp").forward(request, response);
				
			} else if ("JSON".equals(request.getParameter("FORMATO"))) {
				response.setContentType("application/json");
				if (Objects.isNull(request.getParameter("ID-DOMINIO"))) {
					System.out.println("ID-DOMINIO null");
					
					List<Opcion> opl = opcionDao.listar();
					response.getWriter().print(JSONArray.fromObject(opl));
				} else {
					System.out.println("ID-DOMINIO = " +request.getParameter("ID-DOMINIO"));
					
					List<Opcion> opl = opcionDao.getOpcionByIdDominio( Integer.parseInt(request.getParameter("ID-DOMINIO")) );
					
					System.out.println(JSONArray.fromObject(opl));
					
					response.getWriter().print(JSONArray.fromObject(opl));
//				}else {
//					Opcion op = opcionDao.getById( Integer.parseInt(request.getParameter("ID-DOMINIO")) );
//					response.getWriter().print( JSONObject.fromObject(  op ) );
				}
			}

		} else if ("NUEVO".equals(request.getParameter("ACCION"))) {
			System.out.println("NUEVA OPCION");

			request.getSession().setAttribute("OPCIONES", opcionDao.listar());
			request.getSession().setAttribute("DOMINIOS", dominioDao.listar());

			request.getRequestDispatcher("opcion-abm.jsp").forward(request, response);
		} else if ("EDITAR".equals(request.getParameter("ACCION"))) {
			System.out.println("EDITAR OPCION");

			Integer id = Integer.parseInt(request.getParameter("ID"));
			request.getSession().setAttribute("OPCION", DAOFactory.getOpcionesDao().getById(id));
			request.getSession().setAttribute("OPCIONES", opcionDao.listar());
			request.getSession().setAttribute("DOMINIOS", dominioDao.listar());

			request.getRequestDispatcher("opcion-abm.jsp").forward(request, response);
		}
		/*
		 * } else if( "INSERTAR".equals(request.getParameter("ACCION")) ) {
		 * System.out.println("insertar socio"); Socio nuevo = new Socio();
		 * nuevo.setNombres(request.getParameter("nombres-socio"));
		 * nuevo.setApellidos(request.getParameter("apellidos-socio"));
		 * socioDAO.insertar(nuevo);
		 * request.setAttribute("MENSAJE","EL SOCIO HA SIGO GUARDADO CON EXITO");
		 * 
		 * request.getSession().setAttribute("SOCIOS", socioDAO.listar());
		 * 
		 * request.getRequestDispatcher("listar-socio.jsp").forward(request, response);
		 * }
		 */
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OpcionDao opcionDao = DAOFactory.getOpcionesDao();
		DominioDao dominioDao = DAOFactory.getDominiosDao();

		if ("ACTUALIZAR".equals(request.getParameter("ACCION"))) {
			System.out.println("ACTUALIZAR OPCION");
			Opcion op = (Opcion) request.getSession().getAttribute("OPCION");

			op.setCodigo(request.getParameter("codigo"));
			op.setDescripcion(request.getParameter("descripcion"));
			op.setEstado(request.getParameter("estado"));

			if (Objects.nonNull(request.getParameter("dominio")) || !"".equals(request.getParameter("dominio"))) {
				op.setDominio(new Dominio(Integer.parseInt(request.getParameter("dominio"))));
				System.out.println("new Dominio(Integer.parseInt(request.getParameter(\"dominio\")))");
			}
			op.setOpcionPadre(new Opcion(Integer.parseInt(request.getParameter("opcionpadre"))));

			System.out.println(op.toString());
			opcionDao.modificar(op);

			System.out.println("opcionDao.modificar(op);");

			/*
			 * request.getSession().setAttribute("OPCIONES", opcionDao.listar());
			 * request.getSession().setAttribute("DOMINIOS", dominioDao.listar());
			 * 
			 * request.getRequestDispatcher("opcion-listar.jsp").forward(request, response);
			 */
			doGet(request, response);
		} else if ("INSERTAR".equals(request.getParameter("ACCION"))) {
			
			System.out.println("INSERTAR OPCION");
			Opcion op = new Opcion();

			op.setCodigo(request.getParameter("codigo"));
			op.setDescripcion(request.getParameter("descripcion"));
			op.setEstado(request.getParameter("estado"));

			if (Objects.nonNull(request.getParameter("dominio")) || !"".equals(request.getParameter("dominio"))) {
				op.setDominio(new Dominio(Integer.parseInt(request.getParameter("dominio"))));
				System.out.println("new Dominio(Integer.parseInt(request.getParameter(\"dominio\")))");
			}
			op.setOpcionPadre(new Opcion(Integer.parseInt(request.getParameter("opcionpadre"))));

			System.out.println(op.toString());
			
			opcionDao.insertar(op);
			
			System.out.println("opcionDao.insertar(op);");
			
			doGet(request, response);
		}
	}

}
