class Gearsystem < Formula
  desc "Sega Master System / Game Gear emulator"
  homepage "https://github.com/drhelius/Gearsystem"
  url "https://github.com/drhelius/Gearsystem/archive/gearsystem-2.2.tar.gz"
  sha256 "58004ae6cc7497d466213d2b7f00f2f1abbbd2ea900de228e2f392ceb505984a"
  head "https://github.com/drhelius/Gearsystem.git"

  bottle do
    cellar :any
    sha256 "4b1f81eaf83e75b56247687a0a805083e1d109124fe65c1e26e0669d73ad563d" => :el_capitan
    sha256 "9dd43b91cd8a84676a03ca34b2a55ff34d3b7e502463432dd20e42d4933178c0" => :yosemite
    sha256 "59db7fb31165ccf6f7afe966b20c82d6119f635b233be319738bce37d7047046" => :mavericks
  end

  depends_on "qt5"
  depends_on "sdl2"

  def install
    cd "platforms/macosx/Gearsystem" do
      inreplace "Gearsystem.pro" do |s|
        s.gsub! "/usr/local/include", "#{Formula["sdl2"].include}"
        s.gsub! "/usr/local/lib", "#{Formula["sdl2"].lib}"
      end
      system "#{Formula["qt5"].bin}/qmake", "PREFIX=#{prefix}", "CONFIG+=c++11"
      system "make"
      prefix.install "Gearsystem.app"
      bin.write_exec_script "#{prefix}/Gearsystem.app/Contents/MacOS/Gearsystem"
    end
  end
end
