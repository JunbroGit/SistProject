package spring.db.carmember;

import java.util.List;

public interface CarMemberDaoInter {
	public int getTotalCount();
	public void insertMember(CarMemberDto dto);
	public List<CarMemberDto> getAllDatas();
	public CarMemberDto getOneData(String num);
	public void updateCarMember(CarMemberDto dto);
	public void deleteMember(String num);
}