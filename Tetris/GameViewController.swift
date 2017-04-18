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
  override func viewDidLoad() {
    super.viewDidLoad()
    let skView = view as! SKView
    skView.isMultipleTouchEnabled = false
    scene = GameScene(size: skView.bounds.size)
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
}
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
