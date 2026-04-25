class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.5/pcr-macos-arm64"
      sha256 "e568b13e22b4dbbd33d21d86a8bc1b2d01bbf99142748cf3e4d02b40bae1c2f0"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.5/pcr-macos-x64"
      sha256 "0d720915e1ad05b20206d85c7fcb427a90a339d968ed0fdd03a46d4fbe3af06f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.5/pcr-linux-x64"
      sha256 "6c6af6126708981dbc6284389f56552763da4ff9be5b56481e38ea4ed9fafd1a"
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
