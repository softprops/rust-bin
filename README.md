<div align="center">
  🗑️
</div>
<h1 align="center">
  rust bin
</h1>

<div align="center">
   A recipe for <a href="https://www.rust-lang.org/">Rust</a> bins built, tested, and published with <a href="https://help.github.com/en/categories/automating-your-workflow-with-github-actions">GitHub Actions</a>.
</div>

<br />

> **⚠️ Note:** To use GitHub Actions, you must have access to the [GitHub Actions](https://github.com/features/actions) feature. GitHub Actions are currently only available in public beta. You can [apply for the GitHub Actions beta here](https://github.com/features/actions/signup/).

## How to use this repo

This repository is meant to use as a template for new Rust projects intended to produce
a binary for users to run.

### cargo generate

This repository works well with the [`cargo generate`](https://github.com/ashleygwilliams/cargo-generate) plugin.

You can install `cargo generate` with the following

```sh
$ cargo install cargo-generate \
	--features vendored-openssl
```

Then generate a new rust bin repo project with

```
$ cargo generate \
	--git https://github.com/softprops/rust-bin.git
```

> **⚠️ Note:** Be sure to edit the `package.name` in the resulting project with the name of the binary you wish to produce