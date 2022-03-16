//
//  RowView.swift
//  CustomViewChallenge
//
//  Created by Кирилл Нескоромный on 16.03.2022.
//  Copyright © 2022 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class RowView: UIView {
    
    var title: String
    var isOn: Bool

    init(title: String, isOn: Bool) {
        self.title = title
        self.isOn = isOn
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let label = makeLabel(withText: title)
        let onOffSwitch = makeSwitch(isOn: isOn)
        
        addSubview(label)
        addSubview(onOffSwitch)
        
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        onOffSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
    }
    // минимальный размер: switch height = 31
        override var intrinsicContentSize: CGSize {
            return CGSize(width: 200, height: 31)
        }
}
