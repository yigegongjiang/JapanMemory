//
//  Pop.swift
//  JapanMemory
//
//  Created by gebiwanger on 2024/1/16.
//

import Foundation
import SwiftUI

struct FilterView: View {
  @Binding var showFilter: Bool
  @ObservedObject var config: AppConfigs
  
  func fetchItems() -> [Items] {
    let (items, _) = config.appsettings.items()
    return items
  }
  
  func h_num() -> Int {
    let (_, scale) = config.appsettings.items()
    return scale
  }
  
  func h() -> Int {
    Int(ceil(Double(fetchItems().count) / Double(h_num())))
  }
  
  func v(_ h: Int) -> Int {
    let m = fetchItems().count
    if (h + 1) * h_num() <= m {
      return h_num()
    } else {
      return h_num() - ((h + 1) * h_num() - m)
    }
  }
  
  func cellHit(_ index: Int) {
    cellHit(index, filter: nil)
  }
  func cellHit(_ index: Int, del: Bool) {
    cellHit(index, filter: nil, del: del)
  }
  func cellHit(_ index: Int, filter: Bool?, del: Bool = false) {
    
    let types = config.appsettings.types
    let m = types.firstIndex { $0 == config.appsettings.type_sel }
    let offset: Int = (m != nil) ? types.distance(from: types.startIndex, to: m!) : 0
    
    guard !del else {
      switch offset {
      case 0:
        config.appsettings.yin_items.remove(at: index)
      case 1:
        config.appsettings.word_items.remove(at: index)
      case 2:
        config.appsettings.sentence_items.remove(at: index)
      default:
        let _ = print("")
      }
      return
    }
    let t = fetchItems()[index]
    var tt = t
    if let filter {
      tt.filted = filter
    } else {
      tt.filted = !tt.filted
    }
    
    switch offset {
    case 0:
      config.appsettings.yin_items[index] = tt
    case 1:
      config.appsettings.word_items[index] = tt
    case 2:
      config.appsettings.sentence_items[index] = tt
    default:
      let _ = print("")
    }
  }
  
  var body: some View {
    VStack {
      HStack {
        Button("CLOSE") {
          showFilter.toggle()
        }
        
        Text("F(Filter) R(Recover) D(DEL)")
      }
      .padding(.bottom, 8)
      
      ScrollView {
        Grid {
          ForEach(0..<h(), id: \.self) { m in
              GridRow {
                VStack {
                  HStack {
                    
                    ForEach(0..<v(m), id: \.self) { n in
                      ZStack(alignment: .topTrailing) {
                        let items = fetchItems()
                        VStack {
                          Text("\(items[m*h_num() + n].raw)")
                          Text("\(items[m*h_num() + n].alias)")
                        }
                        .frame(minWidth: 25, minHeight: 40)
                        .foregroundStyle(Color.white)
                        .padding(.all, 8)
                        .background(items[m*h_num() + n].filted ? Color.gray : Color.red)
                        .cornerRadius(10)
                        .onTapGesture {
                          cellHit(m * h_num() + n)
                        }
                        
                        Image(systemName: "xmark.app")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 15, height: 15)
                          .background(Color.clear)
                          .padding([.top, .trailing], -3)
                          .onTapGesture {
                            cellHit(m * h_num() + n, del: true)
                          }
                      }
                    }
                    
                    Spacer()
                    
                    Button("—— F") {
                      for v in m * h_num()..<m * h_num() + v(m) {
                        cellHit(v, filter: true)
                      }
                    }

                    Button("R") {
                      for v in m * h_num()..<m * h_num() + v(m) {
                        cellHit(v, filter: false)
                      }
                    }
                    
                    Button("D") {
                      for v in Array(Array(m * h_num()..<m * h_num() + v(m)).reversed()) {
                        cellHit(v, del: true)
                      }
                    }
                  }
                  Divider()
                }
              }
          }
        }
        .padding(20)
      }
    }
    .padding(.vertical, 20)
    .padding(.leading, 20)
    .frame(maxHeight: 900)
  }
}

#Preview {
  FilterView(showFilter: .constant(true), config: AppConfigs.default)
}
