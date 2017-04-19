//
//  SquareShape.swift
//  Tetris
//
//  Created by JUXIN on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import Foundation
class SquareShape: Shape {
  /*
   |0||1|
   |2||3|
   
   
   * marks the row/column indicator for the shape
   */
  override var blockRowColumnPositions: [Orientation: [(columnDiff:Int, rowDiff: Int)]]{
    return [
      Orientation.zero : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.ninety : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.oneEighty : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.twoSeventy : [(0, 0),(1, 0),(0, 1),(1, 1)]
    ]
  }
  
  override var bottomBlocksForOrientations: [Orientation: Array<Block>]{
    return [
      Orientation.zero : [blocks[SecondBlockIdx],blocks[ThirdBlockIdx],blocks[FourthBlockIdx]],
      Orientation.ninety : [blocks[FirstBlockIdx],blocks[FourthBlockIdx]],
      Orientation.oneEighty : [blocks[FirstBlockIdx],blocks[SecondBlockIdx],blocks[FourthBlockIdx]],
      Orientation.twoSeventy : [blocks[FirstBlockIdx],blocks[SecondBlockIdx]]
    ]
  }

}
