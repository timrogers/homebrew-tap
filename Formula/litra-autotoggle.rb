class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.4.1'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.1/litra-autotoggle_v0.4.1_darwin-universal'
    sha256 '91c13c93ad4111be3ec2ca295df038dc5ae08cb48cb36f343a57f54fc0989ba2'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.1/litra-autotoggle_v0.4.1_linux-aarch64'
      sha256 '7d32c90bd8ed6f2b347c16545097a9821bec7530bc9efb35439d870d848ca5b5'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.4.1/litra-autotoggle_v0.4.1_linux-amd64'
      sha256 '3eb2d556c147974f2662f4771ab21644941a926d6f2c6c5ac972d099631eb176'
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
