class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '3.0.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v3.0.0/litra_v3.0.0_darwin-universal'
    sha256 '839fffe9cf0ba856e9874e44324330e28db0fb44a5f18d43349071a8c8217087'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.0.0/litra_v3.0.0_linux-aarch64'
      sha256 '0516f237c6bf4bd8f85ed1bf5445bc553c50508bfcb0241350d9291fdc51e683'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.0.0/litra_v3.0.0_linux-amd64'
      sha256 '222fe79867d11decf43eb374951930db04ec6fbc2e60928a4069d7eaa0c144a4'
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
