package ${package.Dto};

import ${package.Entity}.${entity};
import lombok.Data;
import lombok.Builder;
import lombok.experimental.Accessors;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.List;

/**
 * @author ${author}
 * @since ${date}
 */
<#if entityLombokModel>
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
</#if>
public class ${entity}DTO {
    private List<${entity}> ${entity?uncap_first}List;
    private ${entity} ${entity?uncap_first} = new ${entity}();
    private Integer pageNo = 1;
    private Integer pageSize = 10;
}
