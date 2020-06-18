package com.atgui.test;

import com.atgui.bean.Department;
import com.atgui.bean.Employee;
import com.atgui.dao.DepartmentMapper;
import com.atgui.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testMapper() {

//        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
////        DepartmentMapper departmentMapper = ac.getBean(DepartmentMapper.class);
////        Department department = departmentMapper.selectByPrimaryKey(1);
////        System.out.println(departmentMapper);
////        System.out.println(department);

//      Department department = departmentMapper.selectByPrimaryKey(1);
//        System.out.println(department);

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
         String uid = UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Employee(null,uid,1,uid+"@atguigu.com",1));
        }
        System.out.println("批量完成");

    }
}
