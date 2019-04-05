package org.jspiders.internalmocksystem.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jspiders.internalmocksystem.dto.FifthSemDTO;
import org.jspiders.internalmocksystem.dto.FirstSemDTO;
import org.jspiders.internalmocksystem.dto.FourthSemDTO;
import org.jspiders.internalmocksystem.dto.SecondSemDTO;
import org.jspiders.internalmocksystem.dto.SixthSemDTO;
import org.jspiders.internalmocksystem.dto.StudentDTO;
import org.jspiders.internalmocksystem.dto.ThirdSemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InternalMarksDAOImpl implements InternalMarksDAO{

	@Autowired
	private SessionFactory factory;

	@Override
	public String saveStudent(StudentDTO student) {
		
		Session session = factory.openSession();
		
		String val = (String) session.save(student);
		
		session.beginTransaction().commit();
		
		session.close();
		
		return val;
	}

	@Override
	public StudentDTO getStudent(String usn, String pswd) {
		
		Session session = factory.openSession();
		
		String hql;
		if(pswd !=null)
			hql = "FROM StudentDTO where usn = :val1 and password = :val2";
		else
			hql = "FROM StudentDTO where usn = :val1";
		
		Query query = session.createQuery(hql);
		
		if(pswd!=null) {
			query.setParameter("val1", usn);
			query.setParameter("val2", pswd);
		}
		else
			query.setParameter("val1", usn);
		
		StudentDTO student = (StudentDTO)  query.uniqueResult();
		
		session.close();
		
		return student;
	}

	@Override
	public void saveMarks(ArrayList<String> arr,String sem) {
		
		String usn = arr.get(0);
		String subCode = arr.get(1);
		int marks = (int) (Double.parseDouble(arr.get(2)));
		String subName = arr.get(3);
		
		Session session = factory.openSession();
		
		StudentDTO student = session.get(StudentDTO.class, usn);
		
		if(student!=null) {
			
			if(sem.equals("1")) {
				
				FirstSemDTO first = new FirstSemDTO(subCode, subName, marks);
				
				student.addFirstSem(first);
				
				session.save(first);
			}
			else if(sem.equals("2")) {
				SecondSemDTO second= new SecondSemDTO(subCode, subName, marks);
				
				student.addSecondSem(second);
			}
			else if(sem.equals("3")) {
				ThirdSemDTO third = new ThirdSemDTO(subCode, subName, marks);
				student.addThirdSem(third);
			}
			else if(sem.equals("4")) {
				FourthSemDTO fourth = new FourthSemDTO(subCode, subName, marks);
				student.addFourthSem(fourth);
			}
			else if(sem.equals("5")) {
				FifthSemDTO fifth = new FifthSemDTO(subCode, subName, marks);
				student.addFifthSem(fifth);
			}
			else if(sem.equals("6")) {
				SixthSemDTO sixth = new SixthSemDTO(subCode, subName, marks);
				student.addSixthSem(sixth);
			}
			
			session.beginTransaction().commit();
			session.close();
		}
	}
}