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
import pojo.Cursuri;
import DAO.CursuriDao;

/**
 *
 * @author vali
 */
public class CursuriDaoImpl implements CursuriDao{

    public void adaugaCursuri(Cursuri curs) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(curs);
        transaction.commit();
        session.close();
    }

    public List<Cursuri> afiseazaCursuri() {
        List<Cursuri> listaCursuri = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Cursuri");
        listaCursuri = query.list();
        return listaCursuri;
    }

    public void modificaCursuri(int idcurs, String denumire, String nume_profesor,
    		String sala, String metoda_notare, String structura) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Cursuri detaliicursuri = (Cursuri) session.load(Cursuri.class, idcurs);
        if (denumire != null && !denumire.isEmpty()) {
            detaliicursuri.setDenumire(denumire);
        }
        if (nume_profesor != null && !nume_profesor.isEmpty()) {
            detaliicursuri.setNumeProfesor(nume_profesor);
        }
        if (sala != null && !sala.isEmpty()) {
            detaliicursuri.setSala(sala);
        }
        if (metoda_notare != null && !metoda_notare.isEmpty()) {
            detaliicursuri.setMetodaNotare(metoda_notare);
        }
        if (structura != null && !structura.isEmpty()) {
            detaliicursuri.setStructura(structura);
        }
        session.update(detaliicursuri);
        transaction.commit();
        session.close();
    }

    public void stergeCurs(Cursuri curs) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(curs);
        transaction.commit();
        session.close();
    }
}
