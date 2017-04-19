//
//  Array2D.swift
//  Tetris
//
//  Created by JUXIN on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import Foundation
class Array2D<T> where T: Hashable {
  let columns: Int = 0
  let rows: Int = 0
  var array: Array<T?> = []
  
  init(columns: Int, rows: Int) {
    array = Array<T?>(repeatElement(nil, count: columns * rows))
  }
  subscript(column: Int, row: Int) ->T?{
    get {
      return array[(column * row) + column]
    }
    set {
      array[(column * row) + column] = newValue
    }
  }
}
