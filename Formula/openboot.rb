class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.1/openboot-darwin-arm64"
    sha256 "242ab0b10a9789df2e81423fd14a107e00aafa29e0a9fba60cd2003f7205c6b7"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.1/openboot-darwin-amd64"
    sha256 "16d2bbf3c52a05a13f4f768dd3a5865bb132dba7cfa369e43ca43b67fb09a4b9"
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
