class Formanator < Formula
  desc "Submit and manage Forma (https://joinforma.com) claims from the command line and Model Context Protocol (MCP) clients"
  homepage "https://github.com/timrogers/formanator"
  version "4.0.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v4.0.0.tar.gz'
  sha256 '81e282e9324e998b5031d07b38656bc47780bcb60c112d636e6960cfccb9d3e3'
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
