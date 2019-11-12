package com.briup.apps.cms.web.controller;

import com.briup.apps.cms.bean.Article;
import com.briup.apps.cms.bean.extend.ArticleExtend;
import com.briup.apps.cms.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @program: cms_jd1908
 * @description: 文章控制器类
 * @author: charles
 * @create: 2019-11-12 15:00
 **/
@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @GetMapping("findAll")
    public List<Article> findAll(){
        return articleService.findAll();
    }

    @GetMapping("cascadeFindAll")
    public List<ArticleExtend> cascadeFindAll(){
        return articleService.cascadeFindAll();
    }

    @GetMapping("findById")
    public ArticleExtend findById(long id){
        return articleService.findById(id);
    }

}
