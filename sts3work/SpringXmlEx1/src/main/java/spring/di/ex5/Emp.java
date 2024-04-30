package spring.di.ex5;

public class Emp {

	SawonInfo sinfo;
	String empname;
	String emploc;
	
	public Emp(String empname) {
		this.empname=empname;
	}

	public SawonInfo getSinfo() {
		return sinfo;
	}

	public void setSinfo(SawonInfo sinfo) {
		this.sinfo = sinfo;
	}

	public String getEmploc() {
		return emploc;
	}

	public void setEmploc(String emploc) {
		this.emploc = emploc;
	}
	
	public void writeEmp() {
		
		System.out.println("회사명: "+empname);
		System.out.println("회사위치: "+emploc);
		System.out.println("사원명: "+sinfo.getSawonname());
		System.out.println("급여: "+sinfo.getPay());
		System.out.println("직급: "+sinfo.getPosition());
		System.out.println("부서: "+sinfo.getBuseo());
		for(String b:sinfo.getBuseo())
			System.out.println("\t"+b);
	}
}
