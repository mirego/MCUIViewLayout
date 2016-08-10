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

import Foundation

class MCUIViewLayoutExampleSetPosition2Swift: UIView
{
    private let margin: CGFloat = 10

    private let topLeft = UILabel()
    private let top = UILabel()
    private let topRight = UILabel()
    private let left = UILabel()
    private let centered = UILabel()
    private let right = UILabel()
    private let bottomLeft = UILabel()
    private let bottom = UILabel()
    private let bottomRight = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blueColor()

        addLabel(topLeft, title: "topLeft")
        addLabel(top, title: "top")
        addLabel(topRight, title: "topRight")

        addLabel(left, title: "left")
        addLabel(centered, title: "centered")
        addLabel(right, title: "right")

        addLabel(bottomLeft, title: "bottomLeft")
        addLabel(bottom, title: "bottom")
        addLabel(bottomRight, title: "bottomRight")

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MCUIViewLayoutExampleSetPosition2Swift.close)))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        topLeft.position.topLeft.margins(margin).width(200)
        top.position.topHCenter.margins(margin).height(40)
        topRight.position.topRight.margins(margin).size(CGSize(width: 100, height: 40))

        left.position.vCenterLeft.margins(margin).sizeThatFitsWidth(100)
        centered.position.centers.margins(margin).sizeThatFitsHeight(80)
        right.position.vCenterRight.margins(margin).sizeThatFits(CGSize(width: 40, height: 400))

        // Reference to other views
        top.position.topHCenter.margins(margin).matchWidth(topLeft)
        top.position.topHCenter.margins(margin).matchHeight(topLeft)
        top.position.topHCenter.margins(margin).matchSize(topLeft)

        bottomLeft.position.bottomLeft.margins(margin).sizeThatFitsViewWidth(topLeft)
        bottom.position.bottomHCenter.margins(margin).sizeThatFitsViewHeight(top)
        bottomRight.position.bottomRight.margins(margin).sizeThatFitsViewSize(topRight)

        

        // Resize too
        topLeft.resize.height(200)
        topRight.resize.matchHeight(topLeft)
        topRight.resize.matchWidth(topLeft)
        topRight.resize.matchSize(topLeft)
        topRight.resize.sizeThatFitsWidth(400)

        // Order is irrelevant
        topLeft.position.topLeft.margins(margin).width(200)
        // is similar to
        topLeft.position.width(200).margins(margin).topLeft


//        OR

        // Init positionning once
//        let positionning = ViewPositionning().margins(margin)
//
//        // Then change only the Position
//        topLeft.position(positionning.topLeft)
//        top.position(positionning.topHCenter)
//        topRight.position(positionning.topRight)
//
//        left.position(positionning.vCenterLeft)
//        centered.position(positionning.centers)
//        right.position(positionning.vCenterRight)
//
//        bottomLeft.position(positionning.bottomLeft)
//        bottom.position(positionning.bottomHCenter)
//        bottomRight.position(positionning.bottomRight)

        
        // ORIGINAL
//        topLeft.setPosition(.PositionTopLeft, margins: margins)
//        top.setPosition(.PositionTopHCenter, margins: margins)
//        topRight.setPosition(.PositionTopRight, margins: margins)
//        left.setPosition(.PositionVCenterLeft, margins: margins)
//
//        centered.setPosition(.PositionCenters, margins: margins)
//        right.setPosition(.PositionVCenterRight, margins: margins)
//        bottomLeft.setPosition(.PositionBottomLeft, margins: margins)
//
//        bottom.setPosition(.PositionBottomHCenter, margins: margins)
//        bottomRight.setPosition(.PositionBottomRight, margins: margins)
    }

    private func addLabel(label: UILabel, title: String) {
        label.text = title
        label.textAlignment = .Center
        label.sizeToFit()
        label.backgroundColor = .whiteColor()

        addSubview(label)
    }

    func close() {
        removeFromSuperview()
    }
}
