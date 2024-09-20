Pod::Spec.new do |spec|
  spec.name         = "ShezAudioPlayerFramework"
  spec.version = '0.0.3'
  spec.summary      = "A full-featured audio player framework with full-screen and background audio playback controls."

  spec.description  = <<-DESC
    ShezAudioPlayerFramework provides a full-screen audio player with play, pause, stop, mute controls, background audio support, and a snackbar for controlling playback when the app is in the background.
  DESC

  spec.homepage         = "https://github.com/shehzadsulaiman/ShezAudioPlayerFramework"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "shehzadsulaiman" => "shehzadsulaiman@gmail.com" }

  spec.ios.deployment_target = "12.0"
  spec.source           = { :git => "https://github.com/shehzadsulaiman/ShezAudioPlayerFramework.git", :tag => spec.version.to_s }

  spec.source_files  = "ShezAudioPlayerFramework/**/*.{swift}"
  spec.exclude_files = "ShezAudioPlayerFramework/Exclude"

  spec.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']
  spec.frameworks = "AVFoundation", "UIKit"

  spec.requires_arc = true
end
