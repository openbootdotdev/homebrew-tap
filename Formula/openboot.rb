class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.46.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.1/openboot-darwin-arm64"
    sha256 "ccaffb312a2f6a42348af6aa06126ea2ad3510014539a20c52c5dc4ba2a38d5f"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.1/openboot-darwin-amd64"
    sha256 "5b7910c8873917ccb6794751b5f4576e954f45a3b9a32ea45ea3ee4a9288ed52"
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
