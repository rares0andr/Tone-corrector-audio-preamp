package pojo;



import java.util.HashSet;
import java.util.Set;

public class Cursuri  implements java.io.Serializable {


	private Integer idcurs;
	private String denumire;
	private String numeprofesor;
	private String sala;
	private String metodanotare;
	private String structura;
	private Set consultaties = new HashSet(0);

	public Cursuri() {
	}

	public Cursuri(String denumire, String numeprofesor, String sala,
			String metodanotare, String structura, Set consultaties) {
		this.denumire = denumire;
		this.numeprofesor = numeprofesor;
		this.sala = sala;
		this.metodanotare = metodanotare;
		this.structura = structura;
		this.consultaties = consultaties;
	}

	public Integer getIdcurs() {
		return this.idcurs;
	}

	public void setIdcurs(Integer idcurs) {
		this.idcurs = idcurs;
	}
	
	public String getDenumire() {
		return this.denumire;
	}

	public void setDenumire(String denumire) {
		this.denumire = denumire;
	}
	
	public String getNumeProfesor() {
		return this.numeprofesor;
	}

	public void setNumeProfesor(String numeprofesor) {
		this.numeprofesor = numeprofesor;
	}
	
	public String getSala() {
		return this.sala;
	}

	public void setSala(String sala) {
		this.sala = sala;
	}
	
	public String getMetodaNotare() {
		return this.metodanotare;
	}

	public void setMetodaNotare(String metodanotare) {
		this.metodanotare = metodanotare;
	}
	
	public String getStructura() {
		return this.structura;
	}

	public void setStructura(String structura) {
		this.structura = structura;
	}
	
	public Set getConsultaties() {
		return this.consultaties;
	}

	public void setConsultaties(Set consultaties) {
		this.consultaties = consultaties;
	}
}




