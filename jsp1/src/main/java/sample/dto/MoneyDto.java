package sample.dto;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Builder;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class MoneyDto {
	private int custno;
	private String csutname;
	private String grade;
	private long sales;
}
