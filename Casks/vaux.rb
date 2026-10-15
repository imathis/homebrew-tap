cask "vaux" do
  version "1.0.0-alpha.1"
  sha256 "fa2251e97d1e5fe141e185a0cb58d62e533792b01443b1401f39254102bc764c"

  url "https://github.com/imathis/vaux/releases/download/v#{version}/Vaux-#{version}.zip"
  name "Vaux"
  desc "Microphone control for the dictation age"
  homepage "https://github.com/imathis/vaux"

  depends_on macos: :tahoe

  app "Vaux.app"

  uninstall quit: "dev.imathis.vaux"

  zap trash: "~/Library/Preferences/dev.imathis.vaux.plist"
end
