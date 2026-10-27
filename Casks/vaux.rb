cask "vaux" do
  version "1.0.0-alpha.2"
  sha256 "6944045dc9e724775d67213efb5a61e1f0fb847a0ba7b496b82f8bedd8b01143"

  url "https://github.com/imathis/vaux/releases/download/v#{version}/Vaux-#{version}.zip"
  name "Vaux"
  desc "Microphone control for the dictation age"
  homepage "https://github.com/imathis/vaux"

  depends_on macos: :tahoe

  app "Vaux.app"

  # Vaux Camera, if it was turned on, goes with Vaux: only Vaux can remove
  # it, and only before the app is deleted.
  uninstall quit:   "dev.imathis.vaux",
            script: {
              executable:   "#{appdir}/Vaux.app/Contents/MacOS/Vaux",
              args:         ["-uninstallCamera"],
              must_succeed: false,
            }

  zap trash: [
    "~/Library/Application Support/dev.imathis.vaux",
    "~/Library/Preferences/dev.imathis.vaux.plist",
  ]
end
