package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Studenti;
import pojo.Cursuri;
import pojo.Proiect;
import DAOImpl.ProiectDaoImpl;
import DAOImpl.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;

/**
 *
 * @author vali
 */
public class ProiectController extends HttpServlet {

	Proiect proiect = new Proiect();
	ProiectDaoImpl proiectDaoImpl = new ProiectDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaProiect") != null) {
			// preluarea parametrilor de interes
			Integer idstudent = java.lang.Integer.parseInt(request.getParameter("idstudent"));
			Integer idcurs = java.lang.Integer.parseInt(request.getParameter("idcurs"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Studenti student = (Studenti) session.get(Studenti.class, idstudent);
			Cursuri curs = (Cursuri) session.get(Cursuri.class, idcurs);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date data_predare = null;
			try {
				data_predare = df.parse(request.getParameter("data_predare"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String denumire = request.getParameter("denumire");
			String sesiune_examinare = request.getParameter("sesiune_examinare");
			String descriere = request.getParameter("descriere");

			proiect.setStudenti(student);
			proiect.setCursuri(curs);
			proiect.setDataPredare(data_predare);
			proiect.setDenumire(denumire);
			proiect.setSesiuneExaminare(sesiune_examinare);
			proiect.setDescriere(descriere);

			proiectDaoImpl.adaugaProiect(proiect);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Proiect.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaProiect") != null) {
			List<Proiect> listaProiect = new ArrayList();
			listaProiect = proiectDaoImpl.afiseazaProiect();
			request.setAttribute("listaProiect", listaProiect);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Proiect.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaProiect") != null) {
			Integer id1 = Integer.parseInt(request.getParameter("idproiect"));
			// preluarea parametrilor de interes
			String idstudentStr = request.getParameter("idstudent");
			Studenti student = null;
			if (idstudentStr != null && !idstudentStr.isEmpty()) {
				Integer idstudent = Integer.parseInt(idstudentStr);
				Session session = HibernateUtil.getSessionFactory().openSession();
				student = (Studenti) session.get(Studenti.class, idstudent);
				session.close();
			}
			String idcursStr = request.getParameter("idcurs");
			Cursuri curs = null;
			if (idcursStr != null && !idcursStr.isEmpty()) {
				Integer idcurs = Integer.parseInt(idcursStr);
				Session session = HibernateUtil.getSessionFactory().openSession();
				curs = (Cursuri) session.get(Cursuri.class, idcurs);
				session.close();
			}

			Date data_predare = null;
			String dataPredareStr = request.getParameter("data_predare");
			if (dataPredareStr != null && !dataPredareStr.isEmpty()) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				try {
					data_predare = df.parse(dataPredareStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			String denumire = request.getParameter("denumire");
			if (denumire != null && denumire.isEmpty()) denumire = null;
			String sesiune_examinare = request.getParameter("sesiune_examinare");
			if (sesiune_examinare != null && sesiune_examinare.isEmpty()) sesiune_examinare = null;
			String descriere = request.getParameter("descriere");
			if (descriere != null && descriere.isEmpty()) descriere = null;

			proiectDaoImpl.modificaProiect(id1, student, curs, data_predare, denumire, sesiune_examinare, 
					descriere);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Proiect.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeProiect") != null) {
			Integer id2 = Integer.parseInt(request.getParameter("idproiect"));
			proiect.setIdproiect(id2);
			proiectDaoImpl.stergeProiect(proiect);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Proiect.jsp");
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


