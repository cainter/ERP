第一部分
	1、新建一个dynamic web project ERP 工作目录为F:/ERPPRJ
	
	2、引入struts2的依赖包，将依赖包拷贝到WebContent/WEB-INF/lib目录下
	   此处新建两个user libraries (1) struts2.5.10；（2）hibernate5.2.10并导入相关依赖jar文件
	  struts2.5.10:
	   (1) asm-5.1.jar;
	   (2)asm-commons-5.1.jar
	   (3)asm-tree-5.1.jar
	   (4)commons-fileupload-1.3.2.jar
	   (5)commons-io-2.4.jar
	   (6)commons-lang-2.4.jar
	   (7)commons-lang3-3.4.jar
	   (8)freemarker-2.3.23.jar
	   (9)javassist-3.20.0-GA.jar
	   (10)log4j-api-2.7.jar
	   (11)ognl-3.1.12.jar
	   (12)struts2-core-2.5.10.1.jar
	  hibernate5.2.10:
	    导入hibernate5.2.10.all/lib/required/下的所以jar文件.	
	        
	3、 添加mysql jdbc驱动包到hibernate5.2.10 user libraries,
	此处用的64位驱动包mysql-connector-java-5.1.39-bin.jar
	
	4、建立hibernate.cfg.xml文件，通过查找\hibernate-release-5.2.10.Final\project\etc下的
	hibernate.properites文件，添加属性到hibernate.cfg.xml文件中
	
	<!--
<!DOCTYPE hibernate-configuration PUBLIC
	"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
	"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">

<hibernate-configuration>
	<session-factory>
		<property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
		<property name="connection.url">jdbc:mysql://localhost:3306/minierp</property>
		<property name="hibernate.connection.username">cuixiao</property>
		<property name="hibernate.connection.password">cuixiao740217</property>
		<property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
		<property name="current_session_context_class">thread</property>
        <!-- Echo all executed SQL  -->
        <property name="show_sql">true</property>
        <!-- Drop and re-create the database schema on startup -->
	</session-factory>
</hibernate-configuration>

	5、Window/preferences/xml/catalog，引入http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd文件，
   设置hibernate.cfg.xml文件的自动提示，完成基本的配置。
   
    6、建立实体类UserVO,建立实体类PrivilegsVO,建立实体类RolesVO
   
    7、建立相关实体类的映射文件UserVO.hbm.xml,PrivilegsVO.hbm.xml,RolesVO.hbm.xml文件,
    并加入到hibernate.cfg.xml文件中。 
    
    8、建立实体类UserVTO。
    
    9、注意，VTO为数据传输对象，用来传递会话或request参数对象，并不用来持久化，
       持久化对象为值对象VO,当进行数据持久化时，则使用VO对象Save/saveorUpdate().
    
    第二部分
    1、配置struts2
    
    2、拷贝想关依赖包，建立用户自定义库。
    
    3、到struts2.5.10.all下面拷贝apps文件夹下的示例代码中的struts.xml文件进行修改.
    
    4、建立login.jsp,login_sucess.jsp,login_error.jsp文件，
       注意，在项目/preferences/下修改jsp编码格式为utf-8.
       
    5、创建struts2的action。 
    
    6、创建LoginVTO.java
    
    7、修改struts.xml文件，在window/preferences/xml/catalog/add添加
       "http://struts.apache.org/dtds/struts-2.5.dtd"  
       
    8、
    
	
	
	
	
	