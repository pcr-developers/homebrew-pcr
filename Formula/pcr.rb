class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.7/pcr-macos-arm64"
      sha256 "423b48eb7a8399905511bc83a1e0b28bb1f2540c427b2397c636c18aad44b423"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.7/pcr-macos-x64"
      sha256 "8d1394e1965109277d2e1abb1951b229f6275acf7ea186a0c2ddd7d11ae6ce61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.7/pcr-linux-x64"
      sha256 "bfdaf0823b1c4b914a0fbf94b1f4cb067ebe427717fd82bdc84ea5cb8348519a"
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
