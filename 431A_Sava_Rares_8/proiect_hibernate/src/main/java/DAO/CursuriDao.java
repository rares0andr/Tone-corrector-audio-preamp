    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Cursuri;

/**
 *
 * @author vali
 */
public interface CursuriDao {
    public void adaugaCursuri (Cursuri curs);
    public List<Cursuri> afiseazaCursuri();
    public void modificaCursuri (int idcurs, String denumire, String nume_profesor,
    		String sala, String metoda_notare, String structura);
    public void stergeCurs (Cursuri curs);
}

    
