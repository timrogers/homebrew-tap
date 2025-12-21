class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.5.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.0/litra_v2.5.0_darwin-universal'
    sha256 '844c4796645fbea9772f06ff6194fd2a9189e81497753d4a208eb573ce06deda'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.0/litra_v2.5.0_linux-aarch64'
      sha256 '07725f7ec8df97e5e7ddb9c31999c1b1eebeba7feb5f57441055cfe2e4502242'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.0/litra_v2.5.0_linux-amd64'
      sha256 'f40c447651b9e40cdb2813a93373b6d904161ae6627fb7aef472b52bd5d66750'
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
