package com.cos.soomgyo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cos.soomgyo.config.auth.PrincipalDetail;
import com.cos.soomgyo.dto.ResponseDto;
import com.cos.soomgyo.model.FindTeacher;
import com.cos.soomgyo.service.FindTeacherService;

@Controller
public class FindTeacherController {
	@Autowired
	private FindTeacherService findTeacherService;

	@GetMapping("auth/FindTeacher")
	public String FindTeacher(Model model, @PageableDefault(size=10, sort = "id", 
			direction = Sort.Direction.DESC)Pageable pageable) {
		model.addAttribute("teacher", findTeacherService.글목록(pageable));
		return "board/TeacherFind";
	}

	// 강사정보등록 및 이미지 저장
	@RequestMapping(value = "/findTeacher", method = { RequestMethod.POST })
	public String TeacherInfoSave(FindTeacher findTeacher,MultipartFile file,
			@AuthenticationPrincipal PrincipalDetail principal) throws Exception {

		String sourFileName = file.getOriginalFilename();
		 String sourFileNameExtension = FilenameUtils.getExtension(sourFileName).toLowerCase();
		 File destinationFile;
	     String destinationFileName;
	     String fileUrl = "C:\\images\\";
	     do { 
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourFileNameExtension; 
			destinationFile = new File(fileUrl + destinationFileName); 
		 } while (destinationFile.exists());
	     destinationFile.getParentFile().mkdirs();
	     file.transferTo(destinationFile);
		findTeacher.setFilename(destinationFileName);
		findTeacher.setFileOriName(sourFileName);
		findTeacher.setFileurl(fileUrl);
		findTeacherService.강사정보등록(principal.getUser(), findTeacher);
		
		return "redirect:/auth/FindTeacher";
		
	}

	// 이미지 경로설정
	@GetMapping(value = "/auth/Timages")
	public ResponseEntity<Resource> display(@Param("filename") String filename) {
		String path = "C:\\images\\";
		Resource resource = new FileSystemResource(path + filename);
		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		HttpHeaders header = new HttpHeaders();
		Path filePath = null;
		try {
			filePath = Paths.get(path + filename);
			header.add("Content-Type", Files.probeContentType(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}

	// 강사 디테일 페이지
	@GetMapping("/auth/FindTeacher/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("teacher", findTeacherService.글상세보기(id));
		return "board/TeacherFindDetail";
	}
	
	@PostMapping("/premiumOk/{pre}")
	public ResponseDto<Integer> 프리미엄수락(@PathVariable int pre) {
		findTeacherService.프리미엄수락(pre);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	@PostMapping("/premiumNo/{pre}")
	public ResponseDto<Integer> 프리미엄거절(@PathVariable int pre) {
		findTeacherService.프리미엄거절(pre);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
}
