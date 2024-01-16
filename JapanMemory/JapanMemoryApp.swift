//
//  JapanMemoryApp.swift
//  JapanMemory
//
//  Created by gebiwanger on 2024/1/16.
//

import SwiftUI

extension DispatchQueue {
    private static var _onceTracker = [String]()

    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }

        if _onceTracker.contains(token) {
            return
        }

        _onceTracker.append(token)
        block()
    }
}

@main
struct JapanMemoryApp: App {
  
  @State private var globalAlertShown = false
  @State private var alertTitle: String = ""
  @State private var alertMsg: String = ""
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppear {
          DispatchQueue.once(token: "com.app") {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("showAlert"), object: nil, queue: .main) { v in
              if let r = v.userInfo as? [String:String] {
                alertTitle = r["title"] ?? ""
                alertMsg = r["msg"] ?? ""
                globalAlertShown.toggle()
              }
            }
          }
        }
        .alert(isPresented: $globalAlertShown) {
          Alert(
            title: Text(alertTitle),
            message: Text(alertMsg)
          )
        }
    }
  }
}
