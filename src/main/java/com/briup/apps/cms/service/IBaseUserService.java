package com.briup.apps.cms.service;

import com.briup.apps.cms.bean.extend.BaseUserExtend;

public interface IBaseUserService {
    BaseUserExtend findById(long id);
}
