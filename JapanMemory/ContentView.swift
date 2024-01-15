//
//  ContentView.swift
//  FiftyChart
//
//  Created by gebiwanger on 2024/1/8.
//

import SwiftUI


struct ContentView: View {
  
  @StateObject var config: AppConfigs = AppConfigs.default
  
  @State var index: Int = 0
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
        
        Picker("Second", selection: $config.appsettings.second) {
          ForEach(Seconds.allCases) { v in
            Text(v.rawValue).tag(v.rawValue)
          }
          .onChange(of: config.appsettings.second) { oldValue, newValue in
            resetTime()
          }
        }
        .frame(width: 150)
        .pickerStyle(.segmented)
        
        Picker("WordSeg", selection: $config.appsettings.wordSeg) {
          ForEach(WordSeg.allCases) { v in
            Text(v.des).tag(v.rawValue)
          }
        }
        .frame(width: 300)
        .pickerStyle(.segmented)

        Spacer()
      }
      Spacer()
      Group {
        let word = WordSeg(rawValue: config.appsettings.wordSeg)!
        switch word {
        case .All:
          Text("\(config.appsettings.fiftyCharts[index][0])")
          Text("\(config.appsettings.fiftyCharts[index][1])")
          Text("\(config.appsettings.fiftyCharts[index][2])")
        case .PIN:
          Text("\(config.appsettings.fiftyCharts[index][0])")
        case .PIAN:
          Text("\(config.appsettings.fiftyCharts[index][1])")
        case .PIN_PIAN:
          Text("\(config.appsettings.fiftyCharts[index][0])")
          Text("\(config.appsettings.fiftyCharts[index][1])")
        case .YIN:
          Text("\(config.appsettings.fiftyCharts[index][2])")
        }
      }
      .font(.system(size: 80))
      .foregroundStyle(.red)
      Spacer()
    }
    .onAppear(perform: {
      resetTime()
    })
    .frame(minWidth: 600, idealWidth: 600, minHeight: 400, idealHeight: 400)
  }
  
  func startTime() {
      timer = Timer.scheduledTimer(withTimeInterval: Double(config.appsettings.second)!, repeats: true) { timer in
        var t: Int
        var flag: Bool
        var times: Int = 0
        repeat {
          t = Int.random(in: 0..<config.appsettings.fiftyCharts.count)
          flag = t != index && config.appsettings.fiftyCharts[t][3] != "0"
          times += 1
          if (times > 1000) {
            t = index
            flag = true
          }
        } while !flag
        
        index = t
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

struct FilterItem: Identifiable {
  var item: (Int,Int)
  var id: UUID
  
  init(_ item: (Int, Int)) {
    self.item = item
    self.id = UUID()
  }
}

struct FilterView: View {
  @Binding var showFilter: Bool
  @ObservedObject var config: AppConfigs
  
  let foreachItem: [FilterItem] = [
    FilterItem((0,4)),
    FilterItem((5,9)),
    FilterItem((10,14)),
    FilterItem((15,19)),
    FilterItem((20,24)),
    FilterItem((25,29)),
    FilterItem((30,34)),
    FilterItem((35,37)),
    FilterItem((38,42)),
    FilterItem((43,44)),
  ]
  
  var body: some View {
    Grid {
      GridRow {
        Button("CLOSE") {
          showFilter.toggle()
        }
      }
      ForEach(foreachItem) { m in
        VStack {
          GridRow {
            HStack {
              ForEach(m.item.0...m.item.1, id: \.self) { n in
                VStack {
                  Text("\(config.appsettings.fiftyCharts[n][0])")
                  Text("\(config.appsettings.fiftyCharts[n][1])")
                }
                .foregroundStyle(Color.white)
                .padding(.all, 8)
                .onTapGesture {
                  let t = config.appsettings.fiftyCharts[n]
                  var tt = t
                  tt[3] = tt[3] == "1" ? "0" : "1"
                  config.appsettings.fiftyCharts[n] = tt
                }
                .background(config.appsettings.fiftyCharts[n][3] == "1" ? Color.red : Color.black)
              }
            }
            Divider()
          }
        }
      }
    }
    .frame(width: 250, height: 700)
  }
}

#Preview {
  ContentView()
}

#Preview {
  FilterView(showFilter: .constant(true), config: AppConfigs.default)
}

