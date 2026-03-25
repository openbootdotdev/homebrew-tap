class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.50.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.50.0/openboot-darwin-arm64"
    sha256 "5fc448e4b1c3206bb60070cf14c825f09ad0042f2478d99addea802fdcb40b78"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.50.0/openboot-darwin-amd64"
    sha256 "3968e13fd9187712f36c28ddd6a7375ef571175392d53dcf459405d0c9613d35"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "openboot-darwin-arm64" => "openboot"
    else
      bin.install "openboot-darwin-amd64" => "openboot"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openboot version")
  end
end
