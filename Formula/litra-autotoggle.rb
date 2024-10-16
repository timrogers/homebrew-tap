class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.4.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.0/litra-autotoggle_v0.4.0_darwin-universal'
    sha256 '13c0bc4da867717f8df4ad6a8bb824e1abe783821f38c6c3f3ffc19fb7fe1bde'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.0/litra-autotoggle_v0.4.0_linux-aarch64'
      sha256 '905f34aef4f0ff481b6919c37d3f1ed0ad0133bcccea85351d5f84ac497246d4'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.0/litra-autotoggle_v0.4.0_linux-amd64'
      sha256 'ebbb1d4e4f439af75d57106bd390050e0060b12c9e9cb9c24999939a86e1eace'
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
