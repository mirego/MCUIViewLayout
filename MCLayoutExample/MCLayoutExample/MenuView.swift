//
//  MenuView.swift
//  MCLayoutExample
//
//  Created by Luc Dion on 2016-09-03.
//  Copyright © 2016 Mirego. All rights reserved.
//
import Foundation


protocol MenuViewDelegate: class
{

}


class MenuView: UIView
{
    weak var delegate: MenuViewDelegate?

    fileprivate let tableView = UITableView()
    fileprivate let cellIdentifier = "MenuViewCell"

    init()
    {
        super.init(frame: .zero)

        backgroundColor = .red

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        addSubview(tableView)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        tableView.layout.matchView(self)
    }
}

// PMARK: UITableViewDataSource
extension MenuView: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) 
        return cell
    }
}

// PMARK: UITableViewDelegate
extension MenuView: UITableViewDelegate
{
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
     {
     }*/

    /*func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
     {
     return FavoriteListsTableViewCell.heighForWidth(width)
     }*/
}

