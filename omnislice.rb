require "fileutils"

class Omnislice < Formula
  homepage "https://github.com/philc/omnislice"
  head "https://github.com/philc/omnislice.git"

  depends_on "imagemagick" => :build

  def install
    # Copy our omnislice launcher applescript into the user's applescripts directory for Omnigraffle.
    omnigraffle_applescripts = File.join(ENV["HOME"], "Library/Scripts/Applications/OmniGraffle 6")
    FileUtils.mkdir_p(omnigraffle_applescripts)
    FileUtils.cp("omnislice.applescript", omnigraffle_applescripts)
    bin.install("omnislice")
  end

  test do
    system "#{bin}/omnislice", "-h"
  end
end
