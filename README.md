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

## Goals

* ♻️ 🚚 Create a repeatable process for making it as easy as possible to get Rust binaries into the hands of people as early and often as possible

As rewarding of a language as Rust is to program in, it means little if you don't **use it** to improve the lives of others with applications.

## Non-Goals

* 🚫 😵 Not be complete by default.

Rust supports a very [wide array](https://forge.rust-lang.org/platform-support.html) of compilation targets. Including all of these by default will inevitably put more burden on common case people trying figuring out which binaries to download and be a burden on new Rustaceans writing application that want the simplest thing that could be possible work for the majority of cases.

> **⚠️ Note:** If you need to support more cases, you can make changes to `.github/workflows/main.yml`

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

Then generate a new rust bin project with run the following providing a name `--name` option with the name of the binary
you want to generate

```sh
$ cargo generate \
  --git https://github.com/softprops/rust-bin.git
  --name my-awesome-rust-bin
```

> **⚠️ Note:** Be sure to edit the `package.name` in the resulting project's `Cargo.toml` file with the name of the binary you wish to produce


[Create a new git repository](https://help.github.com/en/articles/create-a-repo) on GitHub.com

In your generated project, complete the repository setup process and push to GitHub

```sh
git add .
git commit -m "init to winit"
git remote add origin git@github.com:{you}/{my-awesome-rust-bin}.git
git push -u origin master
```

### GitHub repository template

This repository is configured to be a GitHub repository template.

> **⚠️ Note:** You can learn more about repository templates [here](https://help.github.com/en/articles/creating-a-repository-from-a-template)

Simply click the `Use this template` button on this repository's GitHub page and follow the problems.

Clone your new repository to your local computer.

> **⚠️ Note:** Be sure to edit the `package.name` and `package.authors` in the resulting project's `Cargo.toml` file with the name of the binary you wish to produce and your `{user} <email>` for Crates.io consumption. You'll also likely want to remove the `.genignore` and give the repo its own `README.md` file


### Start the action

Assumming you have already [applied for the GitHub Actions beta here](https://github.com/features/actions/signup/) and received
your invite you should find GitHub already going to work for you on your first `push` by visiting

```
https://github.com/{you}/{my-awesome-rust-bin}/actions
```

> **⚠️ Note:** This may take a few seconds on the first push. GitHub will take a few seconds to register push events with your newly provided workflow.

You'll find GitHub is doing the following for you

* checking your codestyle with rustfmt
* linting your code with clippy
* doing a quick compile check
* running tests against `nightly`, `beta`, `stable` on `linux`, `osx`, and `windows`

### Releasing

You'll notice this workflow ends with a publish step but does **not** actually publishing anything yet.

The reason why is that you typically only want to publish a release with a [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging).

Let's try that.

```sh
git tag -a v0.1.0 -m "initial release"
git push origin v0.1.0
```

Visit `https://github.com/{you}/{my-awesome-rust-bin}/actions` once more and you should find another workflow run has started. This time the workflow will end with a publish step that will create a new GitHub release named after the tag.

You can find your GitHub releases here.

```
https://github.com/{you}/{my-awesome-rust-bin}/releases
```

🎁 You should find 3 assets attached to your GitHub release. One for `linux`, one for `OSX`, and one for `windows`. Download the one for the type of operating system you are using by clicking the link.

Unpack the asset locally and run it...

🎉 Congradulations. You've just shipped your first release 🚀! Now you can share your awesome Rust binaries with all your friends.

⭐ You can also communicate with the world that you're project is in a stable state by creating a `README.md` file adding a [workflow badge](https://help.github.com/en/articles/configuring-a-workflow#adding-a-workflow-status-badge-to-your-repository).

```
![](https://github.com/actions/{you}/{my-awesome-rust-bin}/main/badge.svg)
```

> **⚠️ Note:** You can extend your GitHub workflow by editing the `.github/workflows/main.yml` file in your project. I you can also create separate workflows for separate GitHub events. Learn more [here](https://help.github.com/en/categories/automating-your-workflow-with-github-actions).


## Resources

* [setup-rust action](https://github.com/hecrj/setup-rust-action)
* [gh-release action](https://github.com/softprops/action-gh-release)
* [GitHub actions docs](https://help.github.com/en/categories/automating-your-workflow-with-github-actions)