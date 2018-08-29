//
//  UITableView+Setup.swift
//  SocioLocal
//
//  Created by Alex Kunitsa on 10/25/17.
//  Copyright © 2017 TechMagic. All rights reserved.
//

import UIKit

extension UITableView {
  
  func registerNibs(_ names: [String]) {
    names.forEach { (name) in
      self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
  }
  
  func registerHeaderFooterViews(_ names: [String]) {
    names.forEach { (name) in
      self.register(UINib(nibName: name, bundle: nil), forHeaderFooterViewReuseIdentifier: name)
    }
  }
  
  func makeAutomaticHeight() {
    self.rowHeight = UITableView.automaticDimension
    self.estimatedRowHeight = 48
  }
  
  func height() -> CGFloat {
    return Array(0..<self.numberOfSections).map({ (section) -> CGFloat in
      return Array(0..<self.numberOfRows(inSection: section)).map({ (row) -> CGFloat in
        return self.rectForRow(at: IndexPath(row: row, section: section)).size.height
      }).reduce(0, {$0 + $1}) +
        self.rectForFooter(inSection: section).size.height +
        self.rectForHeader(inSection: section).size.height
    }).reduce(0, {$0 + $1})
  }
}

extension UITableView: UITableViewDelegate {



}

extension UICollectionView {
  func registerNibs(_ names: [String]) {
    names.forEach { (name) in
      self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
  }
}
