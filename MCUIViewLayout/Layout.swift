    //
//  Layout.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-17.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Foundation


protocol Coordinates: class {
    var top: CGFloat { get set }
    var left: CGFloat { get set }
    var width: CGFloat { get set }
    var height: CGFloat { get set }
    
    var topLeft: CGPoint { get set }
    var topCenter: CGPoint { get set }
    var topRight: CGPoint { get set }
    
    var centerRight: CGPoint { get set }
    var center: CGPoint { get set }
    var centerLeft: CGPoint { get set }
    
    var bottomLeft: CGPoint { get set }
    var bottomCenter: CGPoint { get set }
    var bottomRight: CGPoint { get set }
}

extension Coordinates {
    var topLeft: CGPoint {
        get { return CGPoint(x: left, y: top) }
        set {
            left = newValue.x
            top = newValue.y
        }
    }

    var topCenter: CGPoint {
        get { return CGPoint(x: hCenter, y: top) }
        set {
            left = newValue.x - (width / 2)
            top = newValue.y
        }
    }
    
    var topRight: CGPoint {
        get { return CGPoint(x: left + width, y: top) }
        set {
            left = newValue.x - width
            top = newValue.y
        }
    }
    
    var centerRight: CGPoint {
        get { return CGPoint(x: left + width, y: vCenter) }
        set {
            left = newValue.x - width
            top = newValue.y - (width / 2)
        }
    }

    var center: CGPoint {
        get { return CGPoint(x: hCenter, y: vCenter) }
        set {
            left = newValue.x - (width / 2)
            top = newValue.y - (width / 2)
        }
    }
    
    var centerLeft: CGPoint {
        get { return CGPoint(x: left, y: vCenter) }
        set {
            left = newValue.x
            top = newValue.y - (width / 2)
        }
    }

    var bottomLeft: CGPoint {
        get { return CGPoint(x: left, y: top + height) }
        set {
            left = newValue.x
            top = newValue.y - height
        }
    }
    
    var bottomCenter: CGPoint {
        get { return CGPoint(x: hCenter, y: top + height) }
        set {
            left = newValue.x - (width / 2)
            top = newValue.y - height
        }
    }
    
    var bottomRight: CGPoint {
        get { return CGPoint(x: left + width, y: top + height) }
        set {
            left = newValue.x - width
            top = newValue.y - height
        }
    }

    
    var hCenter: CGFloat {
        return left + (width / 2)
    }
    
    var vCenter: CGFloat {
        return top + (height / 2)
    }
}

extension UIView: Coordinates {
    var top: CGFloat {
        get { return frame.origin.y }
        set { frame = CGRect(x: left, y: roundFloatToDisplayScale(newValue), width: width, height: height) }
    }
        
    var left: CGFloat {
        get { return frame.origin.x }
        set { frame = CGRect(x: roundFloatToDisplayScale(newValue), y:top, width: width, height: height) }
    }
    
    var width: CGFloat {
        get { return frame.size.width }
        set { frame = CGRect(x: left, y: top, width: ceilFloatToDisplayScale(newValue), height: height) }
    }
    
    var height: CGFloat {
        get { return frame.size.height }
        set { frame = CGRect(x: left, y: top, width: width, height: ceilFloatToDisplayScale(newValue)) }
    }
    
    var size: CGSize {
        get { return CGSize(width: width, height: height) }
        set { frame = CGRect(x: left, y: top, width: ceilFloatToDisplayScale(newValue.width), height: ceilFloatToDisplayScale(newValue.height)) }
    }
}


//    var x: CGFloat {
//        set {
//            frame = CGRect(x: roundFloatToDisplayScale(newValue), y: y, width: width, height: height)
//        }
//        get {
//            return frame.origin.x
//        }
//    }
//    
//    var y: CGFloat {
//        set {
//            frame = CGRect(x: x, y: roundFloatToDisplayScale(newValue), width: width, height: height)
//        }
//        get {
//            return frame.origin.y
//        }
//    }
//    var left: CGFloat
//    var width: CGFloat
//    var height: CGFloat
    
    // POSITION
    /*var topLeft: CGPoint {
        get { return CGPoint(x: left, y: top) }
        set {
            setTopCenter(point: newValue)
        }
    }*/
    
//    var topCenter: CGPoint {
//        get { return CGPoint(x: left + (width / 2), y: top) }
//        set {
//            left = newValue.x - (width / 2)
//            top = newValue.y
//        }
//    }
//    
//    var topRight: CGPoint {
//        get { return CGPoint(x: left + (width / 2), y: top) }
//        set {
//            left = newValue.x - (width / 2)
//            top = newValue.y
//        }
//    }
//}

//func setTopCenter(point: CGPoint, inout left: CGFloat, top: CGFloat) {
//    left = point.x - (width / 2)
//    top = point.y
//    
//}

extension UIView {
    var layout2: Layout2 {
        return Layout2(view: self)
    }
    
    func layout(_ positionning: Layout2) {
//        positionning.apply(onView: self)
    }
    
    //    var resize: ViewResize {
    //        return ViewResizeImpl(view: self)
    //    }
}


class Layout2 {
    fileprivate let view: UIView?
    
    // Positionning info
//    fileprivate var parentRelativePosition: MCViewPosition?
    
//    var top: CGFloat {
//        get { return frame.origin.y }
//        set { frame = CGRect(x: x, y: roundFloatToDisplayScale(newValue), width: width, height: height) }
//    }
//    
//    var left: CGFloat {
//        get { return frame.origin.y }
//        set { frame = CGRect(x: roundFloatToDisplayScale(newValue), y: y, width: width, height: height) }
//    }
//    
//    var width: CGFloat {
//        get { return frame.size.width }
//        set { frame = CGRect(x: x, y: y, width: ceilFloatToDisplayScale(newValue), height: height) }
//    }
//    
//    var height: CGFloat {
//        get { return frame.height }
//        set { frame = CGRect(x: x, y: y, width: width, height: ceilFloatToDisplayScale(newValue)) }
//    }
    
    var top: CGFloat?
    var left: CGFloat?
    var bottom: CGFloat?
    var right: CGFloat?
    
    var hCenter: CGFloat?
    var vCenter: CGFloat?
    
    var width: CGFloat?
    var height: CGFloat?
    
    var topMargin: CGFloat?
    var leftMargin: CGFloat?
    var bottomMargin: CGFloat?
    var rightMargin: CGFloat?
    
    var topPadding: CGFloat?
    var leftPadding: CGFloat?
    var bottomPadding: CGFloat?
    var rightPadding: CGFloat?
    
    init (view: UIView? = nil) {
        self.view = view
    }
    
    deinit {
        apply()
    }
    
    //
    // top, left, bottom, right, topLeft, topCenter, topRight, ...
    //
    @discardableResult
    func top(_ newValue: CGFloat) -> Layout2 {
        setTopCoordinate(newValue)
        return self
    }
    
    @discardableResult
    func left(_ newValue: CGFloat) -> Layout2 {
        setLeftCoordinate(newValue)
        return self
    }
    
    @discardableResult
    func bottom(_ newValue: CGFloat) -> Layout2 {
        setBottomCoordinate(newValue)
        return self
    }
    
    @discardableResult
    func right(_ newValue: CGFloat) -> Layout2 {
        setRightCoordinate(newValue)
        return self
    }
    
    @discardableResult
    func topLeft(_ point: CGPoint) -> Layout2 {
        setTopCoordinate(point.y)
        setLeftCoordinate(point.x)
        return self
    }
    
    @discardableResult
    func topCenter(_ point: CGPoint) -> Layout2 {
        setTopCoordinate(point.y)
        setHorizontalCenter(point.x)
        return self
    }
    
    @discardableResult
    func topRight(_ point: CGPoint) -> Layout2 {
        setTopCoordinate(point.y)
        setRightCoordinate(point.x)
        return self
    }
    
    @discardableResult
    func centerLeft(_ point: CGPoint) -> Layout2 {
        setLeftCoordinate(point.x)
        setVerticalCenter(point.y)
        return self
    }
    
    @discardableResult
    func bottomLeft(_ point: CGPoint) -> Layout2 {
        bottomLeft(point.x, point.y)
        return self
    }
    
    @discardableResult
    func bottomLeft(_ bottom: CGFloat, _ left: CGFloat) -> Layout2 {
        setLeftCoordinate(left)
        setBottomCoordinate(bottom)
        return self
    }
    
    @discardableResult
    func bottomRight(_ point: CGPoint) -> Layout2 {
        bottomRight(point.x, point.y)
        return self
    }
    
    @discardableResult
    func bottomRight(_ bottom: CGFloat, _ right: CGFloat) -> Layout2 {
        setRightCoordinate(right)
        setBottomCoordinate(bottom)
        return self
    }
    
    //
    // width, height
    //
    @discardableResult
    func width(_ newWidth: CGFloat) -> Layout2 {
        guard newWidth >= 0 else {
            warn("The specified width (\(newWidth)) must be greater or equal to 0"); return self
        }
        
        if left != nil && right != nil {
            warnConflict("width", ["left": left!, "right": right!])
        } else {
            width = newWidth
        }
        
        return self
    }
    
    @discardableResult
    func height(_ newHeight: CGFloat) -> Layout2 {
        guard newHeight >= 0 else {
            warn("The specified height (\(newHeight)) must be greater or equal to 0"); return self
        }
        
        if top != nil && bottom != nil {
            warnConflict("height", ["top": top!, "bottom": bottom!])
        } else {
            height = newHeight
        }
        
        return self
    }
    
    //
    // Margins
    //
    @discardableResult
    func margins(_ newValue: CGFloat) -> Layout2 {
        topMargin(newValue)
        leftMargin(newValue)
        bottomMargin(newValue)
        rightMargin(newValue)
        return self
    }
    
    @discardableResult
    func topMargin(_ newValue: CGFloat) -> Layout2 {
//        if top != nil && bottom != nil {
//            warnConflict("topMargin", ["top": top!, "bottom": bottom!])
//        } else if top != nil && height != nil {
//            warnConflict("topMargin", ["top": top!, "height": height!])
//        } else if bottom != nil && height != nil {
//            warnConflict("topMargin", ["bottom": bottom!, "height": height!])
//        } else {
            topMargin = newValue
//        }
        
        return self
    }
    
    @discardableResult
    func leftMargin(_ newValue: CGFloat) -> Layout2 {
        leftMargin = newValue
        return self
    }
    
    @discardableResult
    func bottomMargin(_ newValue: CGFloat) -> Layout2 {
//        if top != nil && bottom != nil {
//            warnConflict("bottomMargin", ["top": top!, "bottom": bottom!])
//        } else if top != nil && height != nil {
//            warnConflict("bottomMargin", ["top": top!, "height": height!])
//        } else if bottom != nil && height != nil {
//            warnConflict("bottomMargin", ["bottom": bottom!, "height": height!])
//        } else {
            bottomMargin = newValue
//        }
        
        return self
    }
    
    @discardableResult
    func rightMargin(_ newValue: CGFloat) -> Layout2 {
        rightMargin = newValue
        return self
    }
    
    //
    // Paddings
    //
    @discardableResult
    func paddings(_ newValue: CGFloat) -> Layout2 {
        topPadding(newValue)
        leftPadding(newValue)
        bottomPadding(newValue)
        rightPadding(newValue)
    
        return self
    }
    
    @discardableResult
    func topPadding(_ newValue: CGFloat) -> Layout2 {
        topPadding = newValue
        return self
    }
    
    @discardableResult
    func leftPadding(_ newValue: CGFloat) -> Layout2 {
        leftPadding = newValue
        return self
    }
    
    @discardableResult
    func bottomPadding(_ newValue: CGFloat) -> Layout2 {
        bottomPadding = newValue
        return self
    }
    
    @discardableResult
    func rightPadding(_ newValue: CGFloat) -> Layout2 {
        rightPadding = newValue
        return self
    }

    fileprivate func setTopCoordinate(_ newValue: CGFloat) {
        if bottom != nil && height != nil {
            warnConflict("top", ["bottom": bottom!, "height": height!])
        } else if vCenter != nil {
            warnConflict("top", ["Vertical Center": vCenter!])
        } else {
            top = newValue
        }
    }

    fileprivate func setLeftCoordinate(_ newValue: CGFloat) {
        if right != nil && width != nil  {
            warnConflict("left", ["right": right!, "width": width!])
        } else if hCenter != nil {
            warnConflict("left", ["Horizontal Center": hCenter!])
        } else {
            left = newValue
        }
    }
    
    fileprivate func setRightCoordinate(_ newValue: CGFloat) {
        if left != nil && width != nil  {
            warnConflict("right", ["left": left!, "width": width!])
        } else if hCenter != nil {
            warnConflict("right", ["Horizontal Center": hCenter!])
        } else {
            right = newValue
        }
    }
    
    fileprivate func setBottomCoordinate(_ newValue: CGFloat) {
        if top != nil && height != nil {
            warnConflict("bottom", ["top": top!, "height": height!])
        } else if vCenter != nil {
            warnConflict("bottom", ["Vertical Center": vCenter!])
        } else {
            bottom = newValue
        }
    }
    
    fileprivate func setHorizontalCenter(_ newValue: CGFloat) {
        if left != nil {
            warnConflict("Horizontal Center", ["left": left!])
        } else if right != nil {
            warnConflict("Horizontal Center", ["right": right!])
        } else {
            hCenter = newValue
        }
    }
    
    fileprivate func setVerticalCenter(_ newValue: CGFloat) {
        if top != nil {
            warnConflict("Vertical Center", ["top": top!])
        } else if bottom != nil {
            warnConflict("Vertical Center", ["bottom": bottom!])
        } else {
            vCenter = newValue
        }
    }
    
    fileprivate func apply() {
        guard let view = view else { return }
        apply(onView: view)
    }
    
    func apply(onView view: UIView) {
        assert(width == nil || (right == nil || left == nil))
        assert(height == nil || (top == nil || bottom == nil))
        assert(hCenter == nil || (left == nil && right == nil))
        assert(vCenter == nil || (top == nil && bottom == nil))
        
        var newRect = view.frame
        
        var isVerticalPositionApplied = false
        var isHorizontalPositionApplied = false
        
        var isRightApplied = false
        
        var isTopMarginApplied = false  // needed?
        var isLeftMarginApplied = false  // needed?
        var isBottomMarginApplied = false  // needed?
        var isRightMarginApplied = false  // needed?
        
        //
        // Compute vertical position
        //
        
        if let top = top {
            if bottom == nil && height == nil {
                // bottom and Height aren't set => adjust the origin
                newRect.origin.y = top + (topMargin ?? 0)
            } else if bottom != nil {
                // bottom is set => adjust the origin and the height
                newRect.origin.y = top + (topMargin ?? 0) + (topPadding ?? 0)
                newRect.size.height = bottom! - newRect.origin.y - (bottomMargin ?? 0) - (bottomPadding ?? 0)
            } else if height != nil {
                // height is set => adjust the origin and the height
                newRect.origin.y = top + (topMargin ?? 0) + (topPadding ?? 0)
                newRect.size.height = applyPaddingToHeight(height!)
            }
            
            isVerticalPositionApplied = true
            isTopMarginApplied = true
            isBottomMarginApplied = true
        }
        
        if !isVerticalPositionApplied, let bottom = bottom {
            if top == nil && height == nil {
                // top and Height aren't set => Move the view and keeps the current height
                newRect.origin.y = bottom - newRect.height - (bottomMargin ?? 0)
            } else if top != nil {
                // nop, case already handled in the "top" case above
                assert(false)
            } else if height != nil {
                // height is set => adjust the top and the height
                newRect.origin.y = bottom - height! + (topMargin ?? 0) + (topPadding ?? 0)
                newRect.size.height = applyPaddingToHeight(height!)
            }
            
            isVerticalPositionApplied = true
            isTopMarginApplied = true
            isBottomMarginApplied = true
        }
        
        if !isVerticalPositionApplied, let vCenter = vCenter {
            if height == nil {
                newRect.origin.y = vCenter - (newRect.size.height / 2)
            } else {
                // height is set => adjust the top and the height
                newRect.size.height = applyPaddingToHeight(height!)
                newRect.origin.y = vCenter - (newRect.size.height / 2) + (topMargin ?? 0)
            }
            
            isVerticalPositionApplied = true
        }
        
        if !isVerticalPositionApplied, let height = height {
            newRect.size.height = height
        }
        
        //
        // Compute horizontal position
        //

        if let left = left {
            if right == nil && width == nil {
                // right and width aren't set => adjust the origin
                newRect.origin.x = left + (leftMargin ?? 0)
            } else if right != nil {
                // right is set => adjust the origin and the width
                newRect.origin.x = left + (leftMargin ?? 0) + (leftPadding ?? 0)
                newRect.size.width = right! - newRect.origin.x - (rightMargin ?? 0) - (rightPadding ?? 0)
            } else if width != nil {
                // width is set => adjust the origin and the height
                newRect.origin.x = left + (leftMargin ?? 0) + (leftPadding ?? 0)
                newRect.size.width = applyPaddingToWidth(width!)
            }
            
            isRightApplied = true
            isHorizontalPositionApplied = true
            isLeftMarginApplied = true
            isRightMarginApplied = true
        }
        
        if !isRightApplied, let right = right {
            if left == nil && width == nil {
                // left and width aren't set => Move the view and keeps the current width
                newRect.origin.x = right - newRect.width - (rightMargin ?? 0)
            } else if left != nil {
                // nop, case already handled in the "left" case above
                assert(false)
            } else if width != nil {
                // width is set => adjust the origin
                newRect.origin.x = right - width! + (rightMargin ?? 0) + (rightPadding ?? 0)
                newRect.size.width = applyPaddingToWidth(width!)
            }
            
            isRightApplied = true
            isHorizontalPositionApplied = true
            isLeftMarginApplied = true
            isRightMarginApplied = true
        }
        
        if !isHorizontalPositionApplied, let hCenter = hCenter {
            if width == nil {
                newRect.origin.x = hCenter - (newRect.size.width / 2)
            } else {
                // width is set => adjust the right and the width
                newRect.size.width = applyPaddingToWidth(width!)
                newRect.origin.x = hCenter - (newRect.size.width / 2) + (leftMargin ?? 0)
            }

            isHorizontalPositionApplied = true
        }
        
        if !isHorizontalPositionApplied, let width = width {
            newRect.size.width = width
        }
        
        view.frame = newRect
    }
    
    fileprivate func applyPaddingToHeight(_ height: CGFloat) -> CGFloat {
        return height - (topPadding ?? 0) - (bottomPadding ?? 0)
    }
    
    fileprivate func applyPaddingToWidth(_ width: CGFloat) -> CGFloat {
        return width - (leftPadding ?? 0) - (rightPadding ?? 0)
    }
    
    fileprivate func warn(_ text: String) {
        print("\n\(text)\n")
    }
    
    fileprivate func warnConflict(_ name: String, _ properties: [String: CGFloat]) {
        var warning = "\nLayout2 Conflict: The '\(name)' property won't be set since it conflicts with:\n"
        properties.forEach { (key, value) in
            warning += " \(key): \(value)\n"
        }
        
        print(warning)
    }
}
