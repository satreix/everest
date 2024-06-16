use cel_interpreter::{Context, Program};

fn main() {
    let program = Program::compile("add(2, 3)").unwrap();

    let mut context = Context::default();
    context.add_function("add", |a: i64, b: i64| a + b);

    let value = program.execute(&context).unwrap();
    assert_eq!(value, 5.into());

    print!("value={:?}", value);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        let program = Program::compile("add(2, 3)").unwrap();
        let mut context = Context::default();
        context.add_function("add", |a: i64, b: i64| a + b);
        let value = program.execute(&context).unwrap();
        assert_eq!(value, 5.into());
    }
}
