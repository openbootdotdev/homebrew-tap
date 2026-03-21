class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.7"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.7/openboot-darwin-arm64"
    sha256 "23ecb85405a2150c11bc01fbb832595c60d338b7a035bcd35371d2e6647bbc9e"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.7/openboot-darwin-amd64"
    sha256 "5988bb43a095de9310efb362fa3c5b3ee7343d44a9013bf11947031937d394fe"
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
