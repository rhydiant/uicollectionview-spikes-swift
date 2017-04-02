//
//  CarouselViewController.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit


/// Presents cards in a carousel
class CarouselViewController: UIViewController, UICollectionViewDataSource {
  
  // MARK: - Outlets
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  
  // MARK: - Private properties
  
  private var cardProvider = CardProvider(numberOfSections: 1, numberOfCardsInSection: 20)
  
  
  
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

}
