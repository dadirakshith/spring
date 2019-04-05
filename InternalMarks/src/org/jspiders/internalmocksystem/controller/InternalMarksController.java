package org.jspiders.internalmocksystem.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.jspiders.internalmocksystem.dto.StudentDTO;
import org.jspiders.internalmocksystem.service.InternalMarksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InternalMarksController {

	@Autowired
	private InternalMarksService service;

	private String fileLocation;
	
	@RequestMapping("/")
	public String getHomePage() {
		return "Login";
	}
	
	@RequestMapping("/register")
	public String getRegisterPage(Model myModel) {
		
		StudentDTO student = new StudentDTO();
		
		myModel.addAttribute("student", student);
		
		return "Register";
	}
		
	@RequestMapping("/registerstudent")
	public String SaveStudent(@ModelAttribute("student")StudentDTO student) {
		
		String value = service.saveStudent(student);
		
		if(value != null)
			return "redirect:/";
		
		return "redirect:/register";
	}
	
	@RequestMapping("/signin")
	public String getStudent(HttpServletRequest request) {
		
		String usn = request.getParameter("usn");
		String pswd = request.getParameter("pswd");
		
		StudentDTO student = service.getStudent(usn,pswd);
		
		if(student!=null)
			return "upload";
		
		return "redirect:/";
	}
	
	@RequestMapping("/upload-m")
	public String getUploadPage() {
		return "upload-m";
	}
	
	@RequestMapping("/uploadExcelFile")
	public String uploadFile(Model model, MultipartFile file,@RequestParam("sem")String sem) throws IOException 
	{
		InputStream in = file.getInputStream();
		File currDir = new File(".");
		String path = currDir.getAbsolutePath();
		fileLocation = path.substring(0, path.length() - 1) + file.getOriginalFilename();
		FileOutputStream f = new FileOutputStream(fileLocation);
		int ch = 0;
		while ((ch = in.read()) != -1)
		{
			f.write(ch);
		}
		f.flush();
		f.close();
		model.addAttribute("message", "File: " + file.getOriginalFilename() + " has been uploaded successfully!");
		return "forward:/readExcelFile?sem="+sem;
	}
	
	@RequestMapping("/readExcelFile")
	public String ReadFile(@RequestParam("sem")String sem) throws IOException, InvalidFormatException
	{
		ArrayList<String> arr = new ArrayList<String>();
		
		FileInputStream file= new FileInputStream(fileLocation);
		
		//2.create work book
		Workbook wb = WorkbookFactory.create(file);
		
		//3.get sheet
		Sheet sh = wb.getSheet("Sheet1");
		
		int rc=sh.getLastRowNum();
		for(int i=1;i<=rc;i++)
		{
			int cc=sh.getRow(i).getLastCellNum();
			for(int j=0;j<cc;j++)
			{
				System.out.print(sh.getRow(i).getCell(j).toString()+" ");
				arr.add(j, sh.getRow(i).getCell(j).toString());
			}
			service.saveMarks(arr,sem);
			System.out.println("----inside readExcel-----");
		}
		
		return "redirect:/upload-m";
	}
	
	@RequestMapping("/viewstudents")
	public String getStudentInfo() {
		return "studentinfo";
	}
	
	@RequestMapping("/checkmarks")
	public String getSearchOption() {
		return "selective-search";
	}
	
	@RequestMapping("/searchmarks")
	public String SearchStudent(HttpServletRequest request,Model myModel) {
		
		String usn = request.getParameter("usn");
		String sem = request.getParameter("sem");
		
		StudentDTO student = service.getStudent(usn, null);
		
		if(sem.equals("1"))
			myModel.addAttribute("results", student.getFirst());
		else if(sem.equals("2"))
			myModel.addAttribute("results", student.getSecond());
		else if(sem.equals("3"))
			myModel.addAttribute("results", student.getThird());
		else if(sem.equals("4"))
			myModel.addAttribute("results", student.getFourth());
		else if(sem.equals("5"))
			myModel.addAttribute("results", student.getFifth());
		else if(sem.equals("6"))
			myModel.addAttribute("results", student.getSixth());
		
		myModel.addAttribute("usn", student.getUsn());
		
		return "results";
	}
}