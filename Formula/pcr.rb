class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.7/pcr-macos-arm64"
      sha256 "aa31cb6a3b9e070c047c0a78d51de8067af1034806cf6e7f1e228ca2744bf8f8"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.7/pcr-macos-x64"
      sha256 "4f441f5de71046762c6ad13cd3b17cec15f2f1a0764490611f176ac954043cb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.7/pcr-linux-x64"
      sha256 "ad720df531275a568b2f0e38091f137f701e33016c4d7e3d89a2762924749cf2"
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
