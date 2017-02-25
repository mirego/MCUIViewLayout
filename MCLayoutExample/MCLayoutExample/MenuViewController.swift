//
//  MenuViewController.swift
//  MCLayoutExample
//
//  Created by Luc Dion on 2016-09-03.
//  Copyright © 2016 Mirego. All rights reserved.
//
import Foundation

enum Page: Int {
    case basicPositionning = 0
    case layout2
    case layout2RelativePositions
    case layout2MultiRelativePositions
    
    case layout2ChainedLayout
    
    case layout2MarginsAndPaddingLeftWidth
    case layout2MarginsAndPaddingLeftRight
    
    case layout2ValidateConflicts
    case count
    
    var text: String {
        switch self {
        case .basicPositionning:                 return "Yoga Test"
        case .layout2:                           return "Layout 2 - Position Direct access"
        case .layout2RelativePositions:          return "Layout 2 - Test Relative"
        case .layout2MultiRelativePositions:     return "Layout 2 - Test Multiple Relatives"
        case .layout2ChainedLayout:              return "Layout 2 - Chained Layout"
        case .layout2MarginsAndPaddingLeftWidth: return "Layout 2 - Test margings and paddings - Left+Width"
        case .layout2MarginsAndPaddingLeftRight: return "Layout 2 - Test margings and paddings - Left+Right"
        case .layout2ValidateConflicts:          return "Layout 2 - Validate properties conflicts"
        case .count:                             return "Unknown"
        }
    }
}

class MenuViewController: UIViewController {
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuView()
        mainView.delegate = self
    }
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    func didSelect(page: Page) {
        var controller: UIViewController?
        
        switch page {
        case .basicPositionning:
            controller = YogoTestViewController()
        case .layout2:
            controller = Layout2ViewController()
        case .layout2RelativePositions:
            controller = Layout2RelativeViewController()
        case .layout2MultiRelativePositions:
            controller = Layout2MultiRelativeViewController()
        case .layout2ChainedLayout:
            controller = Layout2ChainedLayoutViewController()
        case .layout2MarginsAndPaddingLeftWidth:
            controller = Layout2MarginsAndPaddingsLeftWidthViewController()
        case .layout2MarginsAndPaddingLeftRight:
            controller = Layout2MarginsAndPaddingsLeftRightViewController()
        case .layout2ValidateConflicts:
            controller = LayoutValidateConflictsViewController()
        default:
            assert(false)
            break
        }
        
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
