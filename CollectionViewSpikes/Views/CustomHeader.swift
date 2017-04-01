//
//  CustomHeader.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 1/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

class CustomHeader: UICollectionReusableView {
  
  // MARK: - Properties
  
  static let identifier = "HeaderIdentifier"
  
  var title: String? {
    didSet {
      titleLabel?.text = title
    }
  }
  
  var subtitle: String? {
    didSet {
      subtitleLabel?.text = subtitle
    }
  }
  
  var supplementaryTitle: String? {
    didSet {
      supplementaryTitleLabel?.text = supplementaryTitle
    }
  }
  
  
  
  // MARK: - Outlets
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var subtitleLabel: UILabel!
  
  @IBOutlet weak var supplementaryTitleLabel: UILabel!
  
  
  
  // MARK: - Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    backgroundColor = UIColor.clear
  }
  
}
