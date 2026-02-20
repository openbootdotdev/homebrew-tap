class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.28.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.28.2/openboot-darwin-arm64"
    sha256 "d9dafe942e02555e7a4245aa8d7f83530cee4dfd95f0dcdb74a6c6b35847b41e"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.28.2/openboot-darwin-amd64"
    sha256 "c7b0c8712f0f4ad57680099d1af0043294ab72907e4ba887c672880ed8f8a75e"
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
