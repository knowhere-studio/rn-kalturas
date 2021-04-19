//
//  CounterView.swift
//  RnKalturasExample
//
//  Created by Sanjay Achar on 18/04/21.
//

import UIKit
class PlayerView: UIViewController {
  private var mediaServer = ""/// Set here your media server URL
  private var mediaUiConfID = "" /// Set here your UIConfigID
  private var mediaPartnerID = "" //// Set here your Partner ID
  
  var player : KPViewController!
  
  @objc func initialize() {
    let config = KPPlayerConfig(server: mediaServer, uiConfID: mediaUiConfID, partnerId: mediaPartnerID)
    config!.entryId = "1_u37jec51" /// Set here the video entryID
    config!.cacheSize = 0.8
    player = KPViewController(configuration: config)
    self.player.view.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height)
    self.player.loadPlayer(into: self)
    self.view.addSubview(player.view)
    self.present(self.player, animated: true, completion: nil);
    self.player.resumePlayer()
  }
  
//  override func viewDidAppear(_ animated: Bool) {
//    super.viewDidLoad()
//
//  }
  
  @objc func setServerUrl(url: String) {
    self.mediaServer = url
    NSLog("SET SERVER URL")
  }

  @objc func setParterId(PartnerId: String) {
    self.mediaPartnerID = PartnerId
    NSLog("SET PartnerId URL")
  }

  @objc func setUiConfId(UiConfId: String) {
    self.mediaUiConfID = UiConfId
    NSLog("SET UiConfId URL")
  }
  
  @objc func pause() {
    self.player.kPlayer.pause()
  }
  
  @objc func play() {
    self.player.kPlayer.play()
  }
  
  @objc func toggleFullScreen() {
    self.player.toggleFullscreen()
  }
}
