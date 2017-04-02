//
//  StretchyHeaderLayout.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
  
  // MARK: - Override methods
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
    
    return adjustedLayoutAttributes(layoutAttributes: layoutAttributes)
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  
  
  // MARK: - Private methods
  
  private func adjustedLayoutAttributes(layoutAttributes: [UICollectionViewLayoutAttributes]) -> [UICollectionViewLayoutAttributes] {
    guard let offset = collectionView?.contentOffset, offset.y < 0 else { return layoutAttributes }

    for attributes in layoutAttributes {
      if let elementKind = attributes.representedElementKind, elementKind == UICollectionElementKindSectionHeader {
        let deltaY = fabs(offset.y)
        
        var frame = attributes.frame
        frame.size.height = max(0, headerReferenceSize.height + deltaY)
        frame.origin.y = frame.minY - deltaY
        
        attributes.frame = frame
      }
    }
    
    return layoutAttributes
  }
}
