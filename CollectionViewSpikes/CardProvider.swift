//
//  CardProvider.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import Foundation


/// A `Card` data type
struct Card {
  let index: Int
}



/// A `CardProvider` to generate a given number of `Card`s (in sections)
struct CardProvider {
  
  // MARK: - Private properties
  
  private var cardsGroupedByDate: [[Date: [Card]]]
  
  
  
  // MARK: - Lifecycle
  
  init(numberOfSections: Int = 10, numberOfCardsInSection: Int = 5) {
    let cards = (1...numberOfCardsInSection).map { Card(index: $0) }
    let sections = (1...numberOfSections).map { [Date().addingTimeInterval(60*60*24*Double($0)): cards] }
    
    self.cardsGroupedByDate = sections
  }
  
  
  
  // MARK: - Properties
  
  var numberOfSections: Int {
    return cardsGroupedByDate.count
  }
  
  
  
  // MARK: - Methods
  
  func numberOfCards(inSection sectionIndex: Int) -> Int {
    return cardsGroupedByDate[sectionIndex].values.first?.count ?? 0
  }
  
  func sectionDate(atSection sectionIndex: Int) -> Date {
    return cardsGroupedByDate[sectionIndex].keys.first ?? Date()
  }
}
