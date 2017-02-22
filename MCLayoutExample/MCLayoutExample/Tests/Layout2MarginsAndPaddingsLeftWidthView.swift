//
//  Layout2MarginsAndPaddingsLeftWidthView.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-21.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class Layout2MarginsAndPaddingsLeftWidthView: UIView {
    private let contentScrollView = UIScrollView()
    
    private let descriptionLabel = UILabel()
    
    private let noMarginsNoPaddings = BasicView(text: "70x30", color: .black)
    
    private let noMarginsLeftPaddingView = BasicView(text: "LP", color: UIColor.red.withAlphaComponent(1.0))
    private let noMarginsRightPaddingView = BasicView(text: "RP", color: UIColor.red.withAlphaComponent(0.8))
    private let noMarginsLeftRightPaddingView = BasicView(text: "LP-RP", color: UIColor.red.withAlphaComponent(0.6))
    
    private let leftMarginView = BasicView(text: "LM", color: UIColor.blue.withAlphaComponent(1.0))
    private let leftMarginLeftPaddingView = BasicView(text: "LM LP", color: UIColor.blue.withAlphaComponent(0.8))
    private let leftMarginRightPaddingView = BasicView(text: "LM RP", color: UIColor.blue.withAlphaComponent(0.6))
    private let leftMarginLeftRightPaddingView = BasicView(text: "LM LP-RP", color: UIColor.blue.withAlphaComponent(0.4))
    
    private let rigthMarginView = BasicView(text: "RM", color: UIColor.green.withAlphaComponent(1))
    private let rigthMarginLeftPaddingView = BasicView(text: "RM LP", color: UIColor.green.withAlphaComponent(0.8))
    private let rigthMarginRightPaddingView = BasicView(text: "RM RP", color: UIColor.green.withAlphaComponent(0.6))
    private let rigthMarginLeftRightPaddingView = BasicView(text: "RM LP-RP", color: UIColor.green.withAlphaComponent(0.4))
    
    private let leftRightMarginsView = BasicView(text: "LM-RM", color: UIColor.purple.withAlphaComponent(1))
    private let leftRightMarginsLeftPaddingView = BasicView(text: "LM-RM LP", color: UIColor.purple.withAlphaComponent(0.8))
    private let leftRightMarginsRightPaddingView = BasicView(text: "LM-RM RP", color: UIColor.purple.withAlphaComponent(0.6))
    private let leftRightMarginsLeftRightPaddingView = BasicView(text: "LM-RM LP-RP", color: UIColor.purple.withAlphaComponent(0.4))
    
//    private let noMarginsNoPaddings2 = BasicView(text: "70x30", color: UIColor.black)
//    private let topMarginView = BasicView(text: "TM", color: UIColor.orange.withAlphaComponent(1))
//    private let topMarginTopPaddingView = BasicView(text: "TM TP", color: UIColor.orange.withAlphaComponent(0.8))
//    private let topMarginBottomPaddingView = BasicView(text: "TM BP", color: UIColor.orange.withAlphaComponent(0.6))
//    private let topMarginTopBottomPaddingView = BasicView(text: "TM TP-BP", color: UIColor.orange.withAlphaComponent(0.4))
    
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white

        contentScrollView.backgroundColor = .yellow
        addSubview(contentScrollView)
        
        descriptionLabel.text = "In this test the topLeft coordinates and width have been set.\nMargins and Paddings always have a value of 10\nL=left, R=right, M=margin, P=padding"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        contentScrollView.addSubview(descriptionLabel)

        addView(noMarginsNoPaddings)
        
        // No margins
        addView(noMarginsLeftPaddingView)
        addView(noMarginsRightPaddingView)
        addView(noMarginsLeftRightPaddingView)

        // Left margin
        addView(leftMarginView)
        addView(leftMarginLeftPaddingView)
        addView(leftMarginRightPaddingView)
        addView(leftMarginLeftRightPaddingView)

        // Right margin
        addView(rigthMarginView)
        addView(rigthMarginLeftPaddingView)
        addView(rigthMarginRightPaddingView)
        addView(rigthMarginLeftRightPaddingView)
        
        // Left and right margins
        addView(leftRightMarginsView)
        addView(leftRightMarginsLeftPaddingView)
        addView(leftRightMarginsRightPaddingView)
        addView(leftRightMarginsLeftRightPaddingView)

        // Top margin
//        addView(noMarginsNoPaddings2)
//        addView(topMarginView)
//        addView(topMarginTopPaddingView)
//        addView(topMarginBottomPaddingView)
//        addView(topMarginTopBottomPaddingView)
        
        // Bottom margin
        
        // Top and Bottom margin
    }
    
    fileprivate func addView(_ view: BasicView) {
        view.layout2.height(30).width(70)
        contentScrollView.addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let leftPosition: CGFloat = 0
        
        contentScrollView.layout2.topLeft(CGPoint(x: 0, y: 0)).width(width).height(height).topPadding(64)
        
        descriptionLabel.size = descriptionLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        descriptionLabel.layout2.topLeft(CGPoint(x: leftPosition, y: 10))
        
        // No margins
        noMarginsNoPaddings.layout2.topLeft(descriptionLabel.bottomLeft).topMargin(5)
        noMarginsLeftPaddingView.layout2.top(noMarginsNoPaddings.bottom).left(leftPosition).width(70).leftPadding(10)
        noMarginsRightPaddingView.layout2.top(noMarginsLeftPaddingView.bottom).left(leftPosition).width(70).rightPadding(10)
        noMarginsLeftRightPaddingView.layout2.top(noMarginsRightPaddingView.bottom).left(leftPosition).width(70).leftPadding(10).rightPadding(10)
        
        // Left margin
        leftMarginView.layout2.top(noMarginsLeftRightPaddingView.bottom + 5).left(leftPosition).width(70).leftMargin(10)
        leftMarginLeftPaddingView.layout2.top(leftMarginView.bottom).left(leftPosition).width(70).leftMargin(10).leftPadding(10)
        leftMarginRightPaddingView.layout2.top(leftMarginLeftPaddingView.bottom).left(leftPosition).width(70).leftMargin(10).rightPadding(10)
        leftMarginLeftRightPaddingView.layout2.top(leftMarginRightPaddingView.bottom).left(leftPosition).width(70).leftMargin(10).leftPadding(10).rightPadding(10)
        
        // Right margin
        rigthMarginView.layout2.top(leftMarginLeftRightPaddingView.bottom + 5).left(leftPosition).width(70).rightMargin(10)
        rigthMarginLeftPaddingView.layout2.top(rigthMarginView.bottom).left(leftPosition).width(70).rightMargin(10).leftPadding(10)
        rigthMarginRightPaddingView.layout2.top(rigthMarginLeftPaddingView.bottom).left(leftPosition).width(70).rightMargin(10).rightPadding(10)
        rigthMarginLeftRightPaddingView.layout2.top(rigthMarginRightPaddingView.bottom).left(leftPosition).width(70).rightMargin(10).leftPadding(10).rightPadding(10)
        
        // Left and right margins
        leftRightMarginsView.layout2.top(rigthMarginLeftRightPaddingView.bottom + 5).left(leftPosition).width(70).leftMargin(10).rightMargin(10)
        leftRightMarginsLeftPaddingView.layout2.top(leftRightMarginsView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).leftPadding(10)
        leftRightMarginsRightPaddingView.layout2.top(leftRightMarginsLeftPaddingView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).rightPadding(10)
        leftRightMarginsLeftRightPaddingView.layout2.top(leftRightMarginsRightPaddingView.bottom).left(leftPosition).width(70).leftMargin(10).rightMargin(10).leftPadding(10).rightPadding(10)
        
        // Top Margin
//        noMarginsNoPaddings2.layout2.top(leftRightMarginsLeftRightPaddingView.bottom + 5).left(leftPosition).width(70).height(30)
//        topMarginView.layout2.top(noMarginsNoPaddings2.top).left(noMarginsNoPaddings2.right).width(70).height(30).topMargin(10)
//        topMarginTopPaddingView.layout2.top(topMarginView.top).left(topMarginView.right).width(70).height(30).topMargin(10).topPadding(10)
//        topMarginBottomPaddingView.layout2.top(topMarginView.top).left(topMarginTopPaddingView.right).width(70).height(30).topMargin(10).bottomPadding(10)
//        topMarginTopBottomPaddingView.layout2.top(topMarginView.top).left(topMarginBottomPaddingView.right).width(70).height(30).topMargin(10).topPadding(10).bottomPadding(10)
        
        contentScrollView.contentSize = CGSize(width: width, height: leftRightMarginsLeftRightPaddingView.bottom)
        contentScrollView.contentInset = UIEdgeInsets.zero
    }
}
