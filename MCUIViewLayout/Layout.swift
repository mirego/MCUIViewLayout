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


class Layout2: Coordinates {
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
    
    var top: CGFloat = 0
    var left: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    var topMargin: CGFloat = 0
    var leftMargin: CGFloat = 0
    var bottomMargin: CGFloat = 0
    var rightMarging: CGFloat = 0
    
//    var size: CGSize {
//        get {
//            return CGSize(width: width, height: height)
//        }
//        set {
//            width = newValue.width
//            height = newValue.height
//        }
//    }

    init (view: UIView?) {
        self.view = view
    }
    
    func topCenter(_ point: CGPoint) -> Layout2 {
        topCenter = point
        return self
    }
    
//    var topRight: Layout {
//        parentRelativePosition = .positionTopRight
//        return self
//    }
//    
//    var centerLeft: Layout {
//        parentRelativePosition = .positionVCenterLeft
//        return self
//    }
//    
//    var center: Layout {
//        parentRelativePosition = .positionCenters
//        return self
//    }
//    
//    var rightVCenter: Layout {
//        parentRelativePosition = .positionVCenterRight
//        return self
//    }
//    
//    var bottomLeft: Layout {
//        parentRelativePosition = .positionBottomLeft
//        return self
//    }
    
//    var bottomHCenter: Layout {
//        parentRelativePosition = .positionBottomHCenter
//        return self
//    }
//    
//    var bottomRight: Layout {
//        parentRelativePosition = .positionBottomRight
//        return self
//    }
    
    fileprivate func apply() {
        guard let view = view else { return }
        apply(onView: view)
    }
    
    func apply(onView view: UIView) {
        
        view.frame = CGRect(x: left, y: top, width: width, height: height)
//        let newSize = computeSize(forView: onView)
//        
//        if let relativePosition = relativePosition, let relativeToView = relativeToView {
//            assert(parentRelativePosition == nil)
//            onView.setRelativePosition2(relativePosition, toView: relativeToView, margins: margins, size: newSize)
//        } else {
//            let position = parentRelativePosition ?? .positionTopLeft
//            onView.setPosition2(position, margins: margins, size: newSize)
//        }
    }
    
//    fileprivate func initMargins() {
//        if margins == nil {
//            margins = UIEdgeInsets()
//        }
//    }
//    
//    fileprivate func computeSize(forView: UIView) -> CGSize? {
//        var newSize: CGSize?
//        
//        if let sizeType = sizeType {
//            assert(size.width == .greatestFiniteMagnitude, "Conflict! The width() and the sizeType couldn't be both specified")
//            assert(size.height == .greatestFiniteMagnitude, "Conflict! The height() and the sizeType couldn't be both specified")
//            newSize = sizeType.getSize(forView: forView)
//        } else if size.width != .greatestFiniteMagnitude || size.height != .greatestFiniteMagnitude {
//            newSize = CGSize(width: size.width != .greatestFiniteMagnitude ? size.width : forView.width, height: size.height != .greatestFiniteMagnitude ? size.height : forView.height)
//        }
//        
//        return newSize
//    }
}
