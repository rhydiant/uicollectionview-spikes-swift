//
//  DateViewModel.swift
//  CollectionViewSpikes
//
//  Created by Rhydian Thomas on 2/4/17.
//  Copyright © 2017 NA. All rights reserved.
//

import Foundation

struct DateViewModel {
  
  // MARK: - Private properties
  
  private static var formatter = DateFormatter()
  
  
  
  // MARK: - Properties
  
  let day: String
  let month: String
  let dayOfMonth: String
  
  
  
  // MARK: - Lifecycle
  
  init(date: Date) {
    DateViewModel.formatter.dateFormat = "E"
    self.day = DateViewModel.formatter.string(from: date).uppercased()
    
    DateViewModel.formatter.dateFormat = "d"
    self.dayOfMonth = DateViewModel.formatter.string(from: date)
    
    DateViewModel.formatter.dateFormat = "MMM"
    self.month = DateViewModel.formatter.string(from: date).uppercased()
  }
}
