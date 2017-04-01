//
//  CustomCell.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  static let identifier = "CellIdentifier"
  
  
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    style()
    
    isAccessibilityElement = true
  }
    
}
