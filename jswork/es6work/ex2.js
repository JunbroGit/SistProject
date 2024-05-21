//const: 상수

//객체선언 가능
const pp={
    "name":"홍길동",
    "addr":"서울시 강남구"
}

console.log("이름: "+pp.name);
console.log("주소: "+pp.addr);

//객체타입일 경우 멤버는 변경가능
pp.name="유재석";
pp.addr="서울시 구로구";

console.log("이름: "+pp.name);
console.log("주소: "+pp.addr);

//pp={} 객체값 자체변경은 에러