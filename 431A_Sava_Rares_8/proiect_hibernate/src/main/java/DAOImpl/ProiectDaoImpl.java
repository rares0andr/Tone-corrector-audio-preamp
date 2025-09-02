/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Proiect;
import DAO.ProiectDao;
import java.util.Date;
import pojo.Cursuri;
import pojo.Studenti;

/**
 *
 * @author vali
 */
public class ProiectDaoImpl implements ProiectDao{

    public void adaugaProiect(Proiect proiect) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(proiect);
        transaction.commit();
        session.close();
    }

    public List<Proiect> afiseazaProiect() {
        List<Proiect> listaProiect = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Proiect");
        listaProiect = query.list();
        return listaProiect;
    }

    public void modificaProiect(Integer idproiect, Studenti student,
    		Cursuri curs, Date data_predare, String denumire, String sesiune_examinare,
    		String descriere) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Proiect detaliiproiecte;
        detaliiproiecte = (Proiect) session.load(Proiect.class, idproiect);
        if (student != null) {
            detaliiproiecte.setStudenti(student);
        }
        if (curs != null) {
            detaliiproiecte.setCursuri(curs);
        }
        if (data_predare != null) {
            detaliiproiecte.setDataPredare(data_predare);
        }
        if (denumire != null && !denumire.isEmpty()) {
            detaliiproiecte.setDenumire(denumire);
        }
        if (sesiune_examinare != null && !sesiune_examinare.isEmpty()) {
            detaliiproiecte.setSesiuneExaminare(sesiune_examinare);
        }
        if (descriere != null && !descriere.isEmpty()) {
            detaliiproiecte.setDescriere(descriere);
        }
        session.update(detaliiproiecte);
        transaction.commit();
        session.close();
    }

    public void stergeProiect(Proiect proiect) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(proiect);
        transaction.commit();
        session.close();
    }
}
