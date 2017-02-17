// Copyright (c) 2016, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit

/**
 Swift wrapper for MCUIViewLayout
 
 Features:
    * Simplified syntax compare to objective-c (remove all “mc_()”)
    * Add/Expose many UIView's properties:
         - top/left/bottom/right  (CGFloat)  [get/set]
         - x/y/width/height       (CGFloat)  [get/set]
         - size                   (CGSize)   [get/set]
         - origin                 (CGPoint)  [get/set]
         - minX/maxY/minY/maxY    (CGFloat)  [get/set]

        Examples:
            myChild.size = view.size
            myChild.width = view.width

    * Expose two methods to position UIView easily: setPosition() and setRelativePosition()
 */
// swiftlint:disable variable_name

let displayScale = UIScreen.main.scale

func roundFloatToDisplayScale(_ pointValue: CGFloat) -> CGFloat {
    return (round(pointValue * displayScale) / displayScale)
}

func ceilFloatToDisplayScale(_ pointValue: CGFloat) -> CGFloat {
    return (round(pointValue * displayScale) / displayScale)
}

internal var logConflictsAndWarnings = true

func logConflictsAndWarnings(_ log: Bool) {
    logConflictsAndWarnings = log
}

func warnings(_ text: String) {
    if logConflictsAndWarnings {
        print("WARNING: " + text)
    }
}

func conflict(_ text: String) {
    if logConflictsAndWarnings {
        print("CONFLICT: " + text)
    }
}


extension UIView {
    var x: CGFloat {
        set {
            frame = CGRect(x: roundFloatToDisplayScale(newValue), y: y, width: width, height: height)
        }
        get {
            return frame.origin.x
        }
    }

    var y: CGFloat {
        set {
            frame = CGRect(x: x, y: roundFloatToDisplayScale(newValue), width: width, height: height)
        }
        get {
            return frame.origin.y
        }
    }

//    var width: CGFloat {
//        set {
//            frame = CGRect(x: x, y: y, width: ceilFloatToDisplayScale(newValue), height: height)
//        }
//        get {
//            return frame.width
//        }
//    }
//
//    var height: CGFloat {
//        set {
//            frame = CGRect(x: x, y: y, width: width, height: ceilFloatToDisplayScale(newValue))
//        }
//        get {
//            return frame.height
//        }
//    }

//    var left: CGFloat {
//        set {
//            x = newValue
//        }
//        get {
//            return x
//        }
//    }
//
//    var top: CGFloat {
//        set {
//            y = newValue
//        }
//        get {
//            return y
//        }
//    }

    var right: CGFloat {
        set {
            width = newValue - x
        }
        get {
            return frame.maxX
        }
    }

    var bottom: CGFloat {
        set {
            height = newValue - y
        }
        get {
            return frame.maxY
        }
    }

//    var size: CGSize {
//        set {
//            frame = CGRect(x: x, y: y, width: ceilFloatToDisplayScale(newValue.width), height: ceilFloatToDisplayScale(newValue.height))
//        }
//        get {
//            return bounds.size
//        }
//    }

    var origin: CGPoint {
        set {
            frame = CGRect(x: roundFloatToDisplayScale(newValue.x), y: roundFloatToDisplayScale(newValue.y), width: width, height: height)
        }

        get {
            return frame.origin
        }
    }

    var midX: CGFloat {
        set {
            center = CGPoint(x: roundFloatToDisplayScale(newValue), y: midY)
        }
        get {
            return frame.midX
        }
    }

    var midY: CGFloat {
        set {
            center = CGPoint(x: midX, y: roundFloatToDisplayScale(newValue))
        }
        get {
            return frame.midY
        }
    }

    /**
     Position the view

     - parameter position: see MCViewPosition
     - parameter inView:   Optional relative view. Default value is view's superview.
     - parameter margins:  Optional margins.
     - parameter size:     Optional view new size. By default keeps the current view size.
     - parameter fitSize:  Optional size to fit. If specified the view sizeThatFits() method will be called using the specified size and the result
     will be use to set the view size.

     Examples:
     myChild.setPosition(.PositionTopHCenter)
     myChild.setPosition(.PositionTopHCenter, size: CGSize(width: 200, height: 40))
     myChild.setPosition(.PositionTopLeft, size: CGSize(width: width / 2, height: height / 2))
     myChild.setPosition(.PositionTopLeft, fitSize: CGSize(width: width, height: .max))
     */
    enum FitSizeType {
        case width(width: CGFloat)
        case height(height: CGFloat)
        case size(size: CGSize)
        case sizeWH(width: CGFloat, height: CGFloat)

        func getSize() -> CGSize
        {
            switch self {
            case .width(let width):
                return CGSize(width: width, height: .greatestFiniteMagnitude)
            case .height(let height):
                return CGSize(width: .greatestFiniteMagnitude, height: height)
            case .size(let size):
                return size
            case .sizeWH(let width, let height):
                return CGSize(width: width, height: height)
            }
        }
    }

    enum SizeType {
        // Size
        case size(size: CGSize)
        case sizeWH(width: CGFloat, height: CGFloat)
        case width(width: CGFloat)
        case height(height: CGFloat)
        case rect(sideLength: CGFloat)

        // Fit size (call view's sizeThatFits() method to compute the size)
        case fitWidth(width: CGFloat)
        case fitHeight(height: CGFloat)
        case fitSize(size: CGSize)
        case fitSizeWH(width: CGFloat, height: CGFloat)

        case fitViewSize(view: UIView)
        case fitViewWidth(view: UIView)
        case fitViewHeight(view: UIView)


        func getSize(forView view: UIView) -> CGSize {
            switch self {
            case .size(let size):
                return size
            case .sizeWH(let width, let height):
                return CGSize(width: width, height: height)
            case .width(let width):
                return CGSize(width: width, height: view.height)
            case .height(let height):
                return CGSize(width: view.width, height: height)
            case .rect(let sideLength):
                return CGSize(width: sideLength, height: sideLength)

            case .fitWidth(let width):
                return view.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            case .fitHeight(let height):
                return view.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: height))
            case .fitSize(let size):
                return view.sizeThatFits(size)
            case .fitSizeWH(let width, let height):
                return view.sizeThatFits(CGSize(width: width, height: height))

            case .fitViewSize(let otherView):
                return view.sizeThatFits(otherView.size)
            case .fitViewWidth(let otherView):
                return view.sizeThatFits(CGSize(width: otherView.width, height: .greatestFiniteMagnitude))
            case .fitViewHeight(let otherView):
                return view.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: otherView.height))
            }
        }
    }

    func setPosition2(_ position: MCViewPosition, inView: UIView? = nil, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil, newSize: SizeType? = nil) {
        let inView = inView ?? superview
        let margins = margins ?? UIEdgeInsets.zero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        if let newSize = newSize {
            size = newSize.getSize(forView: self)
        }

        mc_setPosition(position, in:inView, withMargins: margins, size: size ?? frame.size)
    }

    /**
     Position the view relative to another view.

     - parameter position: see MCViewPosition
     - parameter toView:   The view from which the view will be relatively positioned.
     - parameter margins:  Optional margins.
     - parameter size:     Optional view new size. By default keeps the current view size.
     - parameter fitSize:  Optional size to fit. If specified the view sizeThatFits() method will be called using the specified and the result
     will be use to set the view size.

     Examples:
     myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView)
     myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, size: CGSize(width: 200, height: 40))
     myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, margins: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
     myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, fitSize: CGSize(width: width, height: .max))
     */
    func setRelativePosition2(_ position: MCViewPosition, toView: UIView?, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil) {
        let margins = margins ?? UIEdgeInsets.zero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        mc_setRelativePosition(position, to:toView, withMargins: margins, size: size ?? frame.size)
    }
}

extension UIView {
    var layout: Layout {
        return Layout(view: self)
    }

    func layout(_ positionning: Layout) {
        positionning.apply(onView: self)
    }

//    var resize: ViewResize {
//        return ViewResizeImpl(view: self)
//    }
}


/*protocol ViewResize {
    init(view: UIView?)

    func size(size: CGSize) -> ViewResize
    func matchSize(view: UIView) -> ViewResize

    func width(width: CGFloat) -> ViewResize
    func widthMatch(view: UIView) -> ViewResize
    func widthSpaceBetween(view view: UIView, andView: UIView) -> ViewResize

    func height(height: CGFloat) -> ViewResize
    func heightMatch(view: UIView) -> ViewResize
    func heightSpaceBetween(view view: UIView, andView: UIView) -> ViewResize

    func sizeThatFitsWidth(width: CGFloat) -> ViewResize
    func sizeThatFitsHeight(height: CGFloat) -> ViewResize
    func sizeThatFits(size: CGSize) -> ViewResize
    func sizeThatFitsViewSize(view: UIView) -> ViewResize
    func sizeThatFitsViewWidth(view: UIView) -> ViewResize
    func sizeThatFitsViewHeight(view: UIView) -> ViewResize

    func apply(onView onView: UIView)
}*/


/*protocol ViewPositionning {
    init(view: UIView?)

    // TOP
    var topLeft: ViewPositionning {get}
    var topHCenter: ViewPositionning {get}
    var topRight: ViewPositionning {get}

    // CENTER
    var leftVCenter: ViewPositionning {get}
    var center: ViewPositionning {get}
    var rightVCenter: ViewPositionning {get}

    // BOTTOM
    var bottomLeft: ViewPositionning {get}
    var bottomHCenter: ViewPositionning {get}
    var bottomRight: ViewPositionning {get}

    //func top(top: CGFloat) -> ViewPositionning  // Needed? Equivalent to topMargin OR minY
//    func top(of view: UIView) -> ViewPositionning
//    func left(of view: UIView) -> ViewPositionning
//    func bottom(of view: UIView) -> ViewPositionning
//    func right(of view: UIView) -> ViewPositionning

    func leftEqualTo(CGFloat)
    func rightEqualTo()
    func topEqualTo()
    func bottomEqualTo()

    // RELATIVE POSITION
    func aboveLeftAligned(of view: UIView) -> ViewPositionning
    func aboveCenterAligned(of view: UIView) -> ViewPositionning
    func aboveRightAligned(of view: UIView) -> ViewPositionning
    func leftTopAligned(of view: UIView) -> ViewPositionning
    func leftCenterAligned(of view: UIView) -> ViewPositionning
    func leftBottomAligned(of view: UIView) -> ViewPositionning
    func rightTopAligned(of view: UIView) -> ViewPositionning
    func rightCenterAligned(of view: UIView) -> ViewPositionning
    func rightBottomAligned(of view: UIView) -> ViewPositionning
    func underLeftAligned(of view: UIView) -> ViewPositionning
    func underCenterAligned(of view: UIView) -> ViewPositionning
    func underRightAligned(of view: UIView) -> ViewPositionning

    //func fitBetween(view: UIView, andView: UIView, )

    //func betweenVertically(of view: UIView, and: UIView)
    //func betweenHorizontally(of view: UIView, and: UIView)

    // MARGINS
    func margins(margins: UIEdgeInsets) -> ViewPositionning
    func margins(margins: CGFloat) -> ViewPositionning
    // Argh, Default argument not permitted in a protocol method!
    // func margins(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> ViewPositionning
    func topMargin(top: CGFloat) -> ViewPositionning
    func leftMargin(left: CGFloat) -> ViewPositionning
    func bottomMargin(bottom: CGFloat) -> ViewPositionning
    func rightMargin(right: CGFloat) -> ViewPositionning

    // WIDTH / HEIGHT / SIZETHATFITS
    func size(size: CGSize) -> ViewPositionning
    func matchSize(view: UIView) -> ViewPositionning

    func width(width: CGFloat) -> ViewPositionning
    func widthMatch(view: UIView) -> ViewPositionning
    func widthSpaceBetween(view view: UIView, andView: UIView) -> ViewPositionning

    func height(height: CGFloat) -> ViewPositionning
    func heightMatch(view: UIView) -> ViewPositionning
    func heightSpaceBetween(view view: UIView, andView: UIView) -> ViewPositionning

    func sizeThatFitsWidth(width: CGFloat) -> ViewPositionning
    func sizeThatFitsHeight(height: CGFloat) -> ViewPositionning
    func sizeThatFits(size: CGSize) -> ViewPositionning
    func sizeThatFitsViewSize(view: UIView) -> ViewPositionning
    func sizeThatFitsViewWidth(view: UIView) -> ViewPositionning
    func sizeThatFitsViewHeight(view: UIView) -> ViewPositionning
    func apply(onView onView: UIView)
}*/



/*class ViewResizeImpl {
    private let view: UIView?
    private var sizeType: UIView.SizeType?
    private var size = CGSize(width: CGFloat.max, height: CGFloat.max)
    private var applyOnDeinit = true

    required init (view: UIView?) {
        self.view = view
    }

    convenience init(view: UIView?, applyOnDeinit: Bool) {
        self.init(view: view)
        self.applyOnDeinit = applyOnDeinit
    }

    deinit
    {
        if applyOnDeinit {
            apply()
        }
    }

    func size(size: CGSize) -> ViewResize {
        self.size = size
        return self
    }

    func matchSize(view: UIView) -> ViewResize {
        self.size = view.size
        return self
    }

    func width(width: CGFloat) -> ViewResize {
        size.width = width
        return self
    }

    func widthMatch(view: UIView) -> ViewResize {
        size.width = view.width
        return self
    }

    func widthSpaceBetween(view view: UIView, andView: UIView) -> ViewResize {
        if view.right <= andView.left {
            // first view is on the left of the second view
            size.width = andView.left - view.right
        } else if view.right > andView.right {
            // first view is on the right of the second view
            size.width = view.left - andView.right
        } else {
            warnings("widthSpaceBetween(view:andView:): The horizontal space between specified are smaller than 0")
        }

        return self
    }

    func height(height: CGFloat) -> ViewResize {
        size.height = height
        return self
    }

    func heightMatch(view: UIView) -> ViewResize {
        size.height = view.height
        return self
    }

    func heightSpaceBetween(view view: UIView, andView: UIView) -> ViewResize{
        if view.bottom <= andView.top {
            // first view is above the second view
            size.height = andView.top - view.bottom
        } else if view.top > andView.bottom {
            // first view is below the second view
            size.width = view.top - andView.bottom
        } else {
            warnings("widthSpaceBetween(view:andView:): The horizontal space between specified are smaller than 0")
        }

        return self
    }

    func sizeThatFitsWidth(width: CGFloat) -> ViewResize {
        self.sizeType = UIView.SizeType.FitWidth(width: width)
        return self
    }

    func sizeThatFitsHeight(height: CGFloat) -> ViewResize {
        self.sizeType = UIView.SizeType.FitHeight(height: height)
        return self
    }

    func sizeThatFits(size: CGSize) -> ViewResize {
        self.sizeType = UIView.SizeType.FitSize(size: size)
        return self
    }

    func sizeThatFitsViewSize(view: UIView) -> ViewResize {
        self.sizeType = UIView.SizeType.FitViewSize(view: view)
        return self
    }

    func sizeThatFitsViewWidth(view: UIView) -> ViewResize {
        self.sizeType = UIView.SizeType.FitViewWidth(view: view)
        return self
    }

    func sizeThatFitsViewHeight(view: UIView) -> ViewResize {
        self.sizeType = UIView.SizeType.FitViewHeight(view: view)
        return self
    }

    private func apply() {
        guard let view = view else { return }
        apply(onView: view)
    }

    func apply(onView onView: UIView) {
        if let size = computeSize(forView: onView) {
            onView.size = size
        }
    }

    private func computeSize(forView forView: UIView) -> CGSize? {
        var newSize: CGSize?

        if let sizeType = sizeType {
            assert(size.width == .max, "Conflict! The width() and the sizeType couldn't be both specified")
            assert(size.height == .max, "Conflict! The height() and the sizeType couldn't be both specified")
            newSize = sizeType.getSize(forView: forView)
        } else if size.width != .max || size.height != .max {
            newSize = CGSize(width: size.width != .max ? size.width : forView.width, height: size.height != .max ? size.height : forView.height)
        }

        return newSize
    }
}*/



/*
      Under view1 and left to view2 with top margin of 10, left margin of 20 and width of 100

     TODO: Update graphic
                 +-------+
                 |       |
                 |   1   |
                 |       |
                 +-------+

     +-------+   +-------+
     |       |   |       |
     |   2   |   |   X   |
     |       |   |       |
     +-------+   +-------+


     NEW:   view.layout.topEqual(view1.bottom + 10).leftEqual(view2.right + 20).width(100)
     NEW2:  view.layout.top(view1.bottom + 10).left(view2.right + 20).width(100)
     NEW3:  view.layout.top(view1.bottom).left(view2.right).topMargin(10).leftMargin(20).width(100)
     BEFORE view.SetPosition(.PositionTopLeft, margins: .margins(top: view1.bottom + 10, left: view2.right + 2), size: CGSize(width: 100, height: view.height))
     MANUAL view.frame = CGRect(x: view2.right + 20, y: view1.top + 10, width: 100, height: view.heigh)
     */

    /*
     +-------+
     |       |
     |   1   |
     |       |
     +-------+
          |
         10
          |
     +---------+
     |         |
     |    X    |
     | w:100   |
     +---------+
 
 
     Under left aligned to view1 with top margin of 10 and a size of 100
     NEW:    view.layout.topEqual(view1.bottom + 10).leftEqual(view1.left).width(100)       2/5
     NEW2:   view.layout.top(view1.bottom + 10).left(view1.left).width(100)                 3/5
     NEW3:   view.layout.underLeftAligned(toView: view1).topMargin(10).width(100)           4/5
     NEW3:   view.layout.topLeft(view1.bottomLeft).topMargin(10).width(100)                 3/5
     NEW4:   view.layout.topLeft(view1.bottomLeft).offset(x: 0, y: 10).width(100)
     BEFORE  view.setRelativePosition(.RelativePositionUnderAlignedLeft, toView: view1, margins: .top(10), size: CGSize(width: 100, height: view.height)
     BEFORE2 view.setRelativePosition(.RelativePositionUnderAlignedLeft, toView: view1, margins: .top(10), size: .Width(100))
     MANUAL  view.frame = CGRect(x: view1.left, y: view1.bottom + 10, width: 100, height: view.height)

    */

    /*
     Under center aligned to view1 with top margin of 10 and a size of 100
    
     +-------------+
     |             |
     |      1      |
     |             |
     +-------------+

        +-------+
        |       |
        |   X   |
        |       |
        +-------+

     NEW2:   view.layout.topCenter(view1.bottomCenter + 10).width(100)                      2/5
     NEW3:   view.layout.underCenterAligned(toView: view1).topMargin(10).width(100)         4/5
     NEW3:   view.layout.topCenter(view1.bottomCenter).topMargin(10).width(100)             3/5
     NEW4:   view.layout.topCenter(view1.bottomCenter).offset(x: 0, y: 10).width(100)       3/5
     BEFORE  view.setRelativePosition(.RelativePositionUnderAlignedCenter, toView: view1, margins: .top(10), size: CGSize(width: 100, height: view.height)
     BEFORE2 view.setRelativePosition(.RelativePositionUnderAlignedCenter, toView: view1, margins: .top(10), size: .Width(100))
     BEFORE2 view.setRelativePosition(.underAlignedCenter, toView: view1, margins: .top(10), size: .Width(100))
     MANUAL  view.frame = CGRect(x: view1.center, y: view1.bottom + 10, width: 100, height: view.height
    */

    /*
                  +-------+
                  |       |
                  |   1   |
                  |       |
                  +-------+
                      10
     +-------+    +--------+
     |       |    |        |
     |   2   |-10-|   X    |
     |       |    | w:100  |
     +-------+    +--------+

    NEW:   view.layout.left(view2.right + 10).top(view1.bottom + 10).width(view1.width).height(view2.height)
    NEW:   view.layout.left(view2.right).top(view1.bottom).padding(10).width(view1.width).height(view2.height)
    NEW:   view.layout.topLeft(top: view2.right, left: view1.bottom).padding(10).width(view1.width).height(view2.height)
    NEW:   view.layout.topLeft(top: view2.right, left: view1.bottom).padding(10).size(w: view1.width, h: view2.height))
 
 NEW2:   view.layout.left(view2.right).leftPadding(10).top(view1.bottom).topPadding(10).width(view1.width).height(view2.height)
 NEW2:   view.layout.topLeft(view2.topRight).leftPadding(10).topLeft(view1.bottomLeft).topPadding(10).width(view1.width).height(view2.height)
    BEFORE  view.setPosition(.positionTopLeft, margins: UIEdgeInsets(top: view1.maxY + 10, left: view2.maxX + 10, bottom: 0, right: 0), size: CGSize(width: 100, height: view.height)
 
 
     */

    // Under view1 and right of view2


//ViewPositionningImpl devrait simplement implémente les deux protocols et UIView.resize retourne un ViewResize et UIView.layout retourne un ViewPositionning (qui dérive du protocol ViewResize. Faire une copie avant ce changement !!!!!!

class Layout {
    fileprivate let view: UIView?

    // Positionning info
    fileprivate var parentRelativePosition: MCViewPosition?
    fileprivate var relativePosition: MCViewPosition?
    fileprivate var relativeToView: UIView?

    fileprivate var top = CGFloat.greatestFiniteMagnitude
    fileprivate var left = CGFloat.greatestFiniteMagnitude
    fileprivate var width = CGFloat.greatestFiniteMagnitude
    fileprivate var height = CGFloat.greatestFiniteMagnitude

    // Size info
    fileprivate var sizeType: UIView.SizeType?

//    private var rect = CGRect
//    private var size = CGSize(width: CGFloat.max, height: CGFloat.max)


//    private var topOf: UIView?
//    private var leftOf: UIView?
//    private var bottomOf: UIView?
//    private var rightOf: UIView?
    fileprivate var margins: UIEdgeInsets?

//    private var viewResize: ViewResizeImpl

//    private var sizeType: UIView.SizeType?
//    private var size = CGSize(width: CGFloat.max, height: CGFloat.max)
    var size: CGSize {
        get {
            return CGSize(width: width, height: height)
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }

    init (view: UIView?) {
        self.view = view
        //viewResize = ViewResizeImpl(view: view, applyOnDeinit: false)
    }

    // Copy
    fileprivate convenience init(view: UIView?, parentRelativePosition: MCViewPosition, margins: UIEdgeInsets?) {
        self.init(view: view)
        self.parentRelativePosition = parentRelativePosition
        self.margins = margins

        // TODO!!!!!: Implement copy constructor for ViewResize
//        self.viewResize = viewResize

        // TOD: Add relativePosition and relativeToView
    }

    convenience init () {
        self.init(view: nil)
    }

    /*func copy() -> Layout {
        return Layout(view: view, position: position, margins:  margins, sizeType: sizeType)
    }*/

    deinit
    {
        apply()
    }

    // POSITION
    var topLeft: Layout {
        parentRelativePosition = MCViewPosition.positionTopLeft
        return self
    }

    var topHCenter: Layout {
        parentRelativePosition = MCViewPosition.positionTopHCenter
        return self
    }

    var topRight: Layout {
        parentRelativePosition = .positionTopRight
        return self
    }

    var leftVCenter: Layout {
        parentRelativePosition = .positionVCenterLeft
        return self
    }

    var center: Layout {
        parentRelativePosition = .positionCenters
        return self
    }

    var rightVCenter: Layout {
        parentRelativePosition = .positionVCenterRight
        return self
    }

    var bottomLeft: Layout {
        parentRelativePosition = .positionBottomLeft
        return self
    }

    var bottomHCenter: Layout {
        parentRelativePosition = .positionBottomHCenter
        return self
    }

    var bottomRight: Layout {
        parentRelativePosition = .positionBottomRight
        return self
    }

    func matchView(_ view: UIView) {
        top = view.top
        left = view.left
        size = view.size
    }

    // RELATIVE POSITION
    func aboveLeftAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionAboveAlignedLeft
        relativeToView = view
        return self
    }

    func aboveCenterAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionAboveCentered
        relativeToView = view
        return self
    }

    func aboveRightAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionAboveAlignedRight
        relativeToView = view
        return self
    }

    func leftTopAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheLeftAlignedTop
        relativeToView = view
        return self
    }

    func leftCenterAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheLeftCentered
        relativeToView = view
        return self
    }

    func leftBottomAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheLeftAlignedBottom
        relativeToView = view
        return self
    }

    func rightTopAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheRightAlignedTop
        relativeToView = view
        return self
    }

    func rightCenterAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheRightCentered
        relativeToView = view
        return self
    }

    func rightBottomAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionToTheRightAlignedBottom
        relativeToView = view
        return self
    }

    func underLeftAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionUnderAlignedLeft
        relativeToView = view
        return self
    }

    func underCenterAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionUnderCentered
        relativeToView = view
        return self
    }

    func underRightAligned(of view: UIView) -> Layout {
        relativePosition = MCViewPosition.relativePositionUnderAlignedRight
        relativeToView = view
        return self
    }

    /*func top(of view: UIView) -> Layout {
        topOf = view
        return self
    }

    func left(of view: UIView) -> Layout {
        leftOf = view
        return self
    }

    func bottom(of view: UIView) -> Layout {
        bottomOf = view
        return self
    }

    func right(of view: UIView) -> Layout {
        rightOf = view
        return self
    }*/


    // MARGINS
    func margins(_ margins: UIEdgeInsets) -> Layout {
        self.margins = margins
        return self
    }

    func margins(_ margins: CGFloat) -> Layout {
        self.margins = .margins(margins)
        return self
    }

    /*func margins(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> Layout {
        self.margins = UIEdgeInsets(top: top ?? 0, left: left ?? 0, bottom: bottom ?? 0, right: right ?? 0)
        return self
    }*/

    func topMargin(_ top: CGFloat) -> Layout {
        initMargins()
        margins!.top = top
        return self
    }

    func leftMargin(_ left: CGFloat) -> Layout {
        initMargins()
        margins!.left = left
        return self
    }

    func bottomMargin(_ bottom: CGFloat) -> Layout {
        initMargins()
        margins!.bottom = bottom
        return self
    }

    func rightMargin(_ right: CGFloat) -> Layout {
        initMargins()
        margins!.right = right
        return self
    }



    //
    // WIDTH / HEIGHT / SIZETHATFITS
    //

    @discardableResult
    func size(_ size: CGSize) -> Layout {
        self.size = size
        return self
    }

    @discardableResult
    func matchSize(_ view: UIView) -> Layout {
        self.size = view.size
        return self
    }

    @discardableResult
    func width(_ width: CGFloat) -> Layout {
        size.width = width
        return self
    }

    @discardableResult
    func widthMatch(_ view: UIView) -> Layout {
        size.width = view.width
        return self
    }

    @discardableResult
    func widthSpaceBetween(view: UIView, andView: UIView) -> Layout {
        if view.right <= andView.left {
            // first view is on the left of the second view
            size.width = andView.left - view.right
        } else if view.right > andView.right {
            // first view is on the right of the second view
            size.width = view.left - andView.right
        } else {
            warnings("widthSpaceBetween(view:andView:): The horizontal space between specified are smaller than 0")
        }

        return self
    }

    @discardableResult
    func height(_ height: CGFloat) -> Layout {
        size.height = height
        return self
    }

    @discardableResult
    func heightMatch(_ view: UIView) -> Layout {
        size.height = view.height
        return self
    }

    @discardableResult
    func heightSpaceBetween(view: UIView, andView: UIView) -> Layout {
        if view.bottom <= andView.top {
            // first view is above the second view
            size.height = andView.top - view.bottom
        } else if view.top > andView.bottom {
            // first view is below the second view
            size.width = view.top - andView.bottom
        } else {
            warnings("widthSpaceBetween(view:andView:): The horizontal space between specified are smaller than 0")
        }

        return self
    }

    @discardableResult
    func sizeThatFitsWidth(_ width: CGFloat) -> Layout {
        self.sizeType = UIView.SizeType.fitWidth(width: width)
        return self
    }

    @discardableResult
    func sizeThatFitsHeight(_ height: CGFloat) -> Layout {
        self.sizeType = UIView.SizeType.fitHeight(height: height)
        return self
    }

    @discardableResult
    func sizeThatFits(_ size: CGSize) -> Layout {
        self.sizeType = UIView.SizeType.fitSize(size: size)
        return self
    }

    @discardableResult
    func sizeThatFitsViewSize(_ view: UIView) -> Layout {
        self.sizeType = UIView.SizeType.fitViewSize(view: view)
        return self
    }

    @discardableResult
    func sizeThatFitsViewWidth(_ view: UIView) -> Layout {
        self.sizeType = UIView.SizeType.fitViewWidth(view: view)
        return self
    }

    @discardableResult
    func sizeThatFitsViewHeight(_ view: UIView) -> Layout {
        self.sizeType = UIView.SizeType.fitViewHeight(view: view)
        return self
    }

    fileprivate func apply() {
        guard let view = view else { return }
        apply(onView: view)
    }

    func apply(onView: UIView) {
        let newSize = computeSize(forView: onView)

        if let relativePosition = relativePosition, let relativeToView = relativeToView {
            assert(parentRelativePosition == nil)
            onView.setRelativePosition2(relativePosition, toView: relativeToView, margins: margins, size: newSize)
        } else {
            let position = parentRelativePosition ?? .positionTopLeft
            onView.setPosition2(position, margins: margins, size: newSize)
        }
    }

    fileprivate func initMargins() {
        if margins == nil {
            margins = UIEdgeInsets()
        }
    }

    fileprivate func computeSize(forView: UIView) -> CGSize? {
        var newSize: CGSize?

        if let sizeType = sizeType {
            assert(size.width == .greatestFiniteMagnitude, "Conflict! The width() and the sizeType couldn't be both specified")
            assert(size.height == .greatestFiniteMagnitude, "Conflict! The height() and the sizeType couldn't be both specified")
            newSize = sizeType.getSize(forView: forView)
        } else if size.width != .greatestFiniteMagnitude || size.height != .greatestFiniteMagnitude {
            newSize = CGSize(width: size.width != .greatestFiniteMagnitude ? size.width : forView.width, height: size.height != .greatestFiniteMagnitude ? size.height : forView.height)
        }

        return newSize
    }
}



func test() {
    let view = UIView()
    let secondView = UIView()
    let thirdView = UIView()

    //view.layout.width(20).apply()

    // view.setPosition(.layoutTopHCenter, margins: .top(positionY), fitSize: CGSize(width: oneLineElementWidth, height: .max))

    view.layout.topHCenter.topMargin(10).width(200)

    //view.layout.right.equalTo(secondView).top.equalTo(thirdView.maxY)
//    view.layout.wi

    // Hugo wish:
    // - Layout C in the center of the A and B views.

    // Philosopy
    /*
     - KISS
     - Less is better
     - Compact syntax: easier to read and understand
     - Most view size & position adjustement is a one liner
     - Simple positionning,
     - Simply update the UIView.frame property, nothing more, no magic, no contrains :-)
     - Can always use UIView.frame to adjust the position
     - Integrates gracefully with UIView animations methods (UIView.animateXXXXX()

    */

    // Notes luc
    /*
     - si spécifie les left-right margin va modifier le width. Si spécifier les top-bottom margin va modifier le height. (possible conflit avec width et height)
     - Gestion des conflits:
        1) P-e que l'ordre set la priorité. ex. si la taille de super est 300 pixels:
            a) view.width(200).leftMargin(100).rightMargin(100) => donne une width de 200 avec un leftMargin de 100 (righMargin pas utilisé)
            b) view.leftMargin(100).rightMargin(100).width(200) => donne une width de 100 avec un leftMargin et rightMargin de 100 (width pas utilisé)
     
        2) P-e que ça lêve des asserts ou des warnings. Dans l'exemple précédent
            a) WARNING: conflict with rightMargin(100)
            b) WARNING: Conflict with width(200)

     - view.top(view2.bottom).offset(40).left(view2.right).offset(10)
        OU
       view.top(view2.bottom).left(view2.right).marginTop(40).marginLeft(10)
        OU
        view.bottomRightOf(view2).marginTop(40).marginLeft(10)  (CHECK)
        OU
    */

    //
    // Snapkit nice things:
    //

    // make.size.equalTo(superview).offset(CGSizeMake(100, -50))
    // make.edges.equalTo(superview).inset(UIEdgeInsetsMake(20, 20, 20, 20))
    // make.size.equalTo(superview).offset(CGSizeMake(100, -50))
    // make.top.equalTo(42)
    // make.height.equalTo(20)
    // make.size.equalTo(CGSizeMake(50, 100))
    // make.edges.equalTo(UIEdgeInsetsMake(10, 0, 10, 0))
    // make.left.equalTo(view).offset(UIEdgeInsetsMake(10, 0, 10, 0))

    // RELATIVE
    // make.top.equalTo(view2.snp_bottom).offset(20.0)

    // SIZE
    // make.size.equalTo(CGSizeMake(50, 100))

    // First baseline
    // Support UILabel first baseline (see snapkit firstBaseline and http://stackoverflow.com/questions/34207080/storyboard-warning-first-baseline-layout-attribute-before-ios-8-0)

    // make.left.right.bottom.equalTo(superview)


//    view.layout.topHCenter.margins(.top(10)).size(.FitWidth(width: secondView.width))
//    view.layout.topHCenter.marginTop(10).marginLeft(5).size(.FitWidth(width: secondView.width))
//    view.layout.topHCenter.margins(10).size(.FitWidth(width: secondView.width))



    //margins(.top(10)).size(.FitWidth(oneLineElementWidth).apply()
    
}


// swiftlint:enable variable_name


