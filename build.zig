const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zallegro", "src/zallegro.zig");
    lib.setBuildMode(mode);
    lib.install();

    const zallegro_tests = b.addTest("src/zallegro.zig");
    zallegro_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&zallegro_tests.step);
}
