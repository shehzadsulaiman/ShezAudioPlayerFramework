
# ShezAudioPlayerFramework

**ShezAudioPlayerFramework** is a Swift-based audio player framework that provides full-screen audio playback with essential controls such as play, pause, stop, mute, and background audio support with a snackbar for controlling playback when the app is in the background.

## Features
- Full-screen audio playback with intuitive controls
- Background audio playback support
- Snackbar for background pause/stop controls
- Mute/Unmute support
- Easy integration into any iOS app

## Requirements
- iOS 12.0+
- Swift 5.x

## Installation

You can install **ShezAudioPlayerFramework** using [CocoaPods](https://cocoapods.org).

1. Add the following to your `Podfile`:
   ```ruby
   pod 'ShezAudioPlayerFramework', '~> 0.0.1'
   ```

2. Run `pod install`.

## Usage

Import the framework in your `ViewController` and load audio like this:

```swift
import ShezAudioPlayerFramework

let audioVC = AudioPlayerViewController()
audioVC.loadAudio(from: URL(string: "https://example.com/audio.mp3")!)
present(audioVC, animated: true, completion: nil)
```

## Screenshots

![Full-Screen Audio Player](Screenshots/fullscreen_audio_player.png)

## License

ShezAudioPlayerFramework is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
