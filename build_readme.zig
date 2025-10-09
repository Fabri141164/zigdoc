const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 3) {
        std.debug.print("Usage: {s} <help-file> <output-file>\n", .{args[0]});
        return error.InvalidArgs;
    }

    const help_file = args[1];
    const output_file = args[2];

    const help_content = try std.fs.cwd().readFileAlloc(allocator, help_file, 1024 * 1024);
    defer allocator.free(help_content);

    const readme = try std.fmt.allocPrint(allocator,
        \\# zigdoc
        \\
        \\A command-line tool to view documentation for Zig standard library symbols.
        \\
        \\## Installation
        \\
        \\```bash
        \\zig build
        \\```
        \\
        \\## Usage
        \\
        \\```
        \\{s}```
        \\
        \\## Examples
        \\
        \\```bash
        \\zigdoc std.ArrayList
        \\zigdoc std.mem.Allocator
        \\zigdoc std.http.Server
        \\```
        \\
        \\## Features
        \\
        \\- View documentation for any public symbol in the Zig standard library
        \\- Shows symbol location, category, and signature
        \\- Displays doc comments and members
        \\- Follows aliases to implementation
        \\
    , .{help_content});
    defer allocator.free(readme);

    try std.fs.cwd().writeFile(.{ .sub_path = output_file, .data = readme });
}
