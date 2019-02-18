//
//  AppDelegate.swift
//  ImagineDragonsAlbumsCoreSpotlight

import UIKit
import CoreSpotlight
import MobileCoreServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        if userActivity.activityType == CSSearchableItemActionType {
            if let userInfo = userActivity.userInfo {
                let selectedID = userInfo[CSSearchableItemActivityIdentifier] as! String
                if let selectedID = Int(selectedID.components(separatedBy: ".").last ?? "") {
                    guard let navigation = window?.rootViewController as? UINavigationController else { return true }
                    guard let vc = navigation.topViewController as? AlbumsListViewController else { return true }
                    vc.showDetail(for: selectedID)
                }
            }
        }
        return true
    }
}
