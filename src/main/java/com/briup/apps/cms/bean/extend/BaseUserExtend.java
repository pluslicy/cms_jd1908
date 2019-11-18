package com.briup.apps.cms.bean.extend;

import com.briup.apps.cms.bean.BaseRole;
import com.briup.apps.cms.bean.BaseUser;

import java.util.List;

/**
 * @program: cms_jd1908
 * @description: 用户拓展
 * @author: charles
 * @create: 2019-11-18 15:31
 **/

public class BaseUserExtend extends BaseUser {
    private List<BaseRole> roles;

    public List<BaseRole> getRoles() {
        return roles;
    }

    public void setRoles(List<BaseRole> roles) {
        this.roles = roles;
    }
}
