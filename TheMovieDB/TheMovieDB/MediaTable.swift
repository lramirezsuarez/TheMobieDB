//
//  MediaTable.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/15/17.
//  Copyright © 2017 Globant. All rights reserved.
//
//
import UIKit

class MediaTable : UITableView, MyListView {
    weak var myListDelegate: MediaViewControllerDelegate?
    fileprivate var identifier = "MovieTableViewCell"
    
    internal func handleDataReload() { self.reloadData()}
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.dataSource = self
        self.delegate = self
        register(nib, forCellReuseIdentifier: identifier)
    }
    
}

extension MediaTable : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myListDelegate?.getNumberOfCells() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        myListDelegate?.setupCell(cell: cell as! MovieCell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myListDelegate?.didSelectCell(cell: tableView.cellForRow(at: indexPath) as! MovieCell,indexPath: indexPath)
    }
    
}
