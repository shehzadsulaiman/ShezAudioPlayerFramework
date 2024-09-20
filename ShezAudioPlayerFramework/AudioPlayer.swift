//
//  AudioPlayer.swift
//  ShezAudioPlayerFramework
//
//  Created by Shehzad Sulaiman on 20/09/2024.
//

import AVFoundation

public class AudioPlayer: NSObject {
    
    internal var audioPlayer: AVAudioPlayer?
    
    public override init() {
        super.init()
        setupAudioSession()
    }

    // MARK: - Load Audio File
    public func loadAudioFile(from url: URL) throws {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            throw error
        }
    }

    // MARK: - Play, Pause, Stop
    public func play() {
        audioPlayer?.play()
    }

    public func pause() {
        audioPlayer?.pause()
    }

    public func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }

    // MARK: - Mute and Unmute
    public func mute() {
        audioPlayer?.volume = 0
    }

    public func unmute() {
        audioPlayer?.volume = 1
    }

    // MARK: - Current Time and Duration
    public var currentTime: TimeInterval {
        return audioPlayer?.currentTime ?? 0
    }

    public var duration: TimeInterval {
        return audioPlayer?.duration ?? 0
    }

    // MARK: - Set Volume
    public func setVolume(_ volume: Float) {
        audioPlayer?.volume = volume
    }

    // MARK: - Private Setup
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session setup failed: \(error)")
        }
    }
}

