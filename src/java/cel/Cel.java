package cel;

import dev.cel.common.CelAbstractSyntaxTree;
import dev.cel.common.CelValidationException;
import dev.cel.common.types.SimpleType;
import dev.cel.compiler.CelCompiler;
import dev.cel.compiler.CelCompilerFactory;
import dev.cel.runtime.CelEvaluationException;
import dev.cel.runtime.CelRuntime;
import dev.cel.runtime.CelRuntimeFactory;

import java.util.Map;

class Cel {

    private static final CelCompiler CEL_COMPILER =
            CelCompilerFactory.standardCelCompilerBuilder()
                    .addVar("my_var", SimpleType.STRING)
                    .build();
    private static final CelRuntime CEL_RUNTIME =
            CelRuntimeFactory.standardCelRuntimeBuilder().build();

    public static void main(String[] args) throws CelValidationException, CelEvaluationException {
        CelAbstractSyntaxTree ast = CEL_COMPILER.compile("my_var + '!'").getAst();
        CelRuntime.Program program = CEL_RUNTIME.createProgram(ast);
        String result = (String) program.eval(Map.of("my_var", "Hello World"));
        System.out.println(result);
    }
}
