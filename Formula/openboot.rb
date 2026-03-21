class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.14"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.14/openboot-darwin-arm64"
    sha256 "42b72bd7e402cb1362a7bad693852a41ed5016203a045fbd0ca5163514496729"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.14/openboot-darwin-amd64"
    sha256 "9a5b6a21c14c9f042f63af08c1e5e7d768b2553704da9d3903d00eca63d9becd"
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
