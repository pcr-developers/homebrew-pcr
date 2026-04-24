class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-arm64"
      sha256 "5c6ccf0f764eccca726eaa70bcedfeaeb9e20eaa39476f184e686b6747f9d519"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-x64"
      sha256 "78da01af4eaeececd7414d0d246fcbd287ae9b0d1aa9ab2a6b193552c9d5aa2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-linux-x64"
      sha256 "7652e5a8cfbcfce1d701aba4233077e834f7f9aaa75b48584b21aceda39702da"
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
