cask "vaux" do
  version "1.0.0-alpha.12"
  sha256 "c10ffe7514b04599e4dd5c31bde9dd2d49a608fb33ecbaa10b4a28a4a5b9e9ce"

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
