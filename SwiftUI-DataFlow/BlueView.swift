//
//  BlueView.swift
//  SwiftUI-DataFlow
//
//  Created by Davido Hyer on 8/9/21.
//

import UIKit

class BlueView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func generateData() -> String {
        "generated data"
    }
}
