//
//  CounterView.swift
//  RnKalturasExample
//
//  Created by Sanjay Achar on 18/04/21.
//

import UIKit
class CounterView: UIView {
  @objc var ServerUrl: NSString = "";
  @objc var PartnerId: NSString = "";
  @objc var UiConfId: NSString = "";
  
  var player = PlayerView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    player.setServerUrl(url: ServerUrl as String)
    player.setParterId(PartnerId: PartnerId as String)
    player.setUiConfId(UiConfId: UiConfId as String)
    player.initialize()
    
    self.addSubview(player.view)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func pause() {
    player.pause()
  }
  
  @objc func play() {
    player.pause()
  }
  
  @objc func toggleFullScreen() {
    player.toggleFullScreen()
  }
}
