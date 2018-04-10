//
//  AVViewController.swift
//  DH_Library
//
//  Created by user on 2017/8/29.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import AVFoundation

class AVViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    func playBgMusic(){
        let musicPath = Bundle.main.path(forResource: "bgmusic", ofType: "mp3")
        //指定音乐路径
        let url = NSURL(fileURLWithPath: musicPath!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
            audioPlayer.numberOfLoops = -1
            //设置音乐播放次数，-1为循环播放
            audioPlayer.volume = 1
            //设置音乐音量，可用范围为0~1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch  {
            
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
