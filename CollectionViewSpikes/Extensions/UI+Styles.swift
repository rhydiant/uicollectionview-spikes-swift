//
//  UI+Styles.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

struct Colors {
  static var background: UIColor {
    return UIColor(red:0.96, green:0.97, blue:0.98, alpha:1.0)
  }
  
  static var foreground: UIColor {
    return UIColor.black
  }
}



extension UIViewController {
  func style() {
    self.view.backgroundColor = Colors.background
  }
}

extension UICollectionView {
  func style() {
    self.backgroundColor = Colors.background
  }
}

extension UICollectionViewCell {
  func style() {
    layer.cornerRadius = 10
    
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    
    backgroundColor = UIColor.white
  }
}
