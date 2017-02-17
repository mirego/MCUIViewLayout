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
    case count
    
    var text: String {
        switch self {
        case .basicPositionning: return "Basic Positionning"
        case .layout2: return "Layout 2"
        default:
            assert(false)
            return "Unknown"
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
        default:
            assert(false)
            break
        }
        
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
