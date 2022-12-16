//  SceneFactory.swift
//  Created by aa on 12/15/22.

import UIKit

enum Scenes { case store, details, basket }

protocol ScenesFactory {
  func build(scene: Scenes) -> UIViewController
}

final class DefaultScenesFactory: ScenesFactory {
  func build(scene: Scenes) -> UIViewController {
    switch scene {
      case .store: return StoreSceneAssembly.build()
      case .details: return DetailsSceneAssembly.build()
      case .basket: return BasketSceneAssembly.build()
    }
  }
}
