//
//  ViewController.swift
//  localVideoPlayer
//
//  Created by Hanson on 16/3/1.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var videoView: UITableView!
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    //定义AVPlayerViewController和AVPlayer
    var playerViewController = AVPlayerViewController()
    var playerView           = AVPlayer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //注意这里一定要添加datasource和delegate
        videoView.dataSource = self
        videoView.delegate   = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //播放按钮点击
    @IBAction func playButtonPress(_ sender: AnyObject) {
        
        print("button just pressed")
        
        let videoPath = Bundle.main.path(forResource: "eat", ofType: "mp4")
        
        print("video path is "+videoPath!)
        
        playerView = AVPlayer(url: URL(fileURLWithPath: videoPath!))
        
        playerViewController.player = playerView
        
        self.present(playerViewController, animated: true){
            self.playerViewController.player?.play()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = videoView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! TableViewCell
        
        let video = data[(indexPath as NSIndexPath).row]
        
        cell.screanShot.image = UIImage(named: video.image)
        cell.title.text       = video.title
        
        return cell
    }


}

