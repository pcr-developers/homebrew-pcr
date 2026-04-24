class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-arm64"
      sha256 "1c0abb9a3b131decde93f06befe2905d5c4000afaae014a76527995bad255e5c"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-macos-x64"
      sha256 "f6d5221f706e9544d8ce58bc72a5b87d4f6ff0655d2128cd6cb04e72b4ef1883"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.0/pcr-linux-x64"
      sha256 "1550214144aad4793829400caaff1a132e9b940e8a7bd5c8872bfa36e34666c1"
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
