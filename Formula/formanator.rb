class Formanator < Formula
  desc "Submit and manage Forma (https://joinforma.com) claims from the command line and Model Context Protocol (MCP) clients"
  homepage "https://github.com/timrogers/formanator"
  version "5.2.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v5.2.0.tar.gz'
  sha256 '4f5b2c166aeeaacd7950b237e1a7285aee81e080f769cfeb0028b1bfd07baa79'
  license "MIT"
  head "https://github.com/timrogers/formanator.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/formanator --version")
    assert_match "Usage: formanator <COMMAND>", shell_output("#{bin}/formanator help")
  end
end
