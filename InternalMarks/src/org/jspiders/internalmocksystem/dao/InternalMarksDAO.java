package org.jspiders.internalmocksystem.dao;

import java.util.ArrayList;

import org.jspiders.internalmocksystem.dto.StudentDTO;

public interface InternalMarksDAO {

	String saveStudent(StudentDTO student);

	StudentDTO getStudent(String usn, String pswd);

	void saveMarks(ArrayList<String> arr, String sem);
}
