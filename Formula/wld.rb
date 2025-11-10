class Wld < Formula
  desc '💡 Control WLED lights from the command line or your preferred MCP client'
  homepage 'https://github.com/timrogers/wld'
  version '0.0.1'

  if OS.mac?
    url 'https://github.com/timrogers/wld/releases/download/v0.0.1/wld_v0.0.1_darwin-universal'
    sha256 '39b4c301ff4ca67255d628b46330084c6cd38472a27428b538a2b97d429c3bb4'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/wld/releases/download/v0.0.1/wld_v0.0.1_linux-aarch64'
      sha256 'c9d318a8bacba9e525164b3bc02a080b5b5c39344be03cd9492103b6c7a56796'
    else
      url 'https://github.com/timrogers/wld/releases/download/v0.0.1/wld_v0.0.1_linux-amd64'
      sha256 '4e55115f6cf963a650226ec1a5db34be2b8849fa751a4c553f8b1a841d0dfa2a'
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
