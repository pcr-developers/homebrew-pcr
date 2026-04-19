class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.15/pcr-macos-arm64"
      sha256 "7692ccd176e36e665d3a172e3a691bdf383ae784500e7e569d1d758f62c3e77a"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.15/pcr-macos-x64"
      sha256 "788476a9ee4066eba9ba3fc787b72ae2cdfb08b9fb06a40b0f1d1e7649ab8339"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.15/pcr-linux-x64"
      sha256 "7b3600caa929d71fb3ef7984f9d17b656b36a75905317505867cc38c0333eb25"
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
