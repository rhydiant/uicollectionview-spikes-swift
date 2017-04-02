//
//  CarouselFlowLayout.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 1/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit


/// A horizontal `UICollectionViewFlowLayout` with scaling effect applied to cells in `center`
class CarouselFlowLayout: UICollectionViewFlowLayout {
  
  // MARK: - LayoutMetrics
  
  private struct LayoutMetrics {
    static let itemSizeWidth: CGFloat = 150
    static let itemSizeHeight: CGFloat = 100
    
    static let sectionInsetTop: CGFloat = 16
    static let sectionInsetLeft: CGFloat = 16
    static let sectionInsetBottom: CGFloat = 0
    static let sectionInsetRight: CGFloat = 16
    
    static let minimumLineSpacing: CGFloat = 1
  }
  
  
  
  // MARK: - Lifecycle
  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    scrollDirection = .horizontal
    
    itemSize = CGSize(width: LayoutMetrics.itemSizeWidth, height: LayoutMetrics.itemSizeHeight)
    
    estimatedItemSize = CGSize(width: LayoutMetrics.itemSizeWidth, height: LayoutMetrics.itemSizeHeight)
    
    sectionInset = UIEdgeInsets(top: LayoutMetrics.sectionInsetTop, left: LayoutMetrics.sectionInsetLeft, bottom: LayoutMetrics.sectionInsetBottom, right: LayoutMetrics.sectionInsetRight)
    
    minimumLineSpacing = LayoutMetrics.minimumLineSpacing
  }
  
  
  
  // MARK: - Methods
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    if let layoutAttributes = super.layoutAttributesForElements(in: rect) {
      var updatedLayoutAttributes = [UICollectionViewLayoutAttributes]()
      for attributes in layoutAttributes {
        let updatedLayoutAttribute = attributes.copy() as! UICollectionViewLayoutAttributes
        updateLayoutAttributes(updatedLayoutAttribute)
        updatedLayoutAttributes.append(updatedLayoutAttribute)
      }
      return updatedLayoutAttributes
    } else {
      return nil
    }
  }
  
  override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    
    // snap scroll to card
    
    let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)
    let center = collectionView!.bounds.size.width / 2
    let proposedContentOffsetCenterOrigin = proposedContentOffset.x + center
    let closest = layoutAttributes!.sorted { abs($0.center.x - proposedContentOffsetCenterOrigin) < abs($1.center.x - proposedContentOffsetCenterOrigin) }.first ?? UICollectionViewLayoutAttributes()
    let targetContentOffset = CGPoint(x: floor(closest.center.x - center), y: proposedContentOffset.y)
    
    return targetContentOffset
  }
  
  
  
  // MARK: - Private methods
  
  private func updateLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
    if let collectionView = collectionView {
      let collectionCenter = collectionView.frame.size.width / 2
      let offset = collectionView.contentOffset.x
      let normalizedCenter = attributes.center.x - offset
      
      let maxDistance = self.itemSize.width + 32
      let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
      let ratio = (maxDistance - distance)/maxDistance
      
      let alpha = ratio * (1 - 0.5) + 0.5
      let scale = ratio * (1 - 0.5) + 0.5
      
      attributes.alpha = alpha
      attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
  }

}
