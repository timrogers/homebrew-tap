class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '3.1.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.0/litra_v3.1.0_darwin-universal'
    sha256 'c9516737b1c50bab4cf8980062f688c3025901619eef1a36004ad13e0a034556'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.0/litra_v3.1.0_linux-aarch64'
      sha256 'da7b9d3e3f5abe3b03e3e84faebc7baebed657caf000474152d44d355e6bdb31'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.0/litra_v3.1.0_linux-amd64'
      sha256 '426f746619bd79efd9ddd1ac43de5f3edee707062cd87e62d947cb20397d24a7'
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

  def caveats
    <<~CAVEAT
      🎉 litra v3.x adds support for the colorful back side of Litra Beam LX devices - but also includes breaking changes that may impact you if you're using the `litra devices --json` command and parsing the result.

      For more information, see https://github.com/timrogers/litra-rs/releases/tag/v3.0.0.
    CAVEAT
  end

  test do
    assert_match "litra v#{version}", shell_output("#{bin}/litra --version").strip
  end
end
