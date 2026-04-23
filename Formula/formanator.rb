class Formanator < Formula
  desc "Submit and manage Forma (https://joinforma.com) claims from the command line and Model Context Protocol (MCP) clients"
  homepage "https://github.com/timrogers/formanator"
  version "3.1.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v3.1.0.tar.gz'
  sha256 '201b226cf2f396d14e9db6f8f94091f5651f0fe7c578d49b0ce1d9a91d5e8edd'
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
