//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Tayfur Salih Şen on 29.01.2023.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }

}
