package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapperInter;
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMember(dto);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapperInter.getAllMembers();
	}

	@Override
	public int getSerchId(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getSerchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getName(id);
	}

	@Override
	public int loginIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapperInter.loginIdPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getDataById(id);
	}

	@Override
	public void deleteMember(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteMember(num);
	}

	@Override
	public MemberDto getDataByNum(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getDataByNum(num);
	}

	@Override
	public void updatePhoto(String num, String photo) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("num", num);
		map.put("photo", photo);
		mapperInter.updatePhoto(map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateMember(dto);
	}

}