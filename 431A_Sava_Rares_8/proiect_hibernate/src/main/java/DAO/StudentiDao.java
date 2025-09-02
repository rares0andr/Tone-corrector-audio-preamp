    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.Date;
import java.util.List;
import pojo.Studenti;

/**
 *
 * @author vali
 */
public interface StudentiDao {
    public void adaugaStudenti (Studenti student);
    public List<Studenti> afiseazaStudenti();
    public void modificaStudenti (int idstudent, String nume, String initiala_tata,
    		String prenume, Date data_nasterii, String cnp, String adresa, 
    		String facultate, String ciclu_studii, String an_studii);
    public void stergeStudent (Studenti student);
}

    
