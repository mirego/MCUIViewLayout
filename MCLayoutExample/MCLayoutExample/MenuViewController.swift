//
//  MenuViewController.swift
//  MCLayoutExample
//
//  Created by Luc Dion on 2016-09-03.
//  Copyright © 2016 Mirego. All rights reserved.
//

import Foundation


class MenuViewController: UIViewController
{
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    enum Page: String {
        case BasicPositionning = "BasicPositionning"
    }

    init()
    {
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView()
    {
        view = MenuView()
        mainView.delegate = self
    }
}

// PMARK: Control events
extension MenuViewController
{
}

// PMARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate
{
}
