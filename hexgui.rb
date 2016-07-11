class Hexgui < Formula
  desc "GUI for playing Hex over Hex Text Protocol"
  homepage "https://sourceforge.net/p/benzene/hexgui/"
  url "http://sourceforge.net/projects/benzene/files/hexgui/hexgui-0.9.0.zip"
  sha256 "a84e8595cf54140eea8b273832390351f7ef6dfccca38aeb2267c22d64a675d2"

  head do
    url "git://git.code.sf.net/p/benzene/hexgui"
  end

  stable do
    patch do
      url "https://github.com/apetresc/hexgui/commit/fbddebe41a4ea806a7cec768b118f3d9fd1f4056.diff"
      sha256 "1a0adeda87caf28baa0c91d69eefe84f0a4bf2da83d4f2f30ac354b144b094ff"
    end
  end

  depends_on :ant => :build
  depends_on :java

  def install
    system "ant"
    prefix.install ["bin", "lib"]
  end

  test do
    assert_equal "HexGui #{version}", shell_output("#{bin}/hexgui -version").chomp
  end
end
