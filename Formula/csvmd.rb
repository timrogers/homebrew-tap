class Csvmd < Formula
  desc 'Convert a CSV file to a Markdown table 📊'
  homepage 'https://github.com/timrogers/csvmd'
  version '0.3.0'

  if OS.mac?
    url 'https://github.com/timrogers/csvmd/releases/download/v0.3.0/csvmd_v0.3.0_darwin-universal'
    sha256 '556bdc3875c17d7c9f213febf318f0598f4c349c19df3b55d0237366b9704534'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/csvmd/releases/download/v0.3.0/csvmd_v0.3.0_linux-aarch64'
      sha256 '788ce2572ccae31b3203f376427c2be0e842986bb61606821061bf95960bba8b'
    else
      url 'https://github.com/timrogers/csvmd/releases/download/v0.3.0/csvmd_v0.3.0_linux-amd64'
      sha256 '6c64d16ed64e2f538296564041df6c1275c2906b19303159b95af0e88653e8a8'
    end
  end

  def install
    if OS.mac?
      bin.install "csvmd_v#{version}_darwin-universal" => 'csvmd'
    elsif Hardware::CPU.arm?
      bin.install "csvmd_v#{version}_linux-aarch64" => 'csvmd'
    else
      bin.install "csvmd_v#{version}_linux-amd64" => 'csvmd'
    end
  end

  test do
    assert_match "csvmd v#{version}", shell_output("#{bin}/csvmd --version").strip
  end
end
