//
//  GameViewController.swift
//  Crossover
//
//  Created by plumovic on 3/31/16.
//  Copyright (c) 2016 plumovic. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController, AVAudioPlayerDelegate
{

    @IBOutlet var startButton: UITapGestureRecognizer!
    
    var scene: GameScene!
    
    var bGSong = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let skView = view as! SKView
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        playBackgroundMusic("backgroundSong")
    }
    
    override func shouldAutorotate() -> Bool
    {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
    {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            return .AllButUpsideDown
        } else
        {
            return .All
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    //background song
    func playBackgroundMusic(filename: String)
    {
        let url = NSBundle.mainBundle().URLForResource("backgroundSong", withExtension: nil)
        
        do
        {
            bGSong = try AVAudioPlayer(contentsOfURL: url!)
            bGSong.numberOfLoops = -1
            bGSong.prepareToPlay()
            bGSong.play()
        }
        
        catch let error as NSError
        {
            print(error.description)
        }
    }
    
    
    
    
}
