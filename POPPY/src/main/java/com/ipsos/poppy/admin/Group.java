package com.ipsos.poppy.admin;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Group {
	private int id;
	private String label; 
	private String nblicence;
	private String licexpirationdate; 
}
