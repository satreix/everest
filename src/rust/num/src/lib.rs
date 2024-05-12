extern crate pyo3;
use pyo3::basic::CompareOp;
use pyo3::exceptions::PyIndexError;
use pyo3::prelude::*;

extern crate rayon;
use rayon::prelude::*;

#[pyclass]
struct Array(Vec<f64>);

#[pymethods]
impl Array {
    #[new]
    fn new(arr: Vec<f64>) -> Self {
        Array(arr)
    }

    fn __str__(&self) -> String {
        format!("{:?}", self.0)
    }

    fn __len__(&self) -> usize {
        self.0.len()
    }

    fn __getitem__(&self, index: usize) -> PyResult<f64> {
        if index >= self.0.len() {
            return Err(PyIndexError::new_err("Index out of bounds"));
        }
        Ok(self.0[index])
    }

    fn __setitem__(&mut self, index: usize, val: f64) -> PyResult<()> {
        if index >= self.0.len() {
            return Err(PyIndexError::new_err("Index out of bounds"));
        }
        self.0[index] = val;

        Ok(())
    }

    fn __add__(lhs: PyRef<Array>, rhs: PyRef<Array>) -> PyResult<Array> {
        if lhs.0.len() != rhs.0.len() {
            return Err(PyIndexError::new_err(format!(
                "Arrays have differing lengths: {} vs {}",
                lhs.0.len(),
                rhs.0.len()
            )));
        }
        let arr = lhs
            .0
            .par_iter()
            .zip(rhs.0.par_iter())
            .map(|(l, r)| l + r)
            .collect();
        Ok(Array(arr))
    }

    fn __sub__(lhs: PyRef<Array>, rhs: PyRef<Array>) -> PyResult<Array> {
        if lhs.0.len() != rhs.0.len() {
            return Err(PyIndexError::new_err(format!(
                "Arrays have differing lengths: {} vs {}",
                lhs.0.len(),
                rhs.0.len()
            )));
        }
        let arr = lhs
            .0
            .par_iter()
            .zip(rhs.0.par_iter())
            .map(|(l, r)| l - r)
            .collect();
        Ok(Array(arr))
    }

    fn __richcmp__(&self, other: PyRef<Array>, op: CompareOp) -> bool {
        if self.0.len() != other.0.len() {
            return false;
        }
        let mut element_pairs = self.0.iter().zip(other.0.iter());
        match op {
            CompareOp::Eq => element_pairs.all(|(s, o)| s == o),
            _ => panic!("Only equality between Arrays is supported."),
        }
    }

    fn mean(&self) -> f64 {
        if self.0.is_empty() {
            return 0.0;
        }
        self.0.par_iter().sum::<f64>() / self.0.len() as f64
    }

    fn median(&self) -> f64 {
        let mut sorted = self.0.clone();
        sorted.sort_by(|a, b| a.partial_cmp(b).unwrap());
        match sorted.len() {
            // Empty array
            0 => 0.0,
            // Even number of elements
            len if len % 2 == 0 => (sorted[len / 2] + sorted[len / 2 - 1]) / 2.0,
            // Odd number of elements
            len => sorted[len / 2],
        }
    }
}

#[pymodule]
fn num(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_class::<Array>()?;
    Ok(())
}
