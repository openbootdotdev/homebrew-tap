class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.3/openboot-darwin-arm64"
    sha256 "1efa60c04008260e58005a7782bcbf0ce7d8900a750004789f0d20acfdd94a6d"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.3/openboot-darwin-amd64"
    sha256 "16ecd4ecaf8b3ece1fe41f91f79b1ce8be67b8d6fee7f0802cb2ad09d4a25b4e"
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
