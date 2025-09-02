package Controller;

import DAO.CursuriDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Cursuri;
import DAOImpl.CursuriDaoImpl;

/**
 *
 * @author vali
 */
public class CursuriController extends HttpServlet {

	Cursuri curs = new Cursuri();
	CursuriDaoImpl cursDaoImpl = new CursuriDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaCurs") != null) {
			String denumire = request.getParameter("denumire");
			String nume_profesor = request.getParameter("nume_profesor");
			String sala = request.getParameter("sala");
			String metoda_notare = request.getParameter("metoda_notare");
			String structura = request.getParameter("structura");
			
			curs.setDenumire(denumire);
			curs.setNumeProfesor(nume_profesor);
			curs.setSala(sala);
			curs.setMetodaNotare(metoda_notare);
			curs.setStructura(structura);
			cursDaoImpl.adaugaCursuri(curs);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Curs.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaCursuri") != null) {
			List<Cursuri> listaCursuri = new ArrayList();
			listaCursuri = cursDaoImpl.afiseazaCursuri();
			request.setAttribute("listaCursuri", listaCursuri);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Cursuri.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaCurs") != null) {
			int id1 = Integer.parseInt(request.getParameter("idcurs"));
			String denumire = request.getParameter("denumire");
			if (denumire != null && denumire.isEmpty()) denumire = null;
			String nume_profesor = request.getParameter("nume_profesor");
			if (nume_profesor != null && nume_profesor.isEmpty()) nume_profesor = null;
			String sala = request.getParameter("sala");
			if (sala != null && sala.isEmpty()) sala = null;
			String metoda_notare = request.getParameter("metoda_notare");
			if (metoda_notare != null && metoda_notare.isEmpty()) metoda_notare = null;
			String structura = request.getParameter("structura");
			if (structura != null && structura.isEmpty()) structura = null;
			cursDaoImpl.modificaCursuri(id1, denumire, nume_profesor, sala, 
					metoda_notare, structura);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Curs.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeCurs") != null) {
			int id2 = Integer.parseInt(request.getParameter("idcurs"));
			curs.setIdcurs(id2);
			cursDaoImpl.stergeCurs(curs);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Curs.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}


