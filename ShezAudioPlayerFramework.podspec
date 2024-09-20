Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ――― #
  spec.name         = "ShezAudioPlayerFramework"
  spec.version      = "0.0.1"
  spec.summary      = "A full-featured audio player framework with full-screen and background audio playback controls."

  # A more detailed description of the framework
  spec.description  = <<-DESC
    ShezAudioPlayerFramework provides a full-screen audio player with play, pause, stop, mute controls, background audio support, and a snackbar for pause/stop when in background.
  DESC

  spec.homepage     = "https://github.com/yourusername/ShezAudioPlayerFramework"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "shehzadsulaiman" => "shehzadsulaiman@gmail.com" }

  # ―――  Platform and Deployment Target  ――― #
  spec.ios.deployment_target = "11.0"  # Minimum iOS version for the framework

  # ―――  Source Location  ――― #
  # Ensure the GitHub URL is accurate and points to your repository
  spec.source       = { :git => "https://github.com/yourusername/ShezAudioPlayerFramework.git", :tag => "#{spec.version}" }

  # ―――  Source Code  ――― #
  # Adjust these to point to the correct folders where your source code resides
  spec.source_files  = "ShezAudioPlayerFramework/**/*.{swift}"
  spec.exclude_files = "ShezAudioPlayerFramework/Exclude"

  # ―――  Resources  ――― #
  # If you have resources like images, add them here (remove if not applicable)
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # ―――  Framework Dependencies  ――― #
  # Add frameworks your framework depends on
  spec.frameworks = "AVFoundation", "UIKit"

  # ―――  ARC ――― #
  # Ensure that your project uses ARC (Automatic Reference Counting)
  spec.requires_arc = true

end
