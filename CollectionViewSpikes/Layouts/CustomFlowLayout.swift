//
//  CustomFlowLayout.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 1/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
  
  // MARK: - Methods

  override func layoutAttributesForElements(in rect: CGRect) ->[UICollectionViewLayoutAttributes]? {
    if let layoutAttributes = super.layoutAttributesForElements(in: rect) {
      return layoutAttributes.map { atts in
        var atts = atts
        if atts.representedElementCategory == .supplementaryView {
          atts = self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: atts.indexPath)!
        }
        return atts
      }
    } else {
      return nil
    }
  }
  
  override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    if let layoutAttributesCopy = super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath) {
      if layoutAttributesCopy.representedElementCategory == .supplementaryView {
        layoutAttributesCopy.frame.size.width = 100                
      }
      return layoutAttributesCopy
    } else {
      return nil
    }
  }

}
