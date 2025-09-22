class Lm < Formula
  desc 'Control your La Marzocco espresso machine from the command line'
  homepage 'https://github.com/timrogers/lm'
  version '0.2.2'

  if OS.mac?
    url 'https://github.com/timrogers/lm/releases/download/v0.2.2/lm_v0.2.2_darwin-universal'
    sha256 'cbf7da763a8717e54b033acdc003263f40756b2125218b36fd36c0b5aa1455f9'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/lm/releases/download/v0.2.2/lm_v0.2.2_linux-aarch64'
      sha256 'a0aa454fb7ba306b5fda983d1df6d964d8d5d36ff6a0b7b14a1ba63177aa0036'
    else
      url 'https://github.com/timrogers/lm/releases/download/v0.2.2/lm_v0.2.2_linux-amd64'
      sha256 '4e321fc6980d384ff2ebcad46ab110fc52cf4039d0f6c0b842f3b99730e91a12'
    end
  end

  def install
    if OS.mac?
      bin.install "lm_v#{version}_darwin-universal" => 'lm'
    elsif Hardware::CPU.arm?
      bin.install "lm_v#{version}_linux-aarch64" => 'lm'
    else
      bin.install "lm_v#{version}_linux-amd64" => 'lm'
    end
  end

  test do
    assert_match "lm v#{version}", shell_output("#{bin}/lm --version").strip
  end
end
