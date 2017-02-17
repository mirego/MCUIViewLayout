//
//  YogoTestView.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-16.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import YogaKit

extension YGLayout {
    @discardableResult
    func flexContainer(flexDirection: YGFlexDirection = .column, justifyContent: YGJustify = .flexStart) -> YGLayout {
        isEnabled = true
        self.flexDirection = flexDirection
        self.justifyContent = justifyContent
        return self
    }
    
    @discardableResult
    func flex(flexGrow: CGFloat = 0, flexShrink: CGFloat = 0) -> YGLayout {
        isEnabled = true
        self.flexGrow = 1
        self.flexShrink = 1
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> YGLayout {
        self.height = height
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> YGLayout {
        self.width = width
        return self
    }
    
    @discardableResult
    func align(_ align: YGAlign) -> YGLayout {
        self.alignSelf = align
        return self
    }
}

extension UIView {
    var yg: YGLayout {
        return self.yoga
    }
    
    func setupFlexContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                    justifyContent: YGJustify = .flexStart, closure: () -> Void) {
        containerView.yg.isEnabled = true
        containerView.yg.flexContainer(flexDirection: flexDirection, justifyContent: justifyContent)
        closure()
    }

    func addFlexChild(_ child: UIView, closure: () -> Void) {
        child.yg.isEnabled = true
        addSubview(child)
        closure()
    }
    
    func addFlexContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                          justifyContent: YGJustify = .flexStart, closure: () -> Void) {
        addSubview(containerView)
        setupFlexContainer(containerView, flexDirection: flexDirection, justifyContent: justifyContent, closure: closure)
    }
}

class YogoTestView: UIView {
    fileprivate let rowFlexBoxView = UIView(frame: .zero)
    fileprivate let redView = UIView(frame: .zero)
    fileprivate let button = UIButton(type: .system)
    fileprivate let disappearingView = UIView(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        setupFlexContainer(self, flexDirection: .column) {
            self.yg.marginTop = 64
            
            addFlexContainer(rowFlexBoxView, flexDirection: .row, justifyContent: .center) {
                rowFlexBoxView.backgroundColor = .clear
                rowFlexBoxView.yg.height = 300
                rowFlexBoxView.yg.paddingHorizontal = 25
                
                rowFlexBoxView.addFlexChild(redView) {
                    redView.backgroundColor = .red
                    redView.yg.flex(flexGrow: 1, flexShrink: 1)
                }
                
                rowFlexBoxView.addFlexChild(disappearingView) {
                    disappearingView.backgroundColor = .blue
                    disappearingView.yg.flex(flexGrow: 1)
                    rowFlexBoxView.addSubview(disappearingView)
                }
            }
            
            addFlexChild(button) { 
                button.yg.width(300).height(300).align(.center)
                
                button.setTitle("Add Blue View", for: UIControlState.selected)
                button.setTitle("Remove Blue View", for: UIControlState.normal)
                button.addTarget(self, action: #selector(buttonWasTapped), for: UIControlEvents.touchUpInside)
            }
        }
        
        // OR 
        /*
        yg.container(flexDirection: .column, justifyContent: .spaceAround)
        yg.marginTop = 64
        
        contentView.backgroundColor = .clear
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.yg.container(flexDirection: .row, justifyContent: .center).height(300)
        contentView.yg.paddingHorizontal = 25
        addSubview(contentView)
        
        redView.backgroundColor = .red
        redView.yg.flex(flexGrow: 1, flexShrink: 1)
        contentView.addSubview(redView)
        
        disappearingView.backgroundColor = .blue
        disappearingView.yg.flex(flexGrow: 1)
        contentView.addSubview(disappearingView)
        
        button.yg.width(300).height(300).align(.center)
        
        button.setTitle("Add Blue View", for: UIControlState.selected)
        button.setTitle("Remove Blue View", for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: UIControlEvents.touchUpInside)
        addSubview(button)
        */
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rowFlexBoxView.yg.width = width
        
        yg.applyLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonWasTapped() {
        button.isSelected = !button.isSelected
        
        button.isUserInteractionEnabled = false
        disappearingView.yg.isIncludedInLayout = !disappearingView.yg.isIncludedInLayout
        disappearingView.isHidden = !disappearingView.isHidden
        
        rowFlexBoxView.yg.applyLayout()
        button.isUserInteractionEnabled = true
    }
}
