use chrono;
use chrono::DateTime;
use chrono_tz::Tz;
use cron::Schedule;
use pyo3::prelude::*;
use std::str::FromStr;

#[pyclass(name = "Schedule")]
#[derive(Debug)]
pub struct PySchedule {
    schedule: Schedule,
}

#[pymethods]
impl PySchedule {
    #[new]
    pub fn new(cron_expr: &str) -> Self {
        let schedule = Schedule::from_str(cron_expr).unwrap();
        PySchedule { schedule }
    }

    pub fn upcoming(&self, timezone: &str) -> PyResult<DateTime<Tz>> {
        let tz: Tz = timezone.parse().unwrap();
        self.schedule.upcoming(tz).next().ok_or_else(|| {
            PyErr::new::<pyo3::exceptions::PyValueError, _>("No upcoming dates found")
        })
    }
}
