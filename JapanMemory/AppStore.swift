//
//  AppStore.swift
//  JapanMemory
//
//  Created by gebiwanger on 2024/1/16.
//

import Foundation
import SwiftUI

struct Items: Codable {
  var raw: String
  var alias: String
  var des: String
  var filted: Bool
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    raw = try container.decode(String.self, forKey: CodingKeys.raw)
    alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
    des = try container.decodeIfPresent(String.self, forKey: .des) ?? ""
    filted = try container.decodeIfPresent(Bool.self, forKey: .filted) ?? false
  }
  
  enum CodingKeys: String, CodingKey {
    case raw = "10_raw"
    case alias = "20_alias"
    case des = "30_des"
    case filted = "40_filted"
  }
}

struct AppSettings: Codable {
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    type_sel = try container.decode(String.self, forKey: .type_sel)
    if (!Default.privateTypes.contains(type_sel)) {
      type_sel = Default.privateTypes.first!
    }
    repeats = try container.decode(Array.self, forKey: .repeats)
    if repeats.isEmpty {
      throw AppError.parseError
    }
    repeat_sel = try container.decode(Float.self, forKey: .repeat_sel)
    if (!repeats.contains(repeat_sel)) {
      repeat_sel = repeats.first!
    }
    segment_sel = try container.decode(String.self, forKey: .segment_sel)
    if (!Default.privateSegments.contains(segment_sel)) {
      segment_sel = Default.privateSegments.first!
    }
    yin_items = try container.decode(Array.self, forKey: .yin_items)
    word_items = try container.decode(Array.self, forKey: .word_items)
    sentence_items = try container.decode(Array.self, forKey: .sentence_items)
  }

  enum CodingKeys: String, CodingKey {
    case type_sel = "10_type_sel"
    case repeat_sel = "20_repeat_sel"
    case repeats = "21_repeats"
    case segment_sel = "30_segment_sel"
    case yin_items = "40_yin_items"
    case word_items = "50_word_items"
    case sentence_items = "60_sentence_items"
  }
  
  var types: [String] = Default.privateTypes
  var type_sel: String {
    didSet {
      save()
    }
  }
  var repeats: [Float]
  var repeat_sel: Float {
    didSet {
      save()
    }
  }
  var segments: [String] = Default.privateSegments
  var segment_sel: String {
    didSet {
      save()
    }
  }
  var yin_items: [Items] = [] {
    didSet {
      save()
    }
  }
  var word_items: [Items] = [] {
    didSet {
      save()
    }
  }
  var sentence_items: [Items] = [] {
    didSet {
      save()
    }
  }
  
  func save() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    if let encoded = try? encoder.encode(self) {
      AppStore.default.writeConfig(encoded)
    }
  }
}

extension AppSettings {
  func items() -> (items: [Items], symbolLengthScale: Int) {
    switch type_sel {
    case "Yin":
      (yin_items, 5)
    case "Word":
      (word_items, 4)
    case "Sentence":
      (sentence_items, 3)
    default:
      ([], 0)
    }
  }
}

struct AppStore {
  var appsettings: AppSettings!

  let fileManager = FileManager.default
  var configRoot: String {
    NSString(string: "~/.config/\(appName)").standardizingPath
  }
  var configPath: String {
    "\(configRoot)/config.json"
  }
  var configBackPath: String {
    "\(configRoot)/config_back.json"
  }
  var appName: String {
    get {
        if let appname = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
          return appname
        } else {
          return "JapanMemory"
        }
    }
  }
  
  static var `default`: AppStore = AppStore()
  
  private init() {
    initConfig()
  }

  mutating func initConfig() {
    try? fileManager.createDirectory(atPath: configRoot, withIntermediateDirectories: true, attributes: nil)
    
    // 文件不存在(首次使用或者用户删除)
    if !fileManager.fileExists(atPath: configPath) {
      resetConfig()
    }
    
    func parse() throws {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: configPath))
        appsettings = try JSONDecoder().decode(AppSettings.self, from: data)
      } catch {
        throw AppError.parseError
      }
    }
    
    // 解析配置文件
    do {
      try parse()
    } catch {
      // back
      try? fileManager.removeItem(atPath: configBackPath)
      try? fileManager.copyItem(atPath: configPath, toPath: configBackPath)
      // reset
      resetConfig()
      try? parse()
      // showAlert
      let userInfo: [String: String] = [
        "title":"parse config error",
        "msg":"config file error, will reset.see \(configBackPath)"
      ]
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
        NotificationCenter.default.post(name: NSNotification.Name("showAlert"), object: nil, userInfo:userInfo )
      }
    }
  }
  
  func resetConfig() {
    writeConfig(defaultConfig)
  }
  
  func writeConfig(_ config: String) {
    try? config.write(toFile: configPath, atomically: true, encoding: .utf8)
  }
  func writeConfig(_ config: Data) {
    try? config.write(to: URL(fileURLWithPath: configPath), options: .atomic)
  }
}
