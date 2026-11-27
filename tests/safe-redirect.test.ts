import { describe, expect, it } from "vitest";
import { safeNextPath } from "@/lib/safe-redirect";

describe("safeNextPath (nessun open redirect dopo il login)", () => {
  it.each([
    ["/c/arp-basics?x=1#top", "/c/arp-basics?x=1#top"],
    ["/review", "/review"],
    [null, "/"],
    ["", "/"],
    ["https://evil.example", "/"],
    ["//evil.example/x", "/"],
    ["/\\evil.example", "/"],
    ["javascript:alert(1)", "/"],
    ["/login", "/"],
    ["/ok\n", "/"],
    ["/" + "a".repeat(600), "/"],
  ])("%s → %s", (input, expected) => {
    expect(safeNextPath(input)).toBe(expected);
  });
});
