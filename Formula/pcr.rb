class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.8/pcr-macos-arm64"
      sha256 "718b0c6aad516a8c43b1856ff7372bd3dbeb98612c131c0776ab49be80377ea4"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.8/pcr-macos-x64"
      sha256 "2312366b4fc88ec4a3b4896c13f5202a4bd31fafe57c1994c34aa594720e311e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.8/pcr-linux-x64"
      sha256 "24b0672a1552931624593c4f751b7c6bd5a248ec9df874f82903d63d778be96e"
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
