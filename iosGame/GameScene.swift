//
//  GameScene.swift
//  iosGame
//
//  Created by IŞIL VARDARLI on 24.09.2024.
//
import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var anaKarekter: SKSpriteNode = SKSpriteNode()
    var sariDaire:SKSpriteNode = SKSpriteNode()
    var kirmiziUcgen:SKSpriteNode = SKSpriteNode()
    var siyahKare:SKSpriteNode = SKSpriteNode()
    var skorLabel:SKLabelNode = SKLabelNode()
    //for connect to GameViewController
    var viewController : UIViewController?
    
    //controlling touching moves
    var touchingControl = false
    var timer: Timer?
    
    //beginning at the scene
    override func didMove(to view: SKView) {
        if let tempAnaKarekter = self.childNode(withName: "anakarekter") as? SKSpriteNode {
            anaKarekter = tempAnaKarekter
            anaKarekter.isUserInteractionEnabled = true
        }
        if let tempSariDaire = self.childNode(withName: "sariDaire") as? SKSpriteNode {
            sariDaire = tempSariDaire
        }
        if let tempKirmiziUcgen = self.childNode(withName: "kirmiziucgen") as? SKSpriteNode {
            kirmiziUcgen = tempKirmiziUcgen
        }
        if let tempSiyahKare = self.childNode(withName: "siyahkare") as? SKSpriteNode {
            siyahKare = tempSiyahKare
        }
        if let tempSkorLabel = self.childNode(withName: "skorLabel") as? SKLabelNode {
            skorLabel = tempSkorLabel
            skorLabel.text = "Skor: 0"
        }
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector (GameScene.hareketEttir), userInfo: nil, repeats: true)
    }
    
    @objc func hareketEttir() {
        
        if touchingControl {
            print("Hareket Ettir çalıştı: touchingControl: \(touchingControl)")
            let yukariHareket: SKAction = SKAction.moveBy(x: 0, y: +20, duration: 1)
            anaKarekter.run(yukariHareket)
        } else {
            let asagiHareket: SKAction = SKAction.moveBy(x: 0, y: -20, duration: 1)
            anaKarekter.run(asagiHareket)
        }
    }

    
    func touchDown(atPoint pos : CGPoint) {
        touchingControl = true
        print("ekrana dokundu, touchingControl: \(touchingControl)")
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
        touchingControl = false
        print("ekranı bıraktı, touchingControl: \(touchingControl)")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
        if let touch = touches.first {
            let position = touch.location(in: self)
            touchDown(atPoint: position)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.viewController?.performSegue(withIdentifier: "gameToSkor", sender: nil)
        if let touch = touches.first {
            let position = touch.location(in: self)
            touchUp(atPoint: position)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
