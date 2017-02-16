//
//  MediaProtocolViewController.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/13/17.
//  Copyright © 2017 Globant. All rights reserved.
//
import Foundation
import UIKit
import Cosmos

// MARK: Protocol Delegate

protocol MediaViewControllerDelegate: class {
    func getNumberOfCells() -> Int
    func setupCell(cell : MovieCell, indexPath : IndexPath)
    func didSelectCell(cell: MovieCell, indexPath : IndexPath)
}

// MARK: Protocol MovieCell

protocol MovieCell {
    var titleLabel : UILabel? { get }
    var genreLabel : UILabel? { get }
    var overviewLabel : UILabel? { get }
    var ratingCosmos : CosmosView? { get }
    var posterImage : UIImageView? { get }
    var releaseDateLabel : UILabel? { get }
}

// MARK: Protocol ListView

protocol MyListView{
    weak var myListDelegate:MediaViewControllerDelegate?{get set}
    func handleDataReload()
    
}
