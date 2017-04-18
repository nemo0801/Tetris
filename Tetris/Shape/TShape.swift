//
//  TShape.swift
//  Tetris
//
//  Created by xiangyu on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import Foundation
class TShape: Shape{
  /*
   orientation 0
   *  |0|
   |1||2||3|
   
   orientation 90
   *  |1|
      |2||0|
      |3|
   
   orientation 180
   *                    or             *
   |3||2||1|                           |1||2||3|
      |0|                                 |0|
   
   orientation 270
   *  |3|               or             *    |1|
   |0||2|                                |0||2|
      |1|                                   |3|
   
   * marks the row/column indicator for the shape
   */
  override var blockRowColumnPositions: [Orientation: [(columnDiff:Int, rowDiff: Int)]]{
    return [
      Orientation.Zero : [(1,0),(0,1),(1,1),(2,1)],
      Orientation.Ninety : [(2,1),(1,0),(1,1),(1,2)],
      Orientation.OneEighty : [(1,2),(2,1),(1,1),(0,1)],
      Orientation.TwoSeventy : [(0,1),(1,2),(1,1),(1,0)]
    ]
  }
  
  override var bottomBlocksForOrientations: [Orientation: [Block]]{
    return [
      Orientation.Zero : [blocks[SecondBlockIdx],blocks[ThirdBlockIdx],blocks[FourthBlockIdx]],
      Orientation.Ninety : [blocks[FirstBlockIdx],blocks[FourthBlockIdx]],
      Orientation.OneEighty : [blocks[FirstBlockIdx],blocks[SecondBlockIdx],blocks[FourthBlockIdx]],
      Orientation.TwoSeventy : [blocks[FirstBlockIdx],blocks[SecondBlockIdx]]
    ]
  }
  
  
}
