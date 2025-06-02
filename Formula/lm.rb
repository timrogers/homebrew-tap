class Lm < Formula
  desc 'Control your La Marzocco espresso machine from the command line'
  homepage 'https://github.com/timrogers/lm'
  version '0.2.0'

  if OS.mac?
    url 'https://github.com/timrogers/lm/releases/download/v0.2.0/lm_v0.2.0_darwin-universal'
    sha256 'c0491ea1e32f1b87c70959c9e50a21e46fe600131805192a925dfd2243c26d36'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/lm/releases/download/v0.2.0/lm_v0.2.0_linux-aarch64'
      sha256 '9777c6d3aaed0eeef77176cd3f8fa1c5253179e4ee9240284eab38ef49382e69'
    else
      url 'https://github.com/timrogers/lm/releases/download/v0.2.0/lm_v0.2.0_linux-amd64'
      sha256 'aea0580dc5a08fc5bd84e95a7ca04f1366b53f02ef97c77936dadb20c681ee82'
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
