cask "dark-mine" do
  version "0.1.0"
  sha256 "0677bbe6a6fba49741362ae2f271c8f681a9d251ceae6dc31500f1736998a6fa"

  url "https://github.com/Jackson-Pike/homebrew-dark-mine/releases/download/v#{version}/DarkMine-Mac.zip"
  name "Dark Mine"
  desc "First-person mining game where blind creatures hunt by sound"
  homepage "https://github.com/Jackson-Pike/homebrew-dark-mine"

  app "Dark Mine.app"

  # Not signed with a paid Apple developer account: clear the "downloaded" flag so macOS lets it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dark Mine.app"]
  end

  zap trash: [
    "~/Library/Application Support/Jackson Pike/Dark Mine",
    "~/Library/Preferences/unity.Jackson Pike.Dark Mine.plist",
  ]
end
