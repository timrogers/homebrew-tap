class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off.'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '1.4.0'

  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.4.0/litra-autotoggle_v1.4.0_darwin-universal'
    sha256 '0286cb2ecd2b8624314331b899d624ebba66da26d39c9e5851879a4184156d67'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.4.0/litra-autotoggle_v1.4.0_linux-aarch64'
      sha256 'd3a8c24adb7f2687e82d5f43ad21daa9e69faedab09db859e568cc49befcfb04'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.4.0/litra-autotoggle_v1.4.0_linux-amd64'
      sha256 '6a73e34029e52aff0b3a62ba21aea325e2f52601f43ebf0f68902a6e4c96099b'
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

    (buildpath / 'litra-autotoggle.yml').write <<~YAML
      # ----------------
      # * INTRODUCTION *
      # ----------------
      # You can configure litra-autotoggle by specifying command line arguments directly
      # (e.g. `--device-type glow`), or you can use a YML configuration file like this one
      # and pass its path in the `--config-file` argument.
      #
      # The Homebrew service, started with `brew services start litra-autotoggle`,
      # automatically uses a config file located at `$(brew --prefix)/etc/litra-autotoggle.yml`.
      #
      # -------------------------
      # * CONFIGURATION OPTIONS *
      # -------------------------
      # By default, the tool will control all connected Litra devices. You can specify ONE
      # of the below filters to limit which device(s) it will control.
      #
      # device_type: glow
      # serial_number: ABCD1
      # device_path: DevSrvsID:4296789687
      #
      # By default, the tool will watch all connected video devices. On Linux, you can limit
      # this to one specific device by specifying its path below.
      #
      # video_device: /dev/video0
      #
      # By default, the tool will wait 1.5 seconds after a video device event before toggling
      # the light to reduce flickering. You can adjust this delay (in milliseconds) below.
      #
      # delay: 2000
      #
      # By default, if no Litra devices are found, the tool will keep running. You can change this
      # behavior by setting the option below to true.
      #
      # require_device: true
      #
      # By default, the tool emits simple logs. You can enable debug logging by setting the option
      # below to true.
      #
      # verbose: true
      #
      # By default, only the front light is toggled. On Litra Beam LX devices, you can also toggle
      # the back light by setting the option below to true.
      #
      # back: true
    YAML

    etc.install 'litra-autotoggle.yml'
  end

  def caveats
    <<~CAVEAT
      🎉 litra-autotoggle v1.x adds a new easy way to configure the tool when running in the background as a Homebrew service - but it also introduces a breaking change to how we decide what devices to control.

      For more information, see https://github.com/timrogers/litra-autotoggle/releases/tag/v1.0.0.
    CAVEAT
  end

  service do
    run [opt_bin / 'litra-autotoggle', '--config-file', etc / 'litra-autotoggle.yml']
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
