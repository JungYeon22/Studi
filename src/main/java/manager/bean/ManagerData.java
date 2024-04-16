package manager.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@Getter
@Setter
public class ManagerData {
    private List<Map<String, Object>> signupCounts;
    private List<Map<String, Object>> boardCounts;
    private List<Map<String, Object>> typeCounts;
    private List<Map<String, Object>> fielddCounts;
}
