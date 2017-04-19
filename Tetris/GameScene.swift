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
let BlockSize:CGFloat = 20.0

class GameScene: SKScene {
  
  let gameLayer = SKNode()
  let shapeLayer = SKNode()
  let layerPosition = CGPoint(x: 6, y: -6)
  
  var textureCache = [String: SKTexture]()
  
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
    
    addChild(gameLayer)
    
    let gameBoardTexture = SKTexture(image: #imageLiteral(resourceName: "gameboard"))
    let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: CGSize(width: BlockSize * CGFloat(NumColumns), height: BlockSize * CGFloat(NumRows)))
    gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
    gameBoard.position = layerPosition
    shapeLayer.position = layerPosition
    shapeLayer.addChild(gameBoard)
    gameLayer.addChild(shapeLayer)
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
  
  func poinitForColumn(column: Int, row: Int) -> CGPoint {
    let x = layerPosition.x + CGFloat(column) * BlockSize + BlockSize / 2
    let y = layerPosition.y - CGFloat(row) * BlockSize + BlockSize / 2
    return CGPoint(x: x, y: y)
  }
  
  func addPreviewShapeToScene(shape: Shape, completion:@escaping ()->()) {
    for (_, block) in shape.blocks.enumerated() {
      
      var texture = textureCache[block.spriteName]
      if texture == nil {
        texture = SKTexture(imageNamed: block.spriteName)
        textureCache[block.spriteName] = texture
      }
      let sprite = SKSpriteNode(texture: texture)
      
      sprite.position = poinitForColumn(column: block.column, row: block.row - 2)
      shapeLayer.addChild(sprite)
      block.sprite = sprite
      sprite.alpha = 0
      
      let moveAction = SKAction.move(to: poinitForColumn(column: block.column, row: block.row), duration: TimeInterval(0.2))
      moveAction.timingMode = .easeOut
      let fadeInAction = SKAction.fadeAlpha(to: 1, duration: 0.4)
      fadeInAction.timingMode = .easeOut
      sprite.run(SKAction.group([moveAction, fadeInAction]))
    }
    run(SKAction.wait(forDuration: 0.4), completion: completion)
  }
  
  func movePreviewShape(shape: Shape, completion:@escaping ()->()) {
    for ( _, block) in shape.blocks.enumerated() {
      let sprite = block.sprite!
      let moveAction = SKAction.move(to: poinitForColumn(column: block.column, row: block.row), duration: TimeInterval(0.2))
      moveAction.timingMode = .easeOut
      let fadeInAction = SKAction.fadeAlpha(to: 1.0, duration: 0.2)
      sprite.run(SKAction.group([moveAction, fadeInAction]))
    }
    run(SKAction.wait(forDuration: 0.2), completion: completion)
  }
  
  func redrawShape(shape: Shape,  completion:@escaping ()->()) {
    for ( _, block) in shape.blocks.enumerated() {
      let sprite = block.sprite!
      let moveAction = SKAction.move(to: poinitForColumn(column: block.column, row: block.row), duration: TimeInterval(0.05))
      moveAction.timingMode = .easeOut
      sprite.run(moveAction)
    }
    run(SKAction.wait(forDuration: 0.05), completion: completion)
  }
}
