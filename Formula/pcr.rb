class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.3/pcr-macos-arm64"
      sha256 "4005e6bb541a2e11b026cb63a5af672e998915018975c4c42c4f6260df34c1cc"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.3/pcr-macos-x64"
      sha256 "7849d8f981c511c5d4d253e2167e066d446f665901757b481d8effcf9d686d4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.3/pcr-linux-x64"
      sha256 "d557d2667178cdf68ebe7aa5e798cc1e9bb0f17c641061172c6ed19f5852662e"
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
