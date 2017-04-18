//
//  Shape.swift
//  Tetris
//
//  Created by JUXIN on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import Foundation
import SpriteKit

let NumOrientations: UInt32 = 4

enum Orientation: Int, CustomStringConvertible {
  case Zero = 0, Ninety, OneEight, TwoSeventy
  
  var description: String {
    switch self {
    case .Zero:
      return "0"
    case .Ninety:
      return "90"
    case .OneEight:
      return "180"
    case .TwoSeventy:
      return "270"
    }
  }
  
  static func random() -> Orientation {
    return Orientation(rawValue: Int(arc4random_uniform(NumOrientations)))!
  }
  
  static func rotate(orientation: Orientation, clockwise: Bool) -> Orientation {
    var rotated = orientation.rawValue + (clockwise ? 1 : -1)
    if rotated > orientation.rawValue {
      rotated = Orientation.Zero.rawValue
    } else if rotated < 0 {
      rotated = Orientation.TwoSeventy.rawValue
    }
    return Orientation(rawValue: rotated)!
  }
}

let NumShapeTypes: UInt32 = 7

//shape indexes
let FirstBlockIdx: Int = 0
let SecondBlockIdx: Int = 1
let ThirdBlockIdx: Int = 2
let FourthBlockIdx: Int = 3

class Shape: Hashable, CustomStringConvertible {
  let color: BlockColor
  var blocks = Array<Block>()
  var orientation: Orientation
  var column, row: Int
  init(column: Int, row: Int, color: BlockColor, orientation: Orientation) {
    self.column = column
    self.row = row
    self.color = color
    self.orientation = orientation
    initializeBlocks()
  }
  
  convenience init(column: Int, row: Int) {
    self.init(column: column, row: row, color: BlockColor.random(), orientation: Orientation.random())
  }
  
  final func initializeBlocks() {
    if let blockRowColumnTransLations = blockRowColumnPositions[orientation] {
      for i in 0..<blockRowColumnTransLations.count {
        let blockRow  = row + blockRowColumnTransLations[i].rowDiff
        let blockColumn = column + blockRowColumnTransLations[i].columnDiff
        let newBlock = Block(colunm: blockColumn, row: blockRow, color: color)
        blocks.append(newBlock)
      }
    }
  }
  var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return[:]
  }
  var bottomBlocksForOrientation: [Orientation: Array<Block>] {
    return[:]
  }
  var bottomBlocks: Array<Block> {
    if let bottomBlocks = bottomBlocksForOrientation[orientation] {
      return bottomBlocks
    }
    return []
  }

  var hashValue: Int {
    return blocks.reduce(0, {$0.hashValue ^ $1.hashValue})
  }
  var description: String {
    return "\(color) block facing \(orientation): \(blocks[FirstBlockIdx]), \(blocks[SecondBlockIdx]), \(blocks[ThirdBlockIdx]), \(blocks[FourthBlockIdx]), "
  }
  static func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column
  }
}
