package com.briup.apps.cms.service.impl;

import com.briup.apps.cms.bean.extend.BaseUserExtend;
import com.briup.apps.cms.dao.extend.BaseUserExtendMapper;
import com.briup.apps.cms.service.IBaseUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @program: cms_jd1908
 * @description: 用户类
 * @author: charles
 * @create: 2019-11-18 15:40
 **/
@Service
public class BaseUserServiceImpl implements IBaseUserService {
    @Resource
    private BaseUserExtendMapper baseUserExtendMapper;

    @Override
    public BaseUserExtend findById(long id) {
        return baseUserExtendMapper.selectById(id);
    }
}
