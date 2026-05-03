class Formanator < Formula
  desc "Submit and manage Forma (https://joinforma.com) claims from the command line and Model Context Protocol (MCP) clients"
  homepage "https://github.com/timrogers/formanator"
  version "3.2.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v3.2.0.tar.gz'
  sha256 '1d569affe5171ee6e94d54b6ed6c0d128106a2fbbb50f5987b865d816df14b75'
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
