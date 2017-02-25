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

protocol FlexboxView: class {
    //var marginTop: CGFloat { get set }
//    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection,
//                             justifyContent: YGJustify, closure: (_ flexboxView: FlexboxView) -> Void)
//    func addFlexboxItem(_ view: UIView, closure: (_ flexboxView: UIView) -> Void)
}

extension FlexboxView where Self: UIView {
    var fb: YGLayout {
        return self.yoga
    }
    
    func configureAsFlexboxContainer(flexDirection: YGFlexDirection = .column,
                                     justifyContent: YGJustify = .flexStart, closure: (_ flexboxView: UIView) -> Void) {
        fb.isEnabled = true
        fb.flexContainer(flexDirection: flexDirection, justifyContent: justifyContent)
        closure(self)
    }
    
    func configureAsFlexboxContainer(flexDirection: YGFlexDirection = .column,
                                     justifyContent: YGJustify = .flexStart) {
        fb.isEnabled = true
        fb.flexContainer(flexDirection: flexDirection, justifyContent: justifyContent)
    }
    
    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                             justifyContent: YGJustify = .flexStart, closure: (_ flexboxView: UIView) -> Void) {
        addSubview(containerView)
        containerView.configureAsFlexboxContainer(flexDirection: flexDirection, justifyContent: justifyContent, closure: closure)
    }
    
    func addFlexboxContainer(_ containerView: UIView, flexDirection: YGFlexDirection = .column,
                             justifyContent: YGJustify = .flexStart) {
        addSubview(containerView)
        containerView.configureAsFlexboxContainer(flexDirection: flexDirection, justifyContent: justifyContent)
    }
    
    func addFlexboxItem(_ view: UIView, closure: (_ flexboxView: UIView) -> Void) {
        view.fb.isEnabled = true
        addSubview(view)
        closure(view)
    }
    
    func addFlexboxItem(_ view: UIView) {
        view.fb.isEnabled = true
        addSubview(view)
    }
}

extension UIView: FlexboxView {
    var fb: YGLayout {
        return self.yoga
    }
//    var marginTop: CGFloat {
//        get {
//            return self.fb.marginTop
//        }
//        set {
//            self.fb.marginTop = newValue
//        }
//    }
}

class YogoTestView: UIView {
    fileprivate let rowFlexboxView = UIView(frame: .zero)
    fileprivate let redView = UIView(frame: .zero)
    fileprivate let disappearingView = UIView(frame: .zero)
    fileprivate let button = UIButton(type: .system)
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        rowFlexboxView.backgroundColor = .clear
        redView.backgroundColor = .red
        disappearingView.backgroundColor = .blue
        
        button.setTitle("Add Blue View", for: UIControlState.selected)
        button.setTitle("Remove Blue View", for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: UIControlEvents.touchUpInside)
        
        self.configureAsFlexboxContainer(flexDirection: .column) { (flexbox) in
            flexbox.fb.marginTop = 64
            
            flexbox.addFlexboxContainer(rowFlexboxView, flexDirection: .row, justifyContent: .center) { (flexbox) in
                flexbox.fb.height = 300
                flexbox.fb.padding = 12
                
                flexbox.addFlexboxItem(disappearingView) { (flexbox) in
                    flexbox.fb.flex(flexGrow: 1)
                }
                
                flexbox.addFlexboxItem(redView) { (flexbox) in
                    flexbox.fb.flexGrow = 1
                    flexbox.fb.flexShrink = 1
                }
            }
            
            flexbox.addFlexboxItem(button) { (flexbox) in
                flexbox.fb.width(300).height(300).align(.center)
            }
        }
        
        // OR
//        self.configureAsFlexboxContainer(flexDirection: .column)
//        self.fb.marginTop = 64
//        
//        self.addFlexboxContainer(rowFlexboxView, flexDirection: .row, justifyContent: .center)
//        rowFlexboxView.fb.height = 300
//        rowFlexboxView.fb.padding = 12
//        
//        rowFlexboxView.addFlexboxItem(redView)
//        redView.fb.flex(flexGrow: 1, flexShrink: 1)
//        
//        rowFlexboxView.addFlexboxItem(disappearingView)
//        disappearingView.fb.flex(flexGrow: 1)
//            
//        self.addFlexboxItem(button)
//        button.fb.width(300).height(300).align(.center)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rowFlexboxView.fb.width = width
        
        fb.applyLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        
    }
    
    func buttonWasTapped() {
        button.isSelected = !button.isSelected
        
        disappearingView.fb.isIncludedInLayout = !disappearingView.fb.isIncludedInLayout
        disappearingView.isHidden = !disappearingView.isHidden
        
        rowFlexboxView.fb.applyLayout()
    }
}
