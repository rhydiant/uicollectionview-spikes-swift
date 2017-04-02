//
//  StretchyViewController.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit


/// Presents cards with a stretchy header
class StretchyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  // MARK: - Outlets
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  
  // MARK: - Private properties
  
  private var cardProvider = CardProvider(numberOfSections: 1, numberOfCardsInSection: 50)
  
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    setupCollectionView()      
  }
  
  
  
  // MARK: - Private methods
  
  private func setupCollectionView() {
    collectionView.style()
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
    return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CustomHeader.identifier, for: indexPath)
  }
  
  
  
  // MARK: - UICollectionViewDelegateFlowLayout
  
  private struct CellLayout {
    static let cellHeight: CGFloat = 100
    
    static let cellLeadingPadding: CGFloat = 32
    static let cellTrailingPadding: CGFloat = 32
    static let cellTopPadding: CGFloat = 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let parentViewWidth: CGFloat = collectionView.bounds.size.width
    
    return CGSize(width: (parentViewWidth - (CellLayout.cellLeadingPadding + CellLayout.cellTrailingPadding)), height: CellLayout.cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: CellLayout.cellTopPadding, left: CellLayout.cellLeadingPadding, bottom: 0, right: CellLayout.cellTrailingPadding)
  }

}
