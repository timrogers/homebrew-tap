class Formanator < Formula
  desc "Submit and manage Forma (https://joinforma.com) claims from the command line and Model Context Protocol (MCP) clients"
  homepage "https://github.com/timrogers/formanator"
  version "5.0.0"
  url 'https://github.com/timrogers/formanator/archive/refs/tags/v5.0.0.tar.gz'
  sha256 'f8994fb86d2f7b9eae22ec91858046772eac104d6a65106802af8ff63ed6348b'
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
