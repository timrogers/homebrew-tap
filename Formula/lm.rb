class Lm < Formula
  desc 'Control your La Marzocco espresso machine from the command line'
  homepage 'https://github.com/timrogers/lm'
  version '0.2.1'

  if OS.mac?
    url 'https://github.com/timrogers/lm/releases/download/v0.2.1/lm_v0.2.1_darwin-universal'
    sha256 '6b748035ea3bca564711b9d619050c8611cce05284ee3b9f8667c31ba031f241'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/lm/releases/download/v0.2.1/lm_v0.2.1_linux-aarch64'
      sha256 'f9bdde2f72e764e5d5e7243e004c3215b966867a228b30c1867cf2c591a5de44'
    else
      url 'https://github.com/timrogers/lm/releases/download/v0.2.1/lm_v0.2.1_linux-amd64'
      sha256 '70a191498f4db4f2a94a646bdb9297a4aefb23bd10d0169b1254089299ef6de0'
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
