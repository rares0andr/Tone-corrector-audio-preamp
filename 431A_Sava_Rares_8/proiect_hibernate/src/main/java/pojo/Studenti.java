package pojo;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Studenti  implements java.io.Serializable {

	private Integer idstudent;
	private String nume;
	private String initialatata;
	private String prenume;
	private Date datanasterii;
	private String cnp;
	private String adresa;
	private String facultate;
	private String ciclustudii;
	private String anstudii;
	private Set consultaties = new HashSet(0);

	public Studenti() {
	}

	public Studenti(String nume, String initialatata, String prenume, 
			Date datanasterii, String cnp, String adresa, 
			String facultate, String ciclustudii, String anstudii, Set consultaties) {
		this.nume = nume;
		this.initialatata = initialatata;
		this.prenume = prenume;
		this.datanasterii = datanasterii;
		this.cnp = cnp;
		this.adresa = adresa;
		this.facultate = facultate;
		this.ciclustudii = ciclustudii;
		this.anstudii = anstudii;
		this.consultaties = consultaties;
	}

	public Integer getIdstudent() {
		return this.idstudent;
	}

	public void setIdstudent(Integer idstudent) {
		this.idstudent = idstudent;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	
	public String getInitialaTata() {
		return this.initialatata;
	}

	public void setInitialaTata(String initialatata) {
		this.initialatata = initialatata;
	}
	
	public String getPrenume() {
		return this.prenume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}
	
	public Date getDataNasterii() {
		return this.datanasterii;
	}

	public void setDataNasterii(Date datanasterii) {
		this.datanasterii = datanasterii;
	}
	
	public String getCnp() {
		return this.cnp;
	}

	public void setCnp(String cnp) {
		this.cnp = cnp;
	}
	
	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}
	
	public String getFacultate() {
		return this.facultate;
	}

	public void setFacultate(String facultate) {
		this.facultate = facultate;
	}
	
	public String getCicluStudii() {
		return this.ciclustudii;
	}

	public void setCicluStudii(String ciclustudii) {
		this.ciclustudii = ciclustudii;
	}
	
	public String getAnStudii() {
		return this.anstudii;
	}

	public void setAnStudii(String anstudii) {
		this.anstudii = anstudii;
	}
	
	public Set getConsultaties() {
		return this.consultaties;
	}

	public void setConsultaties(Set consultaties) {
		this.consultaties = consultaties;
	}
}




