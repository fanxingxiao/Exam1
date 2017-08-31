package com.cmx.kaoshi.web;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import javax.servlet.http.HttpServletRequest;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cmx.kaoshi.entity.Str;;
@Controller
@RequestMapping("/")
public class HdfsTest {
//	@RequestMapping("shangchuan")
	public String testLs(HttpServletRequest request) throws Exception{
		String[] strings=new String[5];
		int i=0;
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		FileStatus[] liStatus = fileSystem.listStatus(new Path("/"));
		for(FileStatus fileStatus:liStatus){
			System.out.println("路径:"+fileStatus.getPath());
			Str str = new Str();
			str.setFileName(fileStatus.getPath().toString());
//			System.out.println(fileStatus.getPath().toString());
//			request.setAttribute("str",str);
			strings[i]=str.getFileName();
			i+=1;
		}
		request.setAttribute("list",strings);
		return "file";
	}
	
	//hdfs dfs -ls /
	public void printLs(FileSystem fileSystem,String path) throws Exception{
		FileStatus[] liStatus = fileSystem.listStatus(new Path(path));
		for(FileStatus fileStatus:liStatus){
			System.out.println(fileStatus);
		}
	}
	//hdfs dfs -ls -R /
	public void printLsR(FileSystem fileSystem,Path path) throws Exception{
		FileStatus[] liStatus = fileSystem.listStatus(path);
		for(FileStatus fileStatus:liStatus){
			if(fileStatus.isFile()){
				Path str=fileStatus.getPath();
				String aa=str.toString();
				int a=aa.lastIndexOf("/");
				char[] ch=aa.toCharArray();
				String lastString=String.copyValueOf(ch, a+1, ch.length-a-1);
				System.out.println(lastString);
			}
			if(fileStatus.isDirectory()){
				printLsR(fileSystem, fileStatus.getPath());
			}
		}
	}
	@RequestMapping("shangchuan")
	//MultipartFile 是上传文件的类型  /file name的值
	public String upload(@RequestParam(value="file")MultipartFile file,HttpServletRequest request) throws Exception{
		
		//获得文件的名字
		
		String filename = file.getOriginalFilename();

		//创建文件的上传路径
		
		String filepath=request.getSession().getServletContext().getRealPath("/upload");
		File uploadfile = new File(filepath+"/"+filename);
		try {
			file.transferTo(uploadfile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		System.out.println("上传完成");
		return test003(filename);
	}
	
	public String test003(String str) throws Exception{
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		
		//上传,从本地文件系统传到hdfs系统
		fileSystem.copyFromLocalFile(new Path("D:\\apache-tomcat-7.0.75\\wtpwebapps\\Exam1\\upload\\"+str), new Path("/"));
		
		//查看是否上传
//		printLsR(fileSystem, new Path("/"));
		return "fail";
	}
//	@RequestMapping("xiazai")
	public String test004() throws Exception{
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		//下载,从本地文件系统传到hdfs系统
		fileSystem.copyToLocalFile(new Path("hdfs://centos201:9000/apache-maven-3.3.9-bin.zip"), new Path("e:\\test\\hdfsTest\\apache-maven-3.3.9-bin2.zip"));
		return "";
	}
//	@RequestMapping("shanchu")
	public String test005() throws Exception{
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		//删除
		fileSystem.delete(new Path("hdfs://centos201:9000/apache-maven-3.3.9-bin.zip"),true);
		//查看是否删除
		printLsR(fileSystem, new Path("/"));
		return "";
	}
	
}
