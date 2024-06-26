package day0115;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

//key와 value로 이루어지는 데이터의 집합
//key로 구분
//순서유지되지 않는다
//키는 중복허용하지않고 값은 중복을 허용한다
public class MapEx_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "유재석");
		map.put("age", "44");
		map.put("addr", "서울시");
		
		//같은 키값으로 넣으면 먼저데이타는 없어짐
		map.put("name", "수지");
		
		System.out.println("개수: "+map.size());
		System.out.println("키값을 알면 value값을 정확히 얻을 수 있다");
		
		System.out.println("이름: "+map.get("name"));
		System.out.println("나이: "+map.get("age"));
		System.out.println("지역: "+map.get("addr"));
		
		System.out.println("키값을 먼저 한꺼번에 얻은후 값을 얻는 방법");
		
		Set<String> keyset=map.keySet();
		System.out.println("**방법1**");
		Iterator<String> keyiter=keyset.iterator();
		while(keyiter.hasNext())
		{
			String key=keyiter.next();
			System.out.println(key+"==>"+map.get(key));
		}
		
		System.out.println("**방법2**");
		for(String key:keyset)
			System.out.println(key+"==>"+map.get(key));
	}

}
