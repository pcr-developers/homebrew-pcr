class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.9/pcr-macos-arm64"
      sha256 "e032249d580d82905c5c605e10659cb0f2d5871868b8b0ff9bde75bafa9a6ba2"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.9/pcr-macos-x64"
      sha256 "b956f702b26d027f758359f76e17c402340ecad0b15ad123fd17fe12978f4d54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.9/pcr-linux-x64"
      sha256 "056ad1e086d2110befd0f02c5b3b816ce075bff624957f8cd0de15458dde4db2"
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
