package com.briup.apps.cms.web.controller;

import com.briup.apps.cms.bean.Article;
import com.briup.apps.cms.bean.extend.ArticleExtend;
import com.briup.apps.cms.service.IArticleService;
import com.briup.apps.cms.utils.Message;
import com.briup.apps.cms.utils.MessageUtil;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: cms_jd1908
 * @description: 文章控制器类
 * @author: charles
 * @create: 2019-11-12 15:00
 **/
//@Api(tags = "文章相关接口")
@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @GetMapping("findAll")
    public Message findAll(){
        List<Article> list =  articleService.findAll();
        return MessageUtil.success(list);
    }

    @GetMapping("cascadeFindAll")
    public Message cascadeFindAll(){
        List<ArticleExtend> list =articleService.cascadeFindAll();
        return MessageUtil.success(list);
    }

    @GetMapping("findById")
    public Message findById(long id){
        ArticleExtend articleExtend = articleService.findById(id);
        return MessageUtil.success(articleExtend);
    }

    @ApiOperation(value = "保存或更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name="title",value="标题.",required=true,paramType="form"),
            @ApiImplicitParam(name="content",value="内容.",required=true,paramType="form"),
            @ApiImplicitParam(name="source",value="源内容",required=true,paramType="form"),
            @ApiImplicitParam(name="categoryId",value="栏目id",required=true,paramType="form",dataType = "Long"),
            @ApiImplicitParam(name="authorId",value="作者id",required=true,paramType="form",dataType = "Long")
    })
    @PostMapping("saveOrUpdate")
    public Message saveOrUpdate(
            Long id,
            String title,
            String content,
            String source,
            Long categoryId,
            Long authorId
    ){
        Article article = new Article();
        article.setId(id);
        article.setTitle(title);
        article.setContent(content);
        article.setSource(source);
        article.setCategoryId(categoryId);
        article.setAuthorId(authorId);
        articleService.saveOrUpdate(article);
        return MessageUtil.success("更新成功");
    }

    @ApiOperation("通过id删除")
    @ApiImplicitParams(
            @ApiImplicitParam(name = "id",value = "编号",required = true,paramType = "query")
    )
    @GetMapping("deleteById")
    public Message deleteById(Long id){
        articleService.deleteById(id);
        return MessageUtil.success("删除成功");
    }

}
