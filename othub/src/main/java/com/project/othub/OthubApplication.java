package com.project.othub;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

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
@ComponentScan(basePackages = "pose")
@ComponentScan(basePackages = "object")

@ComponentScan(basePackages = "admin")
@ComponentScan(basePackages = "showroom")
@ComponentScan(basePackages = "product")
@ComponentScan(basePackages = "order")
@ComponentScan(basePackages = "shop")
@ComponentScan(basePackages = "productdetail")
@ComponentScan(basePackages = "cart")
@ComponentScan(basePackages = "chatbot")
@ComponentScan(basePackages = "cs")
@ComponentScan(basePackages = "reserv")
@ComponentScan(basePackages = "csanswere")


@MapperScan(basePackageClasses = MemberDAO.class)
@MapperScan(basePackageClasses = CommunityDAO.class)
@MapperScan(basePackageClasses = CommentDAO.class)
@MapperScan(basePackageClasses = ShowroomDAO.class)
@MapperScan(basePackages = "shop")
@MapperScan(basePackages = "productdetail")
@MapperScan(basePackages = "order")
@MapperScan(basePackages = "cart")
@MapperScan(basePackages = "reserv")
public class OthubApplication {

	public static void main(String[] args) {
		SpringApplication.run(OthubApplication.class, args);
	}

}
