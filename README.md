# zigdoc

A command-line tool to view documentation for Zig standard library symbols.

## Installation

```bash
zig build install -Doptimize=ReleaseFast --prefix $HOME/.local
```

## Usage

```
Usage: zigdoc [options] <symbol>

Show documentation for a Zig standard library symbol.

Examples:
  zigdoc std.ArrayList
  zigdoc std.mem.Allocator
  zigdoc std.http.Server
  zigdoc vaxis.Window

Options:
  -h, --help        Show this help message
  --dump-imports    Dump module imports from build.zig as JSON
```

## Examples

```bash
zigdoc std.ArrayList
zigdoc std.mem.Allocator
zigdoc std.http.Server
```

## Features

- View documentation for any public symbol in the Zig standard library
- Shows symbol location, category, and signature
- Displays doc comments and members
- Follows aliases to implementation
