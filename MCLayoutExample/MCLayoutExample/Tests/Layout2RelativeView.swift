//
//  Layout2RelativeView.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-22.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit


class Layout2RelativeView: UIView {
    private let centerView = UIView()
    
    private let topLeftView = UIView()
    private let topCenterView = UIView()
    private let topRightView = UIView()
    
    private let leftTopView = UIView()
    private let leftCenterView = UIView()
    private let leftBottomView = UIView()
    
    private let bottomLeftView = UIView()
    private let bottomCenterView = UIView()
    private let bottomRightView = UIView()
    
    private let rightTopView = UIView()
    private let rightCenterView = UIView()
    private let rightBottomView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        centerView.backgroundColor = .blue
        addSubview(centerView)
        
        addSquare(topLeftView, color: .green)
        addSquare(topCenterView, color: .yellow)
        addSquare(topRightView, color: .purple)
        
        addSquare(leftTopView, color: .magenta)
        addSquare(leftCenterView, color: .cyan)
        addSquare(leftBottomView, color: .purple)
        
        addSquare(bottomLeftView, color: .black)
        addSquare(bottomCenterView, color: .red)
        addSquare(bottomRightView, color: .gray)
        
        addSquare(rightTopView, color: .black)
        addSquare(rightCenterView, color: .red)
        addSquare(rightBottomView, color: .gray)
    }
    
    fileprivate func addSquare(_ view: UIView, color: UIColor) {
        view.backgroundColor = color
        view.width = 50
        view.height = 50
        addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        centerView.width = 200
        centerView.height = 200
        centerView.center = CGPoint(x: 200, y: 300)
        
        topLeftView.layout2.above(of: centerView, aligned: .left)
        topCenterView.layout2.above(of: centerView, aligned: .center)
        topRightView.layout2.above(of: centerView, aligned: .right)
        
        leftTopView.layout2.left(of: centerView, aligned: .top)
        leftCenterView.layout2.left(of: centerView, aligned: .center)
        leftBottomView.layout2.left(of: centerView, aligned: .bottom)
        
        bottomLeftView.layout2.below(of: centerView, aligned: .left)
        bottomCenterView.layout2.below(of: centerView, aligned: .center)
        bottomRightView.layout2.below(of: centerView, aligned: .right)
        
        rightTopView.layout2.right(of: centerView, aligned: .top)
        rightCenterView.layout2.right(of: centerView, aligned: .center)
        rightBottomView.layout2.right(of: centerView, aligned: .bottom)
    }
}

