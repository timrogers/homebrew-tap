class Litra < Formula
  desc 'Control Logitech Litra lights from the command line and Model Context Protocol (MCP) clients'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.5.1'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.1/litra_v2.5.1_darwin-universal'
    sha256 'd1f0c83a051ac6d70e5c079ca591da2f0c8e47c2e80cf8c863e987b8984ad3ee'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.1/litra_v2.5.1_linux-aarch64'
      sha256 '2da66e4788faf02cfcf4800c0865603427e3517d9a9fd0a112fa43015f853dea'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.5.1/litra_v2.5.1_linux-amd64'
      sha256 '9f27b6aaeb91b1474044ed1f750b79e8530c6665e75011e5e6444d0d0652b2e2'
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
