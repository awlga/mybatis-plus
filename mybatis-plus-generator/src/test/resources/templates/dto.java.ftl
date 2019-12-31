package ${package.Dto};

import ${package.Entity}.${entity};
import lombok.Data;
import lombok.Builder;
import lombok.experimental.Accessors;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

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
    private ${entity} ${entity?uncap_first};
    private Integer pageNo;
    private Integer pageSize;
}
