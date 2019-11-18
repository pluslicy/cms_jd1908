package com.briup.apps.cms.dao.extend;

import com.briup.apps.cms.bean.BaseRole;

import java.util.List;

public interface BaseRoleExtendMapper {
    List<BaseRole> selectByUserId(long id);
}
