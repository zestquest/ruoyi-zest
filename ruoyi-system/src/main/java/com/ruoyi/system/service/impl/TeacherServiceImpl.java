package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeacherMapper;
import com.ruoyi.system.domain.Teacher;
import com.ruoyi.system.service.ITeacherService;

/**
 * 教师信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-03-27
 */
@Service
public class TeacherServiceImpl implements ITeacherService 
{
    @Autowired
    private TeacherMapper teacherMapper;

    /**
     * 查询教师信息
     * 
     * @param id 教师信息主键
     * @return 教师信息
     */
    @Override
    public Teacher selectTeacherById(Long id)
    {
        return teacherMapper.selectTeacherById(id);
    }

    /**
     * 查询教师信息列表
     * 
     * @param teacher 教师信息
     * @return 教师信息
     */
    @Override
    public List<Teacher> selectTeacherList(Teacher teacher)
    {
        return teacherMapper.selectTeacherList(teacher);
    }

    /**
     * 新增教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    @Override
    public int insertTeacher(Teacher teacher)
    {
        return teacherMapper.insertTeacher(teacher);
    }

    /**
     * 修改教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    @Override
    public int updateTeacher(Teacher teacher)
    {
        return teacherMapper.updateTeacher(teacher);
    }

    /**
     * 批量删除教师信息
     * 
     * @param ids 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByIds(Long[] ids)
    {
        return teacherMapper.deleteTeacherByIds(ids);
    }

    /**
     * 删除教师信息信息
     * 
     * @param id 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeacherById(Long id)
    {
        return teacherMapper.deleteTeacherById(id);
    }
}
