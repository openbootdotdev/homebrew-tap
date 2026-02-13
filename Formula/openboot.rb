class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.25.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.25.0/openboot-darwin-arm64"
    sha256 "eb622e9a88ca89a952388b2e4b0fffe3a61930d7c23f3f0a3ea4ddcd6f28e539"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.25.0/openboot-darwin-amd64"
    sha256 "f5f7066433defdc5ee18076b553ceb11f6aa211b55f2eec3aeec7cbae0153c93"
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
