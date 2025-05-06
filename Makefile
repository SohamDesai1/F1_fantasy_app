# === Makefile for Rust + Flutter Monorepo ===

# ---------- Rust Backend ----------
run-backend:
	cd backend && cargo run

build-backend:
	cd backend && cargo build --release

test-backend:
	cd backend && cargo test

format-backend:
	cd backend && cargo fmt

# ---------- Flutter Frontend ----------
run-frontend:
	cd frontend && flutter run

build-frontend:
	cd frontend && flutter build apk

test-frontend:
	cd frontend && flutter test

format-frontend:
	cd frontend && dart format .

# ---------- Unified Commands ----------
run:
	make -j2 run-backend run-frontend

test:
	make test-backend
	make test-frontend

format:
	make format-backend
	make format-frontend
