//
//  CrossfadeView.swift
//  CustomViewChallenge
//
//  Created by Кирилл Нескоромный on 16.03.2022.
//  Copyright © 2022 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class CrossfadeView: UIView {

    let margin: CGFloat = 20
    let spacing: CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
        let crossfadeMinLabel = makeSubLabel(withText: "0s")
        let crossfadeMaxLabel = makeSubLabel(withText: "12s")
        let crossfadeProgressView = makeProgressView()
        
        addSubview(crossfadeLabel)
        addSubview(crossfadeMinLabel)
        addSubview(crossfadeMaxLabel)
        addSubview(crossfadeProgressView)
        
        crossfadeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        crossfadeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing).isActive = true
        crossfadeMinLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor).isActive = true
        crossfadeProgressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor, constant: 4).isActive = true
        crossfadeProgressView.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor, constant: -4).isActive = true

        crossfadeMaxLabel.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor).isActive = true
        crossfadeMaxLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 100)
    }
}
