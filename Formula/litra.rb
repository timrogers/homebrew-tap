class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.4.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.4.0/litra_v2.4.0_darwin-universal'
    sha256 '927389eb3f9b256da284319255555db9dbf81f4669d942761d2dcb079b5c9593'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.4.0/litra_v2.4.0_linux-aarch64'
      sha256 'a5526a3cf35a2082abc6b6423fc749ef0dccbf7381f9b62d763f27bcdb2e0bae'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.4.0/litra_v2.4.0_linux-amd64'
      sha256 '2f3c1aa08f88ea1764d23c8d2dcdfe5f7e4690e07f387ab1a4f63614250ca1d9'
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
