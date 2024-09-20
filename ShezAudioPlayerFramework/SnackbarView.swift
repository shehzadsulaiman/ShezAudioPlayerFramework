//
//  SnackbarView.swift
//  ShezAudioPlayerFramework
//
//  Created by Shehzad sulaiman on 20/09/2024.
//

import UIKit

public class SnackbarView: UIView {

    private var pauseButton: UIButton!
    private var stopButton: UIButton!

    public var onPauseTapped: (() -> Void)?
    public var onStopTapped: (() -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .darkGray

        pauseButton = UIButton(type: .system)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.frame = CGRect(x: 20, y: 10, width: 100, height: 40)
        pauseButton.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        addSubview(pauseButton)

        stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.frame = CGRect(x: 140, y: 10, width: 100, height: 40)
        stopButton.addTarget(self, action: #selector(stopTapped), for: .touchUpInside)
        addSubview(stopButton)
    }

    @objc private func pauseTapped() {
        onPauseTapped?()
    }

    @objc private func stopTapped() {
        onStopTapped?()
    }
}
