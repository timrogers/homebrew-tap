class Wld < Formula
  desc '💡 Control WLED lights from the command line or your preferred MCP client'
  homepage 'https://github.com/timrogers/wld'
  version '0.0.2'

  if OS.mac?
    url 'https://github.com/timrogers/wld/releases/download/v0.0.2/wld_v0.0.2_darwin-universal'
    sha256 '058b18a4fa46a213c75d79a078372adb5d7051ff0b2d593496e14ea546c64700'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/wld/releases/download/v0.0.2/wld_v0.0.2_linux-aarch64'
      sha256 '2450a668ba3a7b47e8ba0460dfec144c7f199a73232c0c6ad1f7658ae312202f'
    else
      url 'https://github.com/timrogers/wld/releases/download/v0.0.2/wld_v0.0.2_linux-amd64'
      sha256 'aa09b2f7efe801dfb1c6eb6fbbd5d304a13a2921f51c151e6ffcc8f8cae89f10'
    end
  end

  def install
    if OS.mac?
      bin.install "wld_v#{version}_darwin-universal" => 'wld'
    elsif Hardware::CPU.arm?
      bin.install "wld_v#{version}_linux-aarch64" => 'wld'
    else
      bin.install "wld_v#{version}_linux-amd64" => 'wld'
    end
  end

  test do
    assert_match "wld v#{version}", shell_output("#{bin}/wld --version").strip
  end
end
