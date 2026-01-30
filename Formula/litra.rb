class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '3.1.1'
  
  deprecate! date: '2026-01-30', because: 'is now available via Homebrew Core with `brew install litra`'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.1/litra_v3.1.1_darwin-universal'
    sha256 'd44763e7c9266dd6cf0014b53b9d2278c024f13ba5d652c9b514ec64e40f2da1'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.1/litra_v3.1.1_linux-aarch64'
      sha256 'd25607c004690eb3ae368507a6f5cf59dc74568f908b4271ff65e4486d2a9aff'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v3.1.1/litra_v3.1.1_linux-amd64'
      sha256 'a1033492d1cdb6660e292d4401221f2f5840e6f136e3ba0c4c3d81385bd6fee5'
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
