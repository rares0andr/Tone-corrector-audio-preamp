package pojo;



import java.util.Date;

public class Proiect  implements java.io.Serializable {

	private Integer idproiect;
	private Cursuri cursuri;
	private Studenti studenti;
	private Date datapredare;
	private String denumire;
	private String sesiuneexaminare;
	private String descriere;

	public Proiect() {
	}

	public Proiect(Cursuri cursuri, Studenti studenti, Date datapredare, String denumire, String sesiuneexaminare, String descriere) {
		this.cursuri = cursuri;
		this.studenti = studenti;
		this.datapredare = datapredare;
		this.denumire = denumire;
		this.sesiuneexaminare = sesiuneexaminare;
		this.descriere = descriere;
		
	}

	public Integer getIdproiect() {
		return this.idproiect;
	}

	public void setIdproiect(Integer idproiect) {
		this.idproiect = idproiect;
	}
	public Cursuri getCursuri() {
		return this.cursuri;
	}

	public void setCursuri(Cursuri cursuri) {
		this.cursuri = cursuri;
	}
	public Studenti getStudenti() {
		return this.studenti;
	}

	public void setStudenti(Studenti studenti) {
		this.studenti = studenti;
	}
	public Date getDataPredare() {
		return this.datapredare;
	}

	public void setDataPredare(Date datapredare) {
		this.datapredare = datapredare;
	}
	public String getDenumire() {
		return this.denumire;
	}
	
	public void setDenumire(String denumire) {
		this.denumire = denumire;
	}

	public void setSesiuneExaminare(String sesiuneexaminare) {
		this.sesiuneexaminare = sesiuneexaminare;
	}
	public String getSesiuneExaminare() {
		return this.sesiuneexaminare;
	}
	
	public String getDescriere() {
		return this.descriere;
	}

	public void setDescriere(String descriere) {
		this.descriere = descriere;
	}
}




