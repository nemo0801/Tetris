//
//  GameScene.swift
//  Tetris
//
//  Created by xiangyu on 2017/4/18.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import SpriteKit
import GameplayKit
let TichLengthLevekOne = TimeInterval(600)
class GameScene: SKScene {
  
  var tick: (()->())?
  var tickLengthMillis = TichLengthLevekOne
  var lastTick: NSDate?
  override init(size: CGSize) {
    super.init(size: size)
    anchorPoint = CGPoint(x: 0, y: 1.0)
    let a = SKSpriteNode(imageNamed:"background")
    a.position = CGPoint(x: 0, y: 0)
    a.anchorPoint = CGPoint(x: 0, y: 1.0)
    addChild(a)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func update(_ currentTime: TimeInterval) {
    guard lastTick != nil else { return }
    let timePassed = lastTick!.timeIntervalSinceNow * -1000.0
    if timePassed > tickLengthMillis {
      lastTick = NSDate()
      tick?()
    }
  }
  
  func startTicking() {
    lastTick = NSDate()
  }
  func stopTicking() {
    lastTick = nil
  }
}
