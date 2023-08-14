package sample.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderDto {
	private String email;
	private String pcode;
	private int quantity;
	private Date orderdate;
/*
 * 테이블 생성
create table orders (
	email varchar2(30),
	pcode varchar2(20) not null,
	quantiry number(3) not null,
	orderdate date default sysdate
);
*/
}
