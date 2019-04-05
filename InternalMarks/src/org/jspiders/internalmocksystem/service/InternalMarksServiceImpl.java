package org.jspiders.internalmocksystem.service;

import java.util.ArrayList;

import org.jspiders.internalmocksystem.dao.InternalMarksDAO;
import org.jspiders.internalmocksystem.dto.StudentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InternalMarksServiceImpl implements InternalMarksService{
	
	@Autowired
	private InternalMarksDAO dao;

	@Override
	public String saveStudent(StudentDTO student) {
		
		return dao.saveStudent(student);
	}

	@Override
	public StudentDTO getStudent(String usn, String pswd) {
		return dao.getStudent(usn,pswd);
	}

	@Override
	public void saveMarks(ArrayList<String> arr,String sem) {
		dao.saveMarks(arr,sem);
	}
}