package j1116;

public class Test2VO {
	private String name;
	private String schoolNumber;
	private int kor;
	private int eng;
	private int mat;
	private int soc;
	private int sci;
	private int tot;
	private double avg;
	private String grade;
	
	
	
	public Test2VO(String name, String schoolNumber, int kor, int eng, int mat, int soc, int sci, int tot, double avg,
			String grade) {
		this.name = name;
		this.schoolNumber = schoolNumber;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.soc = soc;
		this.sci = sci;
		this.tot = tot;
		this.avg = avg;
		this.grade = grade;
	}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getSchoolNumber() {return schoolNumber;}
	public void setSchoolNumber(String schoolNumber) {this.schoolNumber = schoolNumber;}
	public int getKor() {return kor;}
	public void setKor(int kor) {this.kor = kor;}
	public int getEng() {return eng;}
	public void setEng(int eng) {this.eng = eng;}
	public int getMat() {return mat;}
	public void setMat(int mat) {this.mat = mat;}
	public int getSoc() {return soc;}
	public void setSoc(int soc) {this.soc = soc;}
	public int getSci() {return sci;}
	public void setSci(int sci) {this.sci = sci;}
	public int getTot() {return tot;}
	public void setTot(int tot) {this.tot = tot;}
	public double getAvg() {return avg;}
	public void setAvg(double avg) {this.avg = avg;}
	public String getGrade() {return grade;}
	public void setGrade(String grade) {this.grade = grade;}
	
	@Override
	public String toString() {
		return "Test2VO [name=" + name + ", schoolNumber=" + schoolNumber + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat
				+ ", soc=" + soc + ", sci=" + sci + ", tot=" + tot + ", avg=" + avg + ", grade=" + grade + "]";
	}
}
