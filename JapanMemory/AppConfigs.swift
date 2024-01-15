//
//  AppSettings.swift
//  FiftyChart
//
//  Created by gebiwanger on 2024/1/8.
//

import Foundation

enum Seconds: String, CaseIterable, Identifiable {
  var id: Self { self }

  case One = "1"
  case Two = "2"
  case Three = "3"
  case Five = "5"
}

enum WordSeg: String, CaseIterable, Identifiable {
  var id: Self { self }

  case All = "1"
  case PIN = "2"
  case PIAN = "3"
  case PIN_PIAN = "4"
  case YIN = "5"
  
  var des: String {
    switch self {
    case .All:
      "ALL"
    case .PIN:
      "PIN"
    case .PIAN:
      "PIAN"
    case .PIN_PIAN:
      "PIN&PIAN"
    case .YIN:
      "YIN"
    }
  }
}

struct AppSettings: Codable {
  
  var second: String = Seconds.Three.rawValue {
    didSet {
      save()
    }
  }
  
  var wordSeg: String = WordSeg.PIN_PIAN.rawValue {
    didSet {
      save()
    }
  }
  
  var fiftyCharts: [[String]] = [
    ["あ","ア", "a", "1"],["い","イ", "i", "1"],["う","ウ", "u", "1"],["え","エ", "e", "0"],["お","オ", "o", "0"],
    ["か","カ", "ka", "0"],["き","キ", "ki", "0"],["く","ク", "ku", "0"],["け","ケ", "ke", "0"],["こ","コ", "ko", "0"],
    ["さ","サ", "sa", "0"],["し","シ", "si", "0"],["す","ス", "su", "0"],["せ","セ", "se", "0"],["そ","ソ", "so", "0"],
    ["た","タ", "ta", "0"],["ち","チ", "ti", "0"],["つ","ツ", "tu", "0"],["て","テ", "te", "0"],["と","ト", "to", "0"],
    ["な","ナ", "na", "0"],["に","ニ", "ni", "0"],["ぬ","ヌ", "nu", "0"],["ね","ネ", "ne", "0"],["の","ノ", "no", "0"],
    ["は","ハ", "ha", "0"],["ひ","ヒ", "hi", "0"],["ふ","フ", "hu", "0"],["へ","ヘ", "he", "0"],["ほ","ホ", "ho", "0"],
    ["ま","マ", "ma", "0"],["み","ミ", "mi", "0"],["む","ム", "mu", "0"],["め","メ", "me", "0"],["も","モ", "mo", "0"],
    ["や","ヤ", "ya", "0"],["ゆ","ユ", "yu", "0"],["よ","ヨ", "yo", "0"],
    ["ら","ラ", "ra", "0"],["り","リ", "ri", "0"],["る","ル", "ru", "0"],["れ","レ", "re", "0"],["ろ","ロ", "ro", "0"],
    ["わ","ワ", "wa", "0"],["を","ヲ", "wo", "0"],
  ] {
    didSet {
      save()
    }
  }
  
  static let userdefaultKey = "com.zhchrrect.appsettings123"
  
  private init() { }
  
  static var `default` = AppSettings()
  
  func save() {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(self) {
        UserDefaults.standard.set(encoded, forKey: AppSettings.userdefaultKey)
    }
  }
}

class AppConfigs: ObservableObject {
  @Published var appsettings: AppSettings!
  
  private init() {
    load()
  }
  
  static var `default` = AppConfigs()
  
  func load() {
    guard let data = UserDefaults.standard.object(forKey: AppSettings.userdefaultKey) as? Data else {
      appsettings = AppSettings.default
      return
    }
    let decoder = JSONDecoder()
    guard let obj = try? decoder.decode(AppSettings.self, from: data) else {
      appsettings = AppSettings.default
      return
    }
    appsettings = obj
  }
}
