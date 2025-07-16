use axum::{response::IntoResponse, Json};
use http::StatusCode;
use serde_json::json;

pub async fn get_race_data() -> impl IntoResponse {
    let client = reqwest::Client::new();
    let res = client
        .get("https://api.jolpi.ca/ergast/f1/2025/last/status/1/results/")
        .send()
        .await
        .unwrap();
    let body = res.text().await.unwrap();
    (StatusCode::OK, Json(json!({"data": body}))).into_response()
}
