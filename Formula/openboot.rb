class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.5"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.5/openboot-darwin-arm64"
    sha256 "02d7f8ac9a578cc6de88365edb35eb8a6264c8d654eae65eb0301fffd7100f7d"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.5/openboot-darwin-amd64"
    sha256 "96fdce2a1bf4c2571f48cc7baa01d9c3c9109a4f776e9635e7da50fdcf811e34"
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
