class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.3.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.3.0/litra_v2.3.0_darwin-universal'
    sha256 '232308fb82e812fe0e06f6186d6359a3b4623e037a67b708d905fdd991a35881'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.3.0/litra_v2.3.0_linux-aarch64'
      sha256 '7ab17b4c9130feb8ed046f1f6b008a02ed758695a96efe6b4182fc52675586f7'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.3.0/litra_v2.3.0_linux-amd64'
      sha256 'b05a16f3c0ebb2f274a9bda5376265ea18d7dee9491f07256be5dd7dbc04ab2f'
    end
  end

  def install
    if OS.mac?
      bin.install "litra_v#{version}_darwin-universal" => 'litra'
    elsif Hardware::CPU.arm?
      bin.install "litra_v#{version}_linux-aarch64" => 'litra'
    else
      bin.install "litra_v#{version}_linux-amd64" => 'litra'
    end
  end

  test do
    assert_match "litra v#{version}", shell_output("#{bin}/litra --version").strip
  end
end
