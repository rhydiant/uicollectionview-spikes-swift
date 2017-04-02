//
//  GroupedViewController.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 1/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit


/// Presents cards in groups, in this example the grouping is by date
class GroupedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  // MARK: - Outlets
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  
  // MARK: - Private properties
  
  private var cardProvider = CardProvider()
  
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    setupCollectionView()
  }
  
  
  
  // MARK: - Private methods
  
  private func setupCollectionView() {
    collectionView.style()
    
    if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      collectionViewLayout.sectionHeadersPinToVisibleBounds = true
      // could do more configuration here, but opted to use UICollectionViewDelegateFlowLayout instead
    }
  }
  
  
  
  // MARK: - UICollectionViewDataSource
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return cardProvider.numberOfSections
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cardProvider.numberOfCards(inSection: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath)
  }

  
  
  // MARK: - UICollectionViewDelegate
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CustomHeader.identifier, for: indexPath) as? CustomHeader {
      
      let viewModel = DateViewModel(date: cardProvider.sectionDate(atSection: indexPath.section))
      header.title = viewModel.day
      header.subtitle = viewModel.dayOfMonth
      header.supplementaryTitle = viewModel.month
      
      return header
    } else {
      fatalError("Expected CustomHeader, got something else!")
    }
  }
  
  
  
  // MARK: - UICollectionViewDelegateFlowLayout

  private struct CellLayout {
    static let cellHeight: CGFloat = 80
    static let cellWidth: CGFloat = 100
    
    static let cellLeadingPadding: CGFloat = cellWidth
    static let cellTrailingPadding: CGFloat = 32
    static let cellTopPadding: CGFloat = 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let parentViewWidth: CGFloat = collectionView.bounds.size.width
    
    return CGSize(width: (parentViewWidth - CellLayout.cellLeadingPadding - CellLayout.cellTrailingPadding), height: CellLayout.cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: -CellLayout.cellHeight, left: CellLayout.cellLeadingPadding, bottom: CellLayout.cellTopPadding, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: CellLayout.cellWidth, height: CellLayout.cellHeight)
  }
  
}

