//
//  Layout2View.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-17.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

protocol Layout2ViewDelegate: class {

}

class Layout2View: UIView {
    weak var delegate: Layout2ViewDelegate?
     
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        
    }
}
