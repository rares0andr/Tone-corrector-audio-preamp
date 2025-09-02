    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Proiect;
import java.util.Date;
import pojo.Cursuri;
import pojo.Studenti;

/**
 *
 * @author vali
 */
public interface ProiectDao {
    public void adaugaProiect (Proiect proiect);
    public List<Proiect> afiseazaProeict();
    public void modificaProeict (Integer idproeict, Studenti student, 
    		Cursuri curs, Date data_predare, String denumire, String sesiune_examinare,
    		String descriere);
    public void stergeProiect (Proiect proiect);
}

    
