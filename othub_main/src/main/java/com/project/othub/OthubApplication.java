package com.project.othub;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import admin.AdminDAO;
import comment.CommentDAO;
import community.CommunityDAO;
import member.MemberDAO;
import showroom.ShowroomDAO;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackages = "controller") 
@ComponentScan(basePackages = "member")
@ComponentScan(basePackages = "community")
@ComponentScan(basePackages = "comment")
@ComponentScan(basePackages = "admin")
@ComponentScan(basePackages = "showroom")
@ComponentScan(basePackages = "product")

@MapperScan(basePackageClasses = MemberDAO.class)
@MapperScan(basePackageClasses = CommunityDAO.class)
@MapperScan(basePackageClasses = CommentDAO.class)
@MapperScan(basePackageClasses = AdminDAO.class)
@MapperScan(basePackageClasses = ShowroomDAO.class)
public class OthubApplication {

	public static void main(String[] args) {
		SpringApplication.run(OthubApplication.class, args);
	}
	

}
