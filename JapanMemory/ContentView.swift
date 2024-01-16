//
//  ContentView.swift
//  FiftyChart
//
//  Created by gebiwanger on 2024/1/8.
//

import SwiftUI
import Foundation

// next is random, diff from the last one.
class RandomDida {
  var preDida: Int = 0
  
  init() {}
  
  static var `default` = RandomDida()
  
  func next(_ data: [Items]) throws -> Int {
    
    guard !data.isEmpty else {
      throw AppError.noItems
    }
    
    var t: Int = 0
    var flag: Bool = false
    var times: Int = 0
    repeat {
      t = Int.random(in: 0..<data.count)
      flag = t != preDida && !data[t].filted
      times += 1
      if (times > 1000) {
        t = preDida
        flag = true
      }
    } while !flag
    
    preDida = t
    
    return t
  }
}

struct ContentView: View {
  
  @StateObject var config: AppConfigs = AppConfigs.default
  
  @State var dida: Bool = false
  @State private var timer: Timer?
  
  @State var showFilter: Bool = false
  
  var body: some View {
    VStack {
      HStack {
        
        Button("Filter") {
          showFilter.toggle()
        }
        .sheet(isPresented: $showFilter, content: {
          FilterView(showFilter: $showFilter,config: config)
        })
        
        Picker("Types", selection: $config.appsettings.type_sel) {
          ForEach(config.appsettings.types, id: \.self) { v in
            Text(v).tag(v)
          }
        }
        .pickerStyle(.segmented)
        
        Picker("Repeats", selection: $config.appsettings.repeat_sel) {
          ForEach(config.appsettings.repeats, id: \.self) { v in
            let m = v.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", v) : String(format: "%.1f", v)
            Text(m)
              .tag(v)
          }
          .onChange(of: config.appsettings.repeat_sel) { oldValue, newValue in
            resetTime()
          }
        }
        .pickerStyle(.segmented)
        
        Picker("Segments", selection: $config.appsettings.segment_sel) {
          ForEach(config.appsettings.segments, id: \.self) { v in
            Text(v).tag(v)
          }
        }
        .pickerStyle(.segmented)
      }
      .padding(8)
      
      Spacer()
      
      Group {
        
        let _ = dida
        let segments = config.appsettings.segments
        let (items, _) = config.appsettings.items()
        
        if let r = try? RandomDida.default.next(items) {
          let m = segments.firstIndex { $0 == config.appsettings.segment_sel }
          let offset: Int = (m != nil) ? segments.distance(from: segments.startIndex, to: m!) : 0
          switch offset {
          case 0:
            Text(items[r].raw)
            Text(items[r].alias)
            Text(items[r].des)
          case 1:
            Text(items[r].raw)
          case 2:
            Text(items[r].alias)
          case 3:
            Text(items[r].raw)
            Text(items[r].alias)
          case 4:
            Text(items[r].des)
          default:
            Text("Error")
          }
        } else {
            Text("Empty Data")
        }
      }
      .font(.system(size: 80))
      .foregroundStyle(.red)
      Spacer()
    }
    .onAppear(perform: {
      resetTime()
    })
    .frame(minWidth: 1000, idealWidth: 1000, minHeight: 600, idealHeight: 600)
  }
  
  func startTime() {
      timer = Timer.scheduledTimer(withTimeInterval: Double(config.appsettings.repeat_sel), repeats: true) { timer in
        dida.toggle()
      }
  }
  
  func stopTime() {
    timer?.invalidate()
  }
  
  func resetTime() {
    stopTime()
    startTime()
  }
}

#Preview {
  ContentView()
}

