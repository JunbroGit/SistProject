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
		
		System.out.println("ȸ���: "+empname);
		System.out.println("ȸ����ġ: "+emploc);
		System.out.println("�����: "+sinfo.getSawonname());
		System.out.println("�޿�: "+sinfo.getPay());
		System.out.println("����: "+sinfo.getPosition());
		System.out.println("�μ�: "+sinfo.getBuseo());
		for(String b:sinfo.getBuseo())
			System.out.println("\t"+b);
	}
}
