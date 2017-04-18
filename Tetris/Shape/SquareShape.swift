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
      Orientation.Zero : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.Ninety : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.OneEighty : [(0, 0),(1, 0),(0, 1),(1, 1)],
      Orientation.TwoSeventy : [(0, 0),(1, 0),(0, 1),(1, 1)]
    ]
  }
  
  override var bottomBlocksForOrientations: [Orientation: Array<Block>]{
    return [
      Orientation.Zero : [blocks[SecondBlockIdx],blocks[ThirdBlockIdx],blocks[FourthBlockIdx]],
      Orientation.Ninety : [blocks[FirstBlockIdx],blocks[FourthBlockIdx]],
      Orientation.OneEighty : [blocks[FirstBlockIdx],blocks[SecondBlockIdx],blocks[FourthBlockIdx]],
      Orientation.TwoSeventy : [blocks[FirstBlockIdx],blocks[SecondBlockIdx]]
    ]
  }

}
