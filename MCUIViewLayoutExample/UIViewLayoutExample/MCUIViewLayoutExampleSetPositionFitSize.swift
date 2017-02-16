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

class MCUIViewLayoutExampleFitSize: UIView
{
    private let fitSizeLeft30 = UILabel()
    private let fitSizeCenter30 = UILabel()
    private let fitSizeRight30 = UILabel()

    private let fitSize50 = UILabel()
    private let fitSize75 = UILabel()
    private let fitSize100 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blue

        addLabel(fitSizeLeft30, title: "Left fitSize 33% of parent's width - Lo rem ip sum do lor sit a met, con sec a b c d e f g h i")
        addLabel(fitSizeCenter30, title: "Center fitSize 33% of parent's width - Lo rem ip sum do lor sit a met, con sec a b c d e f g h i")
        addLabel(fitSizeRight30, title: "Right fitSize 33% of parent's width - Lo rem ip sum do lor sit a met, con sec a b c d e f g h i")
        addLabel(fitSize50, title: "fitSize 50% of parent's width - Lo rem ip sum do lor sit a met, con sec")
        addLabel(fitSize75, title: "fitSize 75% of parent's width - Lo rem ip sum do lor sit a met, con sec")
        addLabel(fitSize100, title: "fitSize 100% of parent's width - Lo rem ip sum do lor sit a met, con sec")

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MCUIViewLayoutExampleFitSize.close)))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        fitSizeLeft30.setPosition(.positionTopLeft, margins: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), fitSize: CGSize(width: frame.width * 0.3333, height: .greatestFiniteMagnitude))
        fitSizeCenter30.setRelativePosition(.relativePositionToTheRightAlignedTop, toView: fitSizeLeft30, fitSize: CGSize(width: frame.width * 0.3333, height: .greatestFiniteMagnitude))
        fitSizeRight30.setRelativePosition(.relativePositionToTheRightAlignedTop, toView: fitSizeCenter30, fitSize: CGSize(width: frame.width * 0.3333, height: .greatestFiniteMagnitude))
        fitSize50.setRelativePosition(.relativePositionUnderAlignedLeft, toView: fitSizeLeft30, margins: margins, fitSize: CGSize(width: frame.width * 0.5, height: .greatestFiniteMagnitude))
        fitSize75.setRelativePosition(.relativePositionUnderAlignedLeft, toView: fitSize50, margins: margins, fitSize: CGSize(width: frame.width * 0.75, height: .greatestFiniteMagnitude))
        fitSize100.setRelativePosition(.relativePositionUnderAlignedLeft, toView: fitSize75, margins: margins, fitSize: CGSize(width: frame.width, height: .greatestFiniteMagnitude))
    }

    private func addLabel(_ label: UILabel, title: String) {
        label.text = title
        label.numberOfLines = 0
        label.sizeToFit()
        label.layer.borderWidth = 1

        addSubview(label)
    }

    func close() {
        removeFromSuperview()
    }
}
