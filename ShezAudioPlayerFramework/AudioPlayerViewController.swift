//
//  AudioPlayerViewController.swift
//  ShezAudioPlayerFramework
//
//  Created by Shehzad Sulaiman on 20/09/2024.
//

import UIKit
import AVFoundation

public class AudioPlayerViewController: UIViewController {

    // MARK: - Properties
    private var player: AudioPlayer = AudioPlayer()
    private var isPlaying = false

    private var playPauseButton: UIButton!
    private var stopButton: UIButton!
    private var muteButton: UIButton!
    private var closeButton: UIButton!
    private var seekBar: UISlider!
    
    private var snackbar: SnackbarView?

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Observe app background state changes for background playback
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    // MARK: - Public Methods
    public func loadAudio(from url: URL) {
        do {
            try player.loadAudioFile(from: url)
        } catch {
            print("Failed to load audio: \(error)")
        }
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .black

        // Play/Pause Button
        playPauseButton = UIButton(type: .system)
        playPauseButton.setTitle("Play", for: .normal)
        playPauseButton.setTitleColor(.white, for: .normal)
        playPauseButton.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        playPauseButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view.addSubview(playPauseButton)

        // Stop Button
        stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.addTarget(self, action: #selector(stopAudio), for: .touchUpInside)
        stopButton.frame = CGRect(x: 100, y: 160, width: 100, height: 50)
        view.addSubview(stopButton)

        // Mute Button
        muteButton = UIButton(type: .system)
        muteButton.setTitle("Mute", for: .normal)
        muteButton.setTitleColor(.white, for: .normal)
        muteButton.addTarget(self, action: #selector(toggleMute), for: .touchUpInside)
        muteButton.frame = CGRect(x: 100, y: 220, width: 100, height: 50)
        view.addSubview(muteButton)

        // Close Button
        closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.addTarget(self, action: #selector(closePlayer), for: .touchUpInside)
        closeButton.frame = CGRect(x: view.bounds.width - 70, y: 40, width: 60, height: 40)
        view.addSubview(closeButton)

        // Seek Bar
        seekBar = UISlider(frame: CGRect(x: 20, y: view.bounds.height - 100, width: view.bounds.width - 40, height: 30))
        seekBar.minimumValue = 0
        seekBar.maximumValue = 1
        seekBar.addTarget(self, action: #selector(seekAudio), for: .valueChanged)
        view.addSubview(seekBar)

        // Update seek bar with player time every second
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSeekBar), userInfo: nil, repeats: true)
    }

    // MARK: - Actions
    @objc private func togglePlayPause() {
        if isPlaying {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        } else {
            player.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
        isPlaying.toggle()
    }

    @objc private func stopAudio() {
        player.stop()
        playPauseButton.setTitle("Play", for: .normal)
        isPlaying = false
    }

    @objc private func toggleMute() {
        if player.audioPlayer?.volume == 0 {
            player.unmute()
            muteButton.setTitle("Mute", for: .normal)
        } else {
            player.mute()
            muteButton.setTitle("Unmute", for: .normal)
        }
    }

    @objc private func closePlayer() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func seekAudio() {
        let duration = player.duration
        let newTime = duration * Double(seekBar.value)
        player.audioPlayer?.currentTime = newTime
    }

    @objc private func updateSeekBar() {
        guard let duration = player.audioPlayer?.duration, let currentTime = player.audioPlayer?.currentTime else { return }
        seekBar.value = Float(currentTime / duration)
    }

    // MARK: - Background Audio Support
    @objc private func handleAppDidEnterBackground() {
        showSnackbar()
    }

    @objc private func handleAppWillEnterForeground() {
        hideSnackbar()
    }

    private func showSnackbar() {
        snackbar = SnackbarView(frame: CGRect(x: 0, y: view.bounds.height - 60, width: view.bounds.width, height: 60))
        snackbar?.onPauseTapped = { [weak self] in
            self?.player.pause()
            self?.isPlaying = false
        }
        snackbar?.onStopTapped = { [weak self] in
            self?.player.stop()
            self?.isPlaying = false
        }
        view.addSubview(snackbar!)
    }

    private func hideSnackbar() {
        snackbar?.removeFromSuperview()
    }
}
