# AGENTS.md

## Build & Test Commands

- **Build**: `zig build`
- **Run**: `zig build run -- [args]` (e.g., `zig build run -- std.ArrayList`)
- **Test**: `zig build test`
- **Install**: `zig build install -Doptimize=ReleaseFast --prefix $HOME/.local`

## Issue Tracking

Use `bd` for tracking work. Common workflow:

1. **Find work**: `bd ready` - shows unblocked issues
2. **Work on issue**: Complete the task
3. **Mark complete**: `bd close <issue-id>` - close the issue when done
4. **View details**: `bd show <issue-id>` - see full issue details

Other useful commands: `bd create`, `bd list`, `bd dep add` (manage dependencies), `bd update` (modify issues).

Run `bd quickstart` for full tutorial.

## Architecture

This is a Zig CLI tool that parses and displays documentation for Zig standard library symbols and imported modules from build.zig. The codebase consists of:

- **src/main.zig**: Entry point, argument parsing, orchestrates documentation lookup
- **src/Walk.zig**: AST walking logic, manages files/decls/modules maps, categorizes symbols
- **src/Decl.zig**: Declaration representation with metadata (name, visibility, doc comments)
- **src/build_runner_0.14.zig** & **src/build_runner_0.15.zig**: Build runner templates for different Zig versions

## Code Style

- Use PascalCase for type files (Decl.zig, Walk.zig)
- Use snake_case for functions and variables
- Global state stored in module-level vars (gpa, files, decls, modules)
- Use `const` by default, `var` when mutability needed
- Prefer explicit error handling with `try` and error unions
- Use scoped logging: `std.log.scoped(.zigdoc)`
- Doc comments with `//!` for file-level, `///` for declarations
- ArenaAllocator for short-lived allocations, DebugAllocator in debug builds
