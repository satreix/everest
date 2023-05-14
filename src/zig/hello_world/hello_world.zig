const std = @import("std");
const expect = std.testing.expect;
const eql = std.mem.eql;

test "greet" {
    const msg1 = try greet("World");
    try expect(eql(u8, msg1, "Hello, World!"));

    const msg2 = try greet("Zig");
    try expect(eql(u8, msg2, "Hello, Zig!"));
}

fn greet(name: []const u8) anyerror![]const u8 {
    return try std.fmt.allocPrint(std.heap.page_allocator, "Hello, {s}!", .{name});
}

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.c_allocator);
    defer std.process.argsFree(std.heap.c_allocator, args);

    const name = try parseNameFlag(args);
    const message = try greet(name);

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s}\n", .{message});
}

fn parseNameFlag(args: []const []const u8) ![]const u8 {
    const nameFlag = "--name";

    var i: usize = 1;
    while (i < args.len) : (i += 1) {
        const arg = args[i];
        if (std.mem.eql(u8, arg, nameFlag)) {
            if (i + 1 < args.len) {
                return args[i + 1];
            } else {
                break;
            }
        }
    }

    return "World";
}
