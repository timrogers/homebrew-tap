class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  version "2.0.0"

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url "https://github.com/timrogers/litra-rs/releases/download/v2.0.0/litra_v2.0.0_darwin-universal"
    sha256 "51ddcbcf7510ae3945bb2e3addc73c7ef1afb571fbe99f602584641aeaab0abf"
  elsif OS.linux?
    if Hardware::CPU.arm?
      odie "Linux devices with ARM processors are not supported"
    else
      url "https://github.com/timrogers/litra-rs/releases/download/v2.0.0/litra_v2.0.0_linux-amd64"
      sha256 '2d2cd3cdc608f0ff59abe6e36b92ab0610b757590262547dab21795a5316febf'
    end
  end

  def install
    if OS.mac?
      bin.install "litra-v#{version}_darwin-universal" => 'litra'
    else
      bin.install "litra-v#{version}_linux-amd64" => 'litra'
    end
  end

  test do
    assert_match "litra v#{version}", shell_output("#{bin}/litra --version").strip
  end
end
