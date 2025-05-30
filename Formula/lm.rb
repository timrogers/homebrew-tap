class Lm < Formula
  desc 'Control your La Marzocco espresso machine from the command line'
  homepage 'https://github.com/timrogers/lm'
  version '0.1.0'

  if OS.mac?
    url 'https://github.com/timrogers/lm/releases/download/v0.1.0/lm-macos-x86_64'
    sha256 '277262df83754d4ace021f088d699afdb6b6c98ac34cc6e957ba451d644ff8b4'
  elsif OS.linux?
    url 'https://github.com/timrogers/lm/releases/download/v0.1.0/lm-linux-x86_64'
    sha256 '0dedae5016f50cd77ba8caa4cb32d637bb71ad0da16a00828e584d5e0482cf0a'
  end

  def install
    if OS.mac?
      bin.install 'lm-macos-x86_64' => 'lm'
    else
      bin.install 'lm-linux-x86_64' => 'lm'
    end
  end

  test do
    assert_match "lm v#{version}", shell_output("#{bin}/lm --version").strip
  end
end
