class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-arm64"
      sha256 "79153ae452739de532bdf1a89d9f16767b492d434d3f4dcd99814095a2ba7f25"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-x64"
      sha256 "b5ef38893cd7c4a036f01f8496353748ad911eaf755dc9b17cdee1c56a7fc6c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-linux-x64"
      sha256 "c8ef4283e4772912be2e5750e8fea6310c7c59e5f85bbfd7e5f73e290beb492a"
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
