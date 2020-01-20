package ${package.Controller};
import ${package.Dto}.${entity}DTO;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};

import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * ${table.comment!} 前端控制器
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@Slf4j
@Api(tags = "${table.comment!}")
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    @Autowired
    private I${entity}Service ${entity?uncap_first}Service;

    /**
    * 分页列表查询
    * @param ${entity?uncap_first}DTO
    * @return
    */
    @ApiOperation(value = "${table.comment!}-分页列表查询", notes = "${table.comment!}-分页列表查询")
    @PostMapping(value = "/list")
    public Result<IPage<${entity}>> queryPageList(@RequestBody ${entity}DTO ${entity?uncap_first}DTO) {
        Page page = new Page(${entity?uncap_first}DTO.getPageNo(), ${entity?uncap_first}DTO.getPageSize());
        IPage page1 = ${entity?uncap_first}Service.page(page, ${entity?uncap_first}DTO.get${entity}());
        Result<IPage<${entity}>> result = new Result<IPage<${entity}>>();
        result.success("");
        result.setResult(page1);
        return result;
    }

    /**
    * 添加
    *
    * @param ${entity?uncap_first}
    * @return
    */
    @AutoLog(value = "${table.comment!}-添加")
    @ApiOperation(value = "${table.comment!}-添加", notes = "${table.comment!}-添加")
    @PostMapping(value = "/add")
    public Result<${entity}> add(@RequestBody ${entity} ${entity?uncap_first}) {
        Result<${entity}> result = new Result<${entity}>();
        boolean save = ${entity?uncap_first}Service.save(${entity?uncap_first});
        if (save) {
            result.success("添加成功！");
        } else {
            result.error500("操作失败");
        }
        return result;
    }

    /**
    * 编辑
    *
    * @param ${entity?uncap_first}
    * @return
    */
    @AutoLog(value = "${table.comment!}-编辑")
    @ApiOperation(value = "${table.comment!}-编辑", notes = "${table.comment!}-编辑")
    @PutMapping(value = "/edit")
    public Result<${entity}> edit(@RequestBody ${entity} ${entity?uncap_first}) {
        Result<${entity}> result = new Result<${entity}>();
        boolean update = ${entity?uncap_first}Service.updateById(${entity?uncap_first});
        if (update) {
            result.success("添加成功！");
        } else {
            result.error500("操作失败");
        }
        return result;
    }

    /**
    * 通过id删除
    *
    * @param id
    * @return
    */
    @AutoLog(value = "${table.comment!}-通过id删除")
    @ApiOperation(value = "${table.comment!}-通过id删除", notes = "${table.comment!}-通过id删除")
    @DeleteMapping(value = "/delete")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
    Result<${entity}> result = new Result<${entity}>();
        boolean remove = ${entity?uncap_first}Service.removeById(id);
        if (remove) {
            result.success("删除成功！");
        } else {
            result.error500("删除失败");
        }
        return result;
    }

    /**
    * 批量删除
    *
    * @param ids
    * @return
    */
    @AutoLog(value = "${table.comment!}-批量删除")
    @ApiOperation(value = "${table.comment!}-批量删除", notes = "${table.comment!}-批量删除")
    @DeleteMapping(value = "/deleteBatch")
    public Result<${entity}> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        Result<${entity}> result = new Result<${entity}>();
        boolean remove = ${entity?uncap_first}Service.removeByIds(ids);
        if (remove) {
            result.success("删除成功！");
        } else {
            result.error500("删除失败");
        }
        return result;
    }
    /**
    * 通过id查询
    *
    * @param id
    * @return
    */
    @ApiOperation(value = "${table.comment!}-通过id查询", notes = "${table.comment!}-通过id查询")
    @GetMapping(value = "/queryById")
    public Result<${entity}> queryById(@RequestParam(name = "id", required = true) String id) {
        Result<${entity}> result = new Result<${entity}>();
        ${entity} ${entity?uncap_first} = ${entity?uncap_first}Service.getById(id);
        result.success("")
              .setResult(${entity?uncap_first});
        return result;
    }

}
</#if>
