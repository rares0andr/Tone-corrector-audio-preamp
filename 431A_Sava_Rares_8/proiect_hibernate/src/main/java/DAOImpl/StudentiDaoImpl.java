/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Studenti;
import DAO.StudentiDao;

/**
 *
 * @author vali
 */
public class StudentiDaoImpl implements StudentiDao{

    public void adaugaStudenti(Studenti student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(student);
        transaction.commit();
        session.close();
    }

    public List<Studenti> afiseazaStudenti() {
        List<Studenti> listaStudenti = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Studenti");
        listaStudenti = query.list();
        return listaStudenti;
    }

    public void modificaStudenti(int idstudent, String nume, String initiala_tata,
    		String prenume, Date data_nasterii, String cnp, String adresa,
    		String facultate, String ciclu_studii, String an_studii) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Studenti detaliistudenti = (Studenti) session.load(Studenti.class, idstudent);
        if (nume != null && !nume.isEmpty()) {
            detaliistudenti.setNume(nume);
        }
        if (initiala_tata != null && !initiala_tata.isEmpty()) {
            detaliistudenti.setInitialaTata(initiala_tata);
        }
        if (prenume != null && !prenume.isEmpty()) {
            detaliistudenti.setPrenume(prenume);
        }
        if (data_nasterii != null) {
            detaliistudenti.setDataNasterii(data_nasterii);
        }
        if (cnp != null && !cnp.isEmpty()) {
            detaliistudenti.setCnp(cnp);
        }
        if (adresa != null && !adresa.isEmpty()) {
            detaliistudenti.setAdresa(adresa);
        }
        if (facultate != null && !facultate.isEmpty()) {
            detaliistudenti.setFacultate(facultate);
        }
        if (ciclu_studii != null && !ciclu_studii.isEmpty()) {
            detaliistudenti.setCicluStudii(ciclu_studii);
        }
        if (an_studii != null && !an_studii.isEmpty()) {
            detaliistudenti.setAnStudii(an_studii);
        }
        session.update(detaliistudenti);
        transaction.commit();
        session.close();
    }

    public void stergeStudent(Studenti student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(student);
        transaction.commit();
        session.close();
    }

    public Studenti getStudentById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Studenti student = session.get(Studenti.class, id);
        session.close();
        return student;
    }
}
