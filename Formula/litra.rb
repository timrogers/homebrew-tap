class Litra < Formula
  desc 'Control your Logitech Litra light from the command line'
  homepage 'https://github.com/timrogers/litra-rs'
  version '2.1.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-rs/releases/download/v2.1.0/litra_v2.1.0_darwin-universal'
    sha256 '8a107bdfe1646b9584a2c26ca4730c64de67df91c03dfc2a490462c8dca1e57f'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.1.0/litra_v2.1.0_linux-aarch64'
      sha256 '0848a3a99ca4e76dd56b26bed472a8d5bd11ce44b92377d9f5c389e8df8f2ac9'
    else
      url 'https://github.com/timrogers/litra-rs/releases/download/v2.1.0/litra_v2.1.0_linux-amd64'
      sha256 '458b9536bac6a151a0a4adf0f7765cec6f0ef8f5a5b6b2c8d1b10ae933d40acc'
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
