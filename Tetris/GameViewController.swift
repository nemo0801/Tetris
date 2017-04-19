//
//  GameViewController.swift
//  Tetris
//
//  Created by xiangyu on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  
  var scene :GameScene!
  var swiftris: Swiftris!
		
  override func viewDidLoad() {
    super.viewDidLoad()
    let skView = view as! SKView
    skView.isMultipleTouchEnabled = false
    scene = GameScene(size: skView.bounds.size)
    scene.scaleMode = .aspectFill
    
    scene.tick = didTick
    swiftris = Swiftris()
    swiftris.beginGame()
    skView.presentScene(scene)
    scene.addPreviewShapeToScene(shape: (swiftris.nextShape)!) {
      self.swiftris.nextShape?.moveTo(column: StartingColumn, row: StartingRow)
      self.scene.movePreviewShape(shape: (self.swiftris.nextShape)!) {
        let nextShapes = self.swiftris.newShape()
        self.scene.startTicking()
        self.scene.addPreviewShapeToScene(shape: (nextShapes.nextShape)!) {}
      }
    }
}
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  func didTick() {
    swiftris.fallingShape?.lowerShapeByOneRow()
    scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
  }
}
