class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.5.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.5.0/litra-autotoggle_v0.5.0_darwin-universal'
    sha256 '65e913f1bd5b15133a8d599ecb7573c6c331ed12c420b84cdf6552a3714bc7ad'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.5.0/litra-autotoggle_v0.5.0_linux-aarch64'
      sha256 '02f23daa7f3902fd592c931101a367a105a91a863e6d37e03b576d0bf5febb24'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.5.0/litra-autotoggle_v0.5.0_linux-amd64'
      sha256 '4f59328131aa9fd5015c0bd9d51dcd43b2b7a18452a6796a426d7bb4dc1016fe'
    end
  end

  def install
    if OS.mac?
      bin.install "litra-autotoggle_v#{version}_darwin-universal" => 'litra-autotoggle'
    elsif Hardware::CPU.arm?
      bin.install "litra-autotoggle_v#{version}_linux-aarch64" => 'litra-autotoggle'
    else
      bin.install "litra-autotoggle_v#{version}_linux-amd64" => 'litra-autotoggle'
    end
  end

  service do
    run opt_bin / 'litra-autotoggle'
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
