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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: 100, height: 80)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: -75, left: 100, bottom: 10, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(10)
  }
}

