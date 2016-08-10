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
 - width: CGFloat     [read-write]
 - height: CGFloat    [read-write]
 - size: CGSize       [read-write]
 - origin: CGPoint    [read-write]
 - x: CGFloat         [read-write]
 - y: CGFloat         [read-write]
 - maxX: CGFloat      [read-write]
 - maxY: CGFloat      [read-write]
 - minX: CGFloat      [read-write]
 - minY: CGFloat      [read-write]
 - midX: CGFloat      [read-write]
 - midY: CGFloat      [read-write]

 Examples:
 myChild.size = view.size
 myChild.width = view.width

 * Expose two methods to position UIView easily: setPosition() and setRelativePosition()
 */
// swiftlint:disable variable_name

extension UIView
{

    var left: CGFloat {
        set {
            frame = CGRect(x: pixelIntegral(newValue), y: y, width: width, height: height)
        }
        get {
            return frame.origin.x
        }
    }

    var top: CGFloat {
        set {
            frame = CGRect(x: x, y: pixelIntegral(newValue), width: width, height: height)
        }
        get {
            return frame.origin.y
        }
    }

    var right: CGFloat {
        set {
            x = newValue - width
        }
        get {
            return frame.maxX
        }
    }

    var bottom: CGFloat {
        set {
            y = newValue - height
        }
        get {
            return frame.maxY
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
    enum FitSizeType
    {
        case Width(width: CGFloat)
        case Height(height: CGFloat)
        case Size(size: CGSize)
        case SizeWH(width: CGFloat, height: CGFloat)

        func getSize() -> CGSize
        {
            switch self {
            case .Width(let width):
                return CGSize(width: width, height: .max)
            case .Height(let height):
                return CGSize(width: .max, height: height)
            case .Size(let size):
                return size
            case .SizeWH(let width, let height):
                return CGSize(width: width, height: height)
            }
        }
    }

    enum SizeType
    {
        // Size
        case Size(size: CGSize)
        case SizeWH(width: CGFloat, height: CGFloat)
        case Width(width: CGFloat)
        case Height(height: CGFloat)
        case Rect(sideLength: CGFloat)

        // Fit size (call view's sizeThatFits() method to compute the size)
        case FitWidth(width: CGFloat)
        case FitHeight(height: CGFloat)
        case FitSize(size: CGSize)
        case FitSizeWH(width: CGFloat, height: CGFloat)

        case FitViewSize(view: UIView)
        case FitViewWidth(view: UIView)
        case FitViewHeight(view: UIView)


        func getSize(forView view: UIView) -> CGSize
        {
            switch self {
            case .Size(let size):
                return size
            case .SizeWH(let width, let height):
                return CGSize(width: width, height: height)
            case .Width(let width):
                return CGSize(width: width, height: view.height)
            case .Height(let height):
                return CGSize(width: view.width, height: height)
            case .Rect(let sideLength):
                return CGSize(width: sideLength, height: sideLength)

            case .FitWidth(let width):
                return view.sizeThatFits(CGSize(width: width, height: .max))
            case .FitHeight(let height):
                return view.sizeThatFits(CGSize(width: .max, height: height))
            case .FitSize(let size):
                return view.sizeThatFits(size)
            case .FitSizeWH(let width, let height):
                return view.sizeThatFits(CGSize(width: width, height: height))

            case FitViewSize(let otherView):
                return view.sizeThatFits(otherView.size)
            case FitViewWidth(let otherView):
                return view.sizeThatFits(CGSize(width: otherView.width, height: .max))
            case FitViewHeight(let otherView):
                return view.sizeThatFits(CGSize(width: .max, height: otherView.height))
            }
        }
    }

    func setPosition2(position: MCViewPosition, inView: UIView? = nil, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil,
                     newSize: SizeType? = nil)
    {
        let inView = inView ?? superview
        let margins = margins ?? UIEdgeInsetsZero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        if let newSize = newSize {
            size = newSize.getSize(forView: self)
        }

        mc_setPosition(position, inView:inView, withMargins: margins, size: size ?? frame.size)
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
    func setRelativePosition2(position: MCViewPosition, toView: UIView?, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil)
    {
        let margins = margins ?? UIEdgeInsetsZero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        mc_setRelativePosition(position, toView:toView, withMargins: margins, size: size ?? frame.size)
    }
}

extension UIView {
    var position: ViewPositionning {
        return ViewPositionningImpl(view: self)
    }

    var resize: ViewResize {
        return ViewResizeImpl(view: self)
    }

    func position(positionning: ViewPositionning) {
        positionning.apply(onView: self)
    }
}

protocol ViewResize {
    init(view: UIView?)

    func size(size: CGSize) -> ViewResize
    func matchSize(view: UIView) -> ViewResize

    func width(width: CGFloat) -> ViewResize
    func widthMatch(view: UIView) -> ViewResize
    func widthSpaceBetween(view: UIView, and: UIView)

    func height(height: CGFloat) -> ViewResize
    func heightMatch(view: UIView) -> ViewResize
    func heightSpaceBetween(view: UIView) -> ViewResize

    func sizeThatFitsWidth(width: CGFloat) -> ViewResize
    func sizeThatFitsHeight(height: CGFloat) -> ViewResize
    func sizeThatFits(size: CGSize) -> ViewResize
    func sizeThatFitsViewSize(view: UIView) -> ViewResize
    func sizeThatFitsViewWidth(view: UIView) -> ViewResize
    func sizeThatFitsViewHeight(view: UIView) -> ViewResize

    func apply(onView onView: UIView)
}


protocol ViewPositionning {
    init(view: UIView?)

    // TOP
    var topLeft: ViewPositionning {get}
    func topLeft(of view: UIView) -> ViewPositionning

    var topHCenter: ViewPositionning {get}
    func topHCenter(of view: UIView) -> ViewPositionning

    var topRight: ViewPositionning {get}
    func topRight(of view: UIView) -> ViewPositionning

    // CENTER
    var leftVCenter: ViewPositionning {get}
    func leftVCenter(of view: UIView) -> ViewPositionning

    var center: ViewPositionning {get}
    func center(of view: UIView) -> ViewPositionning

    var rightVCenter: ViewPositionning {get}
    func rightVCenter(of view: UIView) -> ViewPositionning

    // BOTTOM
    var bottomLeft: ViewPositionning {get}
    func bottomLeft(of view: UIView) -> ViewPositionning

    var bottomHCenter: ViewPositionning {get}
    func bottomHCenter(of view: UIView) -> ViewPositionning

    var bottomRight: ViewPositionning {get}
    func bottomRight(of view: UIView) -> ViewPositionning

    func top(top: CGFloat) -> ViewPositionning  // Needed? Equivalent to topMargin OR minY
    func top(of view: UIView) -> ViewPositionning
    func left(of view: UIView) -> ViewPositionning
    func bottom(of view: UIView) -> ViewPositionning
    func right(of view: UIView) -> ViewPositionning

    func betweenVertically(of view: UIView, and: UIView)
    func betweenHorizontally(of view: UIView, and: UIView)

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
    func matchWidth(view: UIView) -> ViewPositionning
    func height(height: CGFloat) -> ViewPositionning
    func matchHeight(view: UIView) -> ViewPositionning
    func sizeThatFitsWidth(width: CGFloat) -> ViewPositionning
    func sizeThatFitsHeight(height: CGFloat) -> ViewPositionning
    func sizeThatFits(size: CGSize) -> ViewPositionning
    func sizeThatFitsViewSize(view: UIView) -> ViewPositionning
    func sizeThatFitsViewWidth(view: UIView) -> ViewPositionning
    func sizeThatFitsViewHeight(view: UIView) -> ViewPositionning
    func apply(onView onView: UIView)
}


class ViewResizeImpl: ViewResize {
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

    func matchWidth(view: UIView) -> ViewResize {
        size.width = view.width
        return self
    }

    func height(height: CGFloat) -> ViewResize {
        size.height = height
        return self
    }

    func matchHeight(view: UIView) -> ViewResize {
        size.height = view.height
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
}


//ViewPositionningImpl devrait simplement implémente les deux protocols et UIView.resize retourne un ViewResize et UIView.position retourne un ViewPositionning (qui dérive du protocol ViewResize. Faire une copie avant ce changement !!!!!!

class ViewPositionningImpl: ViewPositionning {
    private let view: UIView?
    private var position: MCViewPosition = .PositionTopLeft

    private var relativePosition: MCViewPosition?
    private var relativeToView: UIView?

    private var topOf: UIView?
    private var leftOf: UIView?
    private var bottomOf: UIView?
    private var rightOf: UIView?
    private var margins: UIEdgeInsets?

    private var viewResize: ViewResizeImpl

//    private var sizeType: UIView.SizeType?
//    private var size = CGSize(width: CGFloat.max, height: CGFloat.max)

    required init (view: UIView?) {
        self.view = view

        viewResize = ViewResizeImpl(view: view, applyOnDeinit: false)
    }

    // Copy
    private convenience init(view: UIView?, position: MCViewPosition, margins: UIEdgeInsets?, viewResize: ViewResizeImpl) {
        self.init(view: view)
        self.position = position
        self.margins = margins

        // TODO!!!!!: Implement copy constructor for ViewResize
        self.viewResize = viewResize
    }

    convenience init () {
        self.init(view: nil)
    }

    /*func copy() -> ViewPositionning {
        return ViewPositionning(view: view, position: position, margins:  margins, sizeType: sizeType)
    }*/

    deinit
    {
        apply()
    }


    // TOP
    var topLeft: ViewPositionning {
        position = .PositionTopLeft
        return self
    }

    var topHCenter: ViewPositionning {
        position = .PositionTopHCenter
        return self
    }

    var topRight: ViewPositionning {
        position = .PositionTopRight
        return self
    }

    // CENTER
    var vCenterLeft: ViewPositionning {
        position = .PositionVCenterLeft
        return self
    }

    var centers: ViewPositionning {
        position = .PositionCenters
        return self
    }

    var vCenterRight: ViewPositionning {
        position = .PositionVCenterRight
        return self
    }

    // BOTTOM
    var bottomLeft: ViewPositionning {
        position = .PositionBottomLeft
        return self
    }

    var bottomHCenter: ViewPositionning {
        position = .PositionBottomHCenter
        return self
    }

    var bottomRight: ViewPositionning {
        position = .PositionBottomRight
        return self
    }


    // RELATIVE POSITION
    func topLeft(of view: UIView) -> ViewPositionning {
        relativePosition = MCViewPosition.RelativePositionAboveAlignedLeft
        relativeToView = view
        return self
    }

    func topHCentered(of view: UIView) -> ViewPositionning {
        relativePosition = MCViewPosition.RelativePositionAboveCentered
        relativeToView = view
        return self
    }

    func top(of view: UIView) -> ViewPositionning {
        topOf = view
        return self
    }

    func left(of view: UIView) -> ViewPositionning {
        leftOf = view
        return self
    }

    func bottom(of view: UIView) -> ViewPositionning {
        bottomOf = view
        return self
    }

    func right(of view: UIView) -> ViewPositionning {
        rightOf = view
        return self
    }

    func topHCenter(of view: UIView) -> ViewPositionning {
        topOf = view
        leftOf = view
        return self
    }

    // MARGINS
    func margins(margins: UIEdgeInsets) -> ViewPositionning {
        self.margins = margins
        return self
    }

    func margins(margins: CGFloat) -> ViewPositionning {
        self.margins = .margins(margins)
        return self
    }

    /*func margins(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> ViewPositionning {
        self.margins = UIEdgeInsets(top: top ?? 0, left: left ?? 0, bottom: bottom ?? 0, right: right ?? 0)
        return self
    }*/

    func topMargin(top: CGFloat) -> ViewPositionning {
        initMargins()
        margins!.top = top
        return self
    }

    func leftMargin(left: CGFloat) -> ViewPositionning {
        initMargins()
        margins!.left = left
        return self
    }

    func bottomMargin(bottom: CGFloat) -> ViewPositionning {
        initMargins()
        margins!.bottom = bottom
        return self
    }

    func rightMargin(right: CGFloat) -> ViewPositionning {
        initMargins()
        margins!.right = right
        return self
    }


    // WIDTH / HEIGHT / SIZETHATFITS
    func size(size: CGSize) -> ViewPositionning {
        viewResize.size(size)
        return self
    }

    func matchSize(view: UIView) -> ViewPositionning {
        viewResize.matchSize(view)
        return self
    }

    func width(width: CGFloat) -> ViewPositionning {
        viewResize.width(width)
        return self
    }

    func matchWidth(view: UIView) -> ViewPositionning {
        viewResize.matchWidth(view)
        return self
    }

    func height(height: CGFloat) -> ViewPositionning {
        viewResize.height(height)
        return self
    }

    func matchHeight(view: UIView) -> ViewPositionning {
        viewResize.matchHeight(view)
        return self
    }

    func sizeThatFitsWidth(width: CGFloat) -> ViewPositionning {
        viewResize.sizeThatFitsWidth(width)
        return self
    }

    func sizeThatFitsHeight(height: CGFloat) -> ViewPositionning {
        viewResize.sizeThatFitsHeight(height)
        return self
    }

    func sizeThatFits(size: CGSize) -> ViewPositionning {
        view?.sizeThatFits(size)
        return self
    }

    func sizeThatFitsViewSize(view: UIView) -> ViewPositionning {
        viewResize.sizeThatFitsViewSize(view)
        return self
    }

    func sizeThatFitsViewWidth(view: UIView) -> ViewPositionning {
        viewResize.sizeThatFitsViewWidth(view)
        return self
    }

    func sizeThatFitsViewHeight(view: UIView) -> ViewPositionning {
        viewResize.sizeThatFitsViewHeight(view)
        return self
    }


    private func apply() {
        guard let view = view else { return }
        apply(onView: view)
    }

    func apply(onView onView: UIView) {
        let newSize = viewResize.computeSize(forView: onView)
        onView.setPosition2(position, margins: margins, size: newSize)
    }

    private func initMargins() {
        if margins == nil {
            margins = UIEdgeInsets()
        }
    }
}



func test() {
    let view = UIView()
    let secondView = UIView()
    let thirdView = UIView()

    NSLayoutAttribute
    //view.position.width(20).apply()

    // view.setPosition(.PositionTopHCenter, margins: .top(positionY), fitSize: CGSize(width: oneLineElementWidth, height: .max))

    view.position.topHCenter.topMargin(10).width(200)

    //view.position.right.equalTo(secondView).top.equalTo(thirdView.maxY)
//    view.position.wi

    // Hugo wish:
    // - Layout C in the center of the A and B views.


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


//    view.position.topHCenter.margins(.top(10)).size(.FitWidth(width: secondView.width))
//    view.position.topHCenter.marginTop(10).marginLeft(5).size(.FitWidth(width: secondView.width))
//    view.position.topHCenter.margins(10).size(.FitWidth(width: secondView.width))



    //margins(.top(10)).size(.FitWidth(oneLineElementWidth).apply()
    
}


// swiftlint:enable variable_name


