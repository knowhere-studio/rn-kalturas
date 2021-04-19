import Foundation

@objc(PlayerViewManager)
class PlayerViewManager: RCTViewManager {
  
  override func view() -> UIView! {
    return PlayerView()
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc func pause(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! PlayerView
      
      component.pause()
    }
  }
  
  @objc func play(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! PlayerView
      
      component.play()
    }
  }
  
  @objc func toggleFullScreen(_ node: NSNumber) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! PlayerView
      
      component.toggleFullScreen()
    }
  }
}
