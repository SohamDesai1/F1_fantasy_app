use axum::{routing::get, Router};

use crate::{handlers::race::get_race_data, utils::state::AppState};

pub fn race_routes() -> Router<AppState> {
    Router::new().route("/get_races", get(get_race_data))
}
