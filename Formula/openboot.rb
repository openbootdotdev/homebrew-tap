class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.44.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.44.0/openboot-darwin-arm64"
    sha256 "8f8269ce03ecd12761d308906f4563a8c907ebc3836684d9cee22b885160aad3"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.44.0/openboot-darwin-amd64"
    sha256 "a69dde32d6997534592301aa2ab5e6483818a6ed2f221cc2a8a480216a86f579"
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
