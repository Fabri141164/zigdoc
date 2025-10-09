# zigdoc

A command-line tool to view documentation for Zig standard library symbols.

## Installation

```bash
zig build
```

## Usage

```
Usage: zigdoc [options] <symbol>

Show documentation for a Zig standard library symbol.

Examples:
  zigdoc std.ArrayList
  zigdoc std.mem.Allocator
  zigdoc std.http.Server

Options:
  -h, --help    Show this help message
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
