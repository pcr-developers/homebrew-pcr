class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-arm64"
      sha256 "7703ad566e56929c777b1d343898df312a0a3a16b6bab92a30a8c4cea1a303af"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-x64"
      sha256 "ff9654aa66a69d0e76c48a72d77f6f24688e77d8695da26786257f4eec7f35f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-linux-x64"
      sha256 "00d892b8f22bd0172ebd4d266345adfc3ae08c830590129684902ee29c1b4b6a"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pcr-macos-arm64" => "pcr"
      else
        bin.install "pcr-macos-x64" => "pcr"
      end
    else
      bin.install "pcr-linux-x64" => "pcr"
    end
  end

  test do
    assert_match "PCR.dev", shell_output("#{bin}/pcr --help")
  end
end
