package com.ipsos.poppy.admin;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class Poppyuser {
private int id;
private String name;
private String lastName;
private Date licexpirationdate;



}
