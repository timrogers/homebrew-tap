class Litra < Formula
  desc 'Control your Logitech Litra light from the command line'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.2.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.2.0/litra_v2.2.0_darwin-universal'
    sha256 'b366983191a649036c7f267a7667938f9a22176bdf83e94fdf9f768a50512040'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.2.0/litra_v2.2.0_linux-aarch64'
      sha256 '38ec3aad8c39fe1e557b63ff681dd7a40a9ed8d31da0dd44af419afb9a280877'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.2.0/litra_v2.2.0_linux-amd64'
      sha256 '46eda3437c3a333c157c52f644ad9bec6424efbb50f2b074d625e7ce9794c811'
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
