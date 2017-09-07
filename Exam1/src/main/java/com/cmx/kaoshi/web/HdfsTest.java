package com.cmx.kaoshi.web;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cmx.kaoshi.entity.Str;;
@Controller
@RequestMapping("/")
public class HdfsTest {
@RequestMapping("chakan")
	public @ResponseBody List test008(HttpServletRequest request) throws Exception{
		List list =new ArrayList<>();
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		FileStatus[] liStatus = fileSystem.listStatus(new Path("/user/word/in"));
		int n=0;
		for(FileStatus fileStatus:liStatus){
			if(fileStatus.isFile()){
				Path str=fileStatus.getPath();
				String aa=str.toString();
				int a=aa.lastIndexOf("/");
				char[] ch=aa.toCharArray();
				String lastString=String.copyValueOf(ch, a+1, ch.length-a-1);
				Str ss=new Str();
				ss.setName(lastString);
				list.add(ss.getName());
			}
		}
		request.setAttribute("list", list);
		return list;
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
		
		File dir = new File("/home/centos/tomcat/webapps/exam/upload");
		 if (dir.exists()) {
			 if (dir.isDirectory()) {
                System.out.println("文件夹已存在");
           } else {
                 System.out.println("同名文件存在，无法创建目录");
             }
         } else {
             System.out.println("目录不存在，创建它…");
             dir.mkdir();
             
           //创建文件的上传路径
     		String filepath=request.getSession().getServletContext().getRealPath("/upload");
     		File uploadfile = new File(filepath+"/"+filename);
     		try {
     			file.transferTo(uploadfile);
     		} catch (IllegalStateException | IOException e) {
     			e.printStackTrace();
     		}
     		System.out.println("上传完成");
         }
		return test003(filename);
	}
	
	public String test003(String str) throws Exception{
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		
		//上传,从本地文件系统传到hdfs系统
		fileSystem.copyFromLocalFile(new Path("/home/centos/tomcat/webapps/exam/upload/"+str), new Path("/user/word/in"));
		
		//查看是否上传
//		printLsR(fileSystem, new Path("/"));
		return "fail";
	}
	@RequestMapping("xiazai")
	public String test004(String name) throws Exception{
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		//下载,从本地文件系统传到hdfs系统
		fileSystem.copyToLocalFile(new Path("hdfs://centos201:9000/user/word/in/"+name), new Path("/home/centos/hdfs/"+name));
		fileSystem.close();
		return "fail1";
	}
	@RequestMapping("shanchu")
	public String test005(String name) throws Exception{
		System.out.println(name);
		FileSystem fileSystem = FileSystem.get(new URI("hdfs://centos201:9000"),new Configuration(),"centos");
		//删除
		fileSystem.delete(new Path("hdfs://centos201:9000/user/word/in/"+name),true);
		//查看是否删除
//		printLsR(fileSystem, new Path("/"));
		return "fail2";
	}
	
}
