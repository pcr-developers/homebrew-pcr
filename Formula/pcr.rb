class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.12/pcr-macos-arm64"
      sha256 "501c879020d727ab459ef2cc05b9f0d68b70dd7b9e98b81a22cf98e2a13d527b"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.12/pcr-macos-x64"
      sha256 "38aca126cd2ea61d838a76ea0071f0a19dff1da8289037982ffc43d5f77eb780"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.12/pcr-linux-x64"
      sha256 "af86879c232273db37e060135dfd1e86a46d93eb3859476b9438200d27e617bf"
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
