# Project agent memory

This file is the project's committed home for project-intrinsic agent knowledge: build, test, release, architecture, and sharp-edge notes that should travel with the code.

- Add durable project-specific notes here as they are discovered through real work.
- CI (`.github/workflows/validate.yml`) calls the reusable build+AppInspect workflow from `Bre77/splunk_nats@main`, credential-free (no publish step). This is a plain modular-input TA (no SplunkUI/React bundle), so `use_ucc_gen: false` and `build_command: "./.build.sh"` - AppInspect scans the `.spl` that `.build.sh` produces, not a raw tar of the repo. `package_glob: "../*.spl"` matches where `.build.sh` writes its output (one directory above `app_dir`, per its `cd ..` before `tar`).
- `default/app.conf`'s `[launcher] version` and `[id] version` must move together; the app's top-level package dir name is `deleter` (see `.build.sh`'s final `tar` target and `package.json`). The GitHub repo is named `splunk_deleter`, not `deleter` - `.build.sh` uses `tar --transform` to rename the checkout dir to `deleter` in the package regardless of what the local checkout/CI clone directory is actually called.

## Maintaining this file

Keep this file for knowledge useful to almost every future agent session in this project.
Do not repeat what the codebase already shows; point to the authoritative file or command instead.
Prefer rewriting or pruning existing entries over appending new ones.
When updating this file, preserve this bar for all agents and keep entries concise.
