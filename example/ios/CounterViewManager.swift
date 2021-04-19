//
//  CounterViewManager.swift
//  RnKalturasExample
//
//  Created by Sanjay Achar on 18/04/21.
//

import Foundation

@objc(CounterViewManager)
class CounterViewManager: RCTViewManager {
  
  override func view() -> UIView! {
    return CounterView()
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc func pause(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! CounterView
      
      component.pause()
    }
  }
  
  @objc func play(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! CounterView
      
      component.play()
    }
  }
  
  @objc func toggleFullScreen(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! CounterView
      
      component.toggleFullScreen()
    }
  }
}
