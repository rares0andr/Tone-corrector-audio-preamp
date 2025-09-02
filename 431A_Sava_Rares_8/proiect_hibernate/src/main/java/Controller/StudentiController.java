
package Controller;

import DAO.StudentiDao;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Studenti;
import DAOImpl.StudentiDaoImpl;

/**
 *
 * @author vali
 */
public class StudentiController extends HttpServlet {

	Studenti student = new Studenti();
	StudentiDaoImpl studentDaoImpl = new StudentiDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaStudent") != null) {
			String nume = request.getParameter("nume");
			String initiala_tata = request.getParameter("initiala_tata");
			String prenume = request.getParameter("prenume");
			
			Date data_nasterii = null;
			String dataNasteriiStr = request.getParameter("data_nasterii");
			if (dataNasteriiStr != null && !dataNasteriiStr.isEmpty()) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				try {
					data_nasterii = df.parse(dataNasteriiStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			String cnp = request.getParameter("cnp");
			String adresa = request.getParameter("adresa");
			String facultate = request.getParameter("facultate");
			String ciclu_studii = request.getParameter("ciclu_studii");
			String an_studii = request.getParameter("an_studii");
			
			student.setNume(nume);
			student.setInitialaTata(initiala_tata);
			student.setPrenume(prenume);
			student.setDataNasterii(data_nasterii);
			student.setCnp(cnp);
			student.setAdresa(adresa);
			student.setFacultate(facultate);
			student.setCicluStudii(ciclu_studii);
			student.setAnStudii(an_studii);
			studentDaoImpl.adaugaStudenti(student);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Student.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaStudenti") != null) {
			List<Studenti> listaStudenti = new ArrayList();
			listaStudenti = studentDaoImpl.afiseazaStudenti();
			request.setAttribute("listaStudenti", listaStudenti);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Studenti.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaStudent") != null) {
			int id1 = Integer.parseInt(request.getParameter("idstudent"));
			String nume = request.getParameter("nume");
			if (nume != null && nume.isEmpty()) nume = null;
			String initiala_tata = request.getParameter("initiala_tata");
			if (initiala_tata != null && initiala_tata.isEmpty()) initiala_tata = null;
			String prenume = request.getParameter("prenume");
			if (prenume != null && prenume.isEmpty()) prenume = null;
			
			Date data_nasterii = null;
			String dataNasteriiStr = request.getParameter("data_nasterii");
			if (dataNasteriiStr != null && !dataNasteriiStr.isEmpty()) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				try {
					data_nasterii = df.parse(dataNasteriiStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			String cnp = request.getParameter("cnp");
			if (cnp != null && cnp.isEmpty()) cnp = null;
			String adresa = request.getParameter("adresa");
			if (adresa != null && adresa.isEmpty()) adresa = null;
			String facultate = request.getParameter("facultate");
			if (facultate != null && facultate.isEmpty()) facultate = null;
			String ciclu_studii = request.getParameter("ciclu_studii");
			if (ciclu_studii != null && ciclu_studii.isEmpty()) ciclu_studii = null;
			String an_studii = request.getParameter("an_studii");
			if (an_studii != null && an_studii.isEmpty()) an_studii = null;
			studentDaoImpl.modificaStudenti(id1, nume, initiala_tata, prenume,
					data_nasterii, cnp, adresa, facultate, ciclu_studii, an_studii);

			// Fetch the updated student and set as attribute
			Studenti updatedStudent = studentDaoImpl.getStudentById(id1);
			request.setAttribute("student", updatedStudent);

			RequestDispatcher rd = request.getRequestDispatcher("adauga_Student.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeStudent") != null) {
			int id2 = Integer.parseInt(request.getParameter("idstudent"));
			student.setIdstudent(id2);
			studentDaoImpl.stergeStudent(student);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Student.jsp");
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


