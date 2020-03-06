/*
 * Copyright (c) 2011-2020, baomidou (jobob@qq.com).
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * https://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.baomidou.mybatisplus.test.generator;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.mysql.cj.jdbc.Driver;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 代码生成器演示
 *
 * @author hubin
 * @since 2016-12-01
 */
public class OracleSQLGenerator extends GeneratorTest {

    /**
     * MySQL 生成演示
     */
    public static void main(String[] args) {
        String packagePath = "com.sunny.auth";
        String[] tableList ={
            "AUTH_MODULE_URL",
            "AUTH_RESOURCE",
            "AUTH_ROLE",
            "AUTH_ROLE_RESOURCE",
            "AUTH_USER",
            "AUTH_USER_ROLE"
        }; //{"od_xuqiu","ass_dict"};
        String moduleName = "business";
        String author = "lgwang";
        String filePath = "D:\\\\codeGen";
        String db_url = "jdbc:oracle:thin:@192.168.45.92:1521:orcl";
        String db_user = "xd";
        String db_password = "xd";
        // 自定义需要填充的字段
//        List<TableFill> tableFillList = new ArrayList<>();
//        tableFillList.add(new TableFill("od_xuqiu", FieldFill.INSERT_UPDATE));


        // 代码生成器
        AutoGenerator mpg = new AutoGenerator().setGlobalConfig(
            // 全局配置
            new GlobalConfig()
                .setIdType(IdType.AUTO)
                .setOutputDir(filePath)//输出目录
                .setFileOverride(true)// 是否覆盖文件
                .setActiveRecord(true)// 开启 activeRecord 模式
                .setEnableCache(false)// XML 二级缓存
                .setBaseResultMap(true)// XML ResultMap
                .setBaseColumnList(true)// XML columList
                //.setKotlin(true) 是否生成 kotlin 代码
                .setAuthor(author)
                .setSwagger2(true)
            // 自定义文件命名，注意 %s 会自动填充表实体属性！
            // .setEntityName("%sEntity");
            // .setMapperName("%sDao")
            // .setXmlName("%sDao")
            // .setServiceName("MP%sService")
            // .setServiceImplName("%sServiceDiy")
            // .setControllerName("%sAction")
        ).setDataSource(
            // 数据源配置
            new DataSourceConfig()
                .setDbType(DbType.ORACLE) // 数据库类型
                /*.setTypeConvert(new MySqlTypeConvert() {
                    // 自定义数据库表字段类型转换【可选】
                    @Override
                    public IColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
                        System.out.println("转换类型：" + fieldType);
                        // if ( fieldType.toLowerCase().contains( "tinyint" ) ) {
                        //    return DbColumnType.BOOLEAN;
                        // }
                        return super.processTypeConvert(globalConfig, fieldType);
                    }
                })*/
                /*.setDbQuery(new MySqlQuery() {

                    *//**
                     * 重写父类预留查询自定义字段<br>
                     * 这里查询的 SQL 对应父类 tableFieldsSql 的查询字段，默认不能满足你的需求请重写它<br>
                     * 模板中调用：  table.fields 获取所有字段信息，
                     * 然后循环字段获取 field.customMap 从 MAP 中获取注入字段如下  NULL 或者 PRIVILEGES
                     *//*
                    @Override
                    public String[] fieldCustom() {
                        return new String[]{"NULL", "PRIVILEGES"};
                    }
                })*/
                .setDriverName(Driver.class.getName())
                .setUsername(db_user)
                .setPassword(db_password)
                .setUrl(db_url)
        ).setStrategy(
            // 策略配置
            new StrategyConfig()
//                 .setCapitalMode(true)// 全局大写命名
//                 .setDbColumnUnderline(true)//全局下划线命名
//                .setTablePrefix("od_")// 此处可以修改为您的表前缀
                .setNaming(NamingStrategy.underline_to_camel)// 表名生成策略
                .setColumnNaming(NamingStrategy.no_change)
                .setInclude(Arrays.stream(tableList).map(j->j.toUpperCase()).toArray(String[]::new)) // 需要生成的表
                .setRestControllerStyle(true)
//                 .setExclude(new String[]{"od_xuqiu"}) // 排除生成的表
                // 自定义实体父类
                // .setSuperEntityClass("com.baomidou.demo.TestEntity")
                // 自定义实体，公共字段
//                .setSuperEntityColumns(new String[]{"test_id"})
//                .setTableFillList(tableFillList)
//                .setEntityBooleanColumnRemoveIsPrefix(true)
            // 自定义 mapper 父类
            // .setSuperMapperClass("com.baomidou.demo.TestMapper")
            // 自定义 service 父类
            // .setSuperServiceClass("com.baomidou.demo.TestService")
            // 自定义 service 实现类父类
            // .setSuperServiceImplClass("com.baomidou.demo.TestServiceImpl")
            // 自定义 controller 父类
            // .setSuperControllerClass("com.baomidou.demo.TestController")
            // 【实体】是否生成字段常量（默认 false）
            // public static final String ID = "test_id";
            // .setEntityColumnConstant(true)
            // 【实体】是否为构建者模型（默认 false）
            // public User setName(String name) {this.name = name; return this;}
            // .setEntityBuilderModel(true)
            // 【实体】是否为lombok模型（默认 false）<a href="https://projectlombok.org/">document</a>
//             .setEntityLombokModel(true)
            // Boolean类型字段是否移除is前缀处理
            // .setEntityBooleanColumnRemoveIsPrefix(true)
            // .setRestControllerStyle(true)
            // .setControllerMappingHyphenStyle(true)
        ).setPackageInfo(
            // 包配置
            new PackageConfig()
                .setModuleName(moduleName)
                .setParent(packagePath)// 自定义包路径
                .setController("controller")// 这里是控制器包名，默认 web
        ).setCfg(
            // 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
            new InjectionConfig() {
                @Override
                public void initMap() {
                    Map<String, Object> map = new HashMap<>();
                    map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                    this.setMap(map);
                }
            }.setFileOutConfigList(Collections.singletonList(new FileOutConfig(
                "/templates/dto.java.ftl") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    return filePath+ File.separator
                        +packagePath.replaceAll("\\.", StringPool.BACK_SLASH + File.separator)
                        + File.separator+moduleName+File.separator+"dto"+File.separator+ tableInfo.getEntityName()+"DTO" + StringPool.DOT_JAVA;
                }
            }))
        )/*.setTemplate(
            // 关闭默认 xml 生成，调整生成 至 根目录
            new TemplateConfig().setXml(null)
            // 自定义模板配置，模板可以参考源码 /mybatis-plus/src/main/resources/template 使用 copy
            // 至您项目 src/main/resources/template 目录下，模板名称也可自定义如下配置：
            // .setController("...");
            // .setEntity("...");
            // .setMapper("...");
            // .setXml("...");
            // .setService("...");
            // .setServiceImpl("...");
        )*/;
        // 执行生成
//        if (1 == result) {
            mpg.setTemplateEngine(new FreemarkerTemplateEngine());
//        }
        mpg.execute();

        // 打印注入设置，这里演示模板里面怎么获取注入内容【可无】
//        System.err.println(mpg.getCfg().getMap().get("abc"));
    }

}
