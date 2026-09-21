class Formanator < Formula
  desc "Submit Forma <https://joinforma.com> benefit claims from the command line and Model Context Protocol (MCP) clients, with support for AI-powered receipt analysis with an LLM or Jev"
  homepage "https://github.com/timrogers/formanator"
  version "5.4.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v5.4.0.tar.gz'
  sha256 '930f47273fef34a1ccbb7fdfb9ef475dc06fbd6d6fcb1a0e5df4632298a8c9ee'
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
