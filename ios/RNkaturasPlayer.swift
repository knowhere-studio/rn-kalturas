import UIKit

@objc(RNKalturasPlayer)

class RNKalturasPlayer: UIViewController {
  
  private let mediaServer = "https://cdnapisec.kaltura.com"/// Set here your media server URL
  private let mediaUiConfID = "3286493" /// Set here your UIConfigID
  private let mediaPartnerID = "47413073" /// Set here your Partner ID

  var player : KPViewController!

  override func viewDidLoad() {
  super.viewDidLoad()
  let config = KPPlayerConfig(server: mediaServer, uiConfID: mediaUiConfID, partnerId: mediaPartnerID)
  config!.entryId = "1_8rpp7ak3" /// Set here the video entryID
  config!.cacheSize = 0.8
  player = KPViewController(configuration: config)
  }

  override func viewDidAppear(_ animated: Bool) {
  super.viewDidLoad()

  self.player.view.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.width / 16 * 9)
  self.player.loadPlayer(into: self)

  self.view.addSubview(player.view)
  }
}
