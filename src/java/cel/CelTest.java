package cel;

import static org.junit.jupiter.api.Assertions.assertEquals;

import dev.cel.common.CelAbstractSyntaxTree;
import dev.cel.common.CelValidationException;
import dev.cel.common.types.SimpleType;
import dev.cel.compiler.CelCompiler;
import dev.cel.compiler.CelCompilerFactory;
import dev.cel.runtime.CelEvaluationException;
import dev.cel.runtime.CelRuntime;
import dev.cel.runtime.CelRuntimeFactory;
import java.util.Map;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class CelTest {

    private static CelCompiler celCompiler;
    private static CelRuntime celRuntime;

    @BeforeAll
    public static void setUp() {
        celCompiler =
                CelCompilerFactory.standardCelCompilerBuilder()
                        .addVar("my_var", SimpleType.STRING)
                        .build();
        celRuntime = CelRuntimeFactory.standardCelRuntimeBuilder().build();
    }

    @Test
    public void testCelCompilationAndEvaluation()
            throws CelValidationException, CelEvaluationException {
        CelAbstractSyntaxTree ast = celCompiler.compile("my_var + '!'").getAst();
        CelRuntime.Program program = celRuntime.createProgram(ast);
        String result = (String) program.eval(Map.of("my_var", "Hello World"));

        // Assert that the result is as expected
        assertEquals("Hello World!", result);
    }
}
