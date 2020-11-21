//
//  SceneDelegate.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import Foundation
import SwiftUI
import UIKit


//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//    let locationManager = LocationManager()
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        locationManager.startLocation()
//
//        let contentView = ContentView()
//
//        if let windowScene = scene as? UIWindowScene {
//            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = UIHostingController(rootView: contentView)
//            self.window = window
//            window.makeKeyAndVisible()
//        }
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        locationManager.stopLocation()
//    }
//
//    func getCurrentLocation() -> [String: Double]? {
//        return locationManager.getLastLocation()
//    }
//}
