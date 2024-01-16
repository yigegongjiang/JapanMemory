//
//  AppSettings.swift
//  FiftyChart
//
//  Created by gebiwanger on 2024/1/8.
//

import Foundation

class AppConfigs: ObservableObject {
  @Published var appsettings: AppSettings!
  
  private init() {
    appsettings = AppStore.default.appsettings
  }
  static var `default` = AppConfigs()
}
