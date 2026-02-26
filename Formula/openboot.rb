class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.33.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.0/openboot-darwin-arm64"
    sha256 "f9a6f8a4ea8195f6d33ad8263803194c4e545fd86b0445db252e1f440a5c4501"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.0/openboot-darwin-amd64"
    sha256 "c3f374336a7ebd420b02de890f35578a480561050ea71a6d7019116eb5a92b3e"
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
