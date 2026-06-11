---
name: updating-homebrew-formula
description: Use this skill when asked to update a Homebrew formula
---

1. Identify which of the Homebrew formula in `Formula/` needs to be updated
2. Read the formula to determine which type it is:
   - **Binary formula**: downloads pre-built binaries per platform (uses `if OS.mac? ... elsif OS.linux?` blocks with direct binary URLs). Example: `csvmd.rb`, `litra.rb`
   - **Source tarball formula**: downloads a source archive and builds with a tool like Cargo (uses a single `url` pointing to a `.tar.gz` archive and has a `depends_on` build dependency). Example: `formanator.rb`
3. Look up the release on the corresponding GitHub project - e.g. `csvmd` -> `timrogers/csvmd` - using `gh release view vX.Y.Z --repo timrogers/<name> --json tagName,assets`
4. Update the formula based on its type:
   - **Binary formula**: update the `version`, and for each platform block update the `url` to point to the new binary asset and the `sha256` using the digest from the release assets
   - **Source tarball formula**: update the `version` and `url` to point to the new `.tar.gz` archive at `https://github.com/timrogers/<name>/archive/refs/tags/vX.Y.Z.tar.gz`, then compute the new `sha256` by running `curl -sL <url> | sha256sum`
5. Commit the changes
