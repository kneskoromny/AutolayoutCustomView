//
//  Challenge.swift
//  CustomViewChallenge
//
//  Created by Jonathan Rasmusson Work Pro on 2019-10-17.
//  Copyright © 2019 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class Challenge: UIViewController {

    let margin: CGFloat = 20
    let spacing: CGFloat = 32

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() {
        navigationItem.title = "Playback"
    }

    /*
     
     Challenge here is to take the various controls and practice extracting components as subViews (UIViews).

     Two good candidates for extraction are the:

      - RowView (label and a switch)
      - CrossfadeView (label, progressbar, and max min label)
     
     ┌───────────────┐        ┌───────────────┐
     │               │        │               │
     │               ├────────▶    RowView    │ x4
     │               │        │               │
     │               │        └───────────────┘
     │   Challenge   │ extract
     │               │
     │               │        ┌───────────────┐
     │               │        │               │
     │               ├────────▶ CrossfadeView │ x1
     │               │        │               │
     └───────────────┘        └───────────────┘
     
     See if you can extract those into their own custom UIViews and then lay those out.
     
     */
    func setupViews() {
        let offlineRow = RowView(title: "Offline", isOn: false)
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossfadeView = CrossfadeView()

        let gaplessPLaybackRow = RowView(title: "Gapless Playback", isOn: true)
        let hideSongsRow = RowView(title: "Hide Unplayable Songs", isOn: true)
        let enableNormalizationRow = RowView(title: "Enable Audio Normalization", isOn: true)
        
        offlineRow.translatesAutoresizingMaskIntoConstraints = false
        crossfadeView.translatesAutoresizingMaskIntoConstraints = false
        gaplessPLaybackRow.translatesAutoresizingMaskIntoConstraints = false
        hideSongsRow.translatesAutoresizingMaskIntoConstraints = false
        enableNormalizationRow.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(offlineRow)
        view.addSubview(offlineSublabel)
        view.addSubview(crossfadeView)
        view.addSubview(gaplessPLaybackRow)
        view.addSubview(hideSongsRow)
        view.addSubview(enableNormalizationRow)
        
        offlineRow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        offlineRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        offlineRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true

        offlineSublabel.topAnchor.constraint(equalTo: offlineRow.bottomAnchor, constant: margin).isActive = true
        offlineSublabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        offlineSublabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true

        crossfadeView.topAnchor.constraint(equalTo: offlineSublabel.bottomAnchor, constant: spacing).isActive = true
        crossfadeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        crossfadeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true

        gaplessPLaybackRow.topAnchor.constraint(equalTo: crossfadeView.bottomAnchor, constant: spacing).isActive = true
        gaplessPLaybackRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        gaplessPLaybackRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true

        hideSongsRow.topAnchor.constraint(equalTo: gaplessPLaybackRow.bottomAnchor, constant: spacing).isActive = true
        hideSongsRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        hideSongsRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true

        enableNormalizationRow.topAnchor.constraint(equalTo: hideSongsRow.bottomAnchor, constant: spacing).isActive = true
        enableNormalizationRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        enableNormalizationRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
    }
}


