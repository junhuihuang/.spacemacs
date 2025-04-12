#!/bin/sh

rustup update
rustup component add rust-analyzer
rustup component add rustfmt
rustup component add clippy

cargo install cargo-edit
cargo install cargo-outdated
