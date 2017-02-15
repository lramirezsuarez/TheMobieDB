//
//  MediaProtocolViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/13/17.
//  Copyright © 2017 Globant. All rights reserved.
//
import Foundation
import UIKit
import Cosmos

// MARK: Protocols

protocol MediaViewControllerDelegate: class {
    func getNumberOfCells() -> Int
    func setupCell(_ : MovieCell, indexPath : IndexPath)
}

protocol MovieCell {
    var titleLabel : UILabel? { get }
    var ratingCosmos : CosmosView? { get }
    var posterImage : UIImageView? { get }
}

protocol MyListView{
    weak var myListDelegate:MediaViewControllerDelegate?{get set}
    func handleDataReload()
    
}


// MARK: Extensions for TableView - CollectionView

//public extension UITableView {
//    public static var defaultCellIdentifier: String {
//        return "MovieTableViewCell"
//    }
//    
//    public subscript(indexPath: IndexPath) -> UITableViewCell {
//        return self.dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
//    }
//}
//
//
//
//public extension UICollectionView {
//    
//    public static var defaultCellIdentifier: String {
//        return "MovieCollectionViewCell"
//    }
//    
//    public subscript(indexPath: IndexPath) -> UICollectionViewCell {
//        return self.dequeueReusableCell(withReuseIdentifier: UICollectionView.defaultCellIdentifier, for: indexPath)
//    }
//}
