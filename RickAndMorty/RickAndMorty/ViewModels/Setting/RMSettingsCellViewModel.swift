//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/03.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    
    var id = UUID()
  
    public let type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void){
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    public var image: UIImage? {
        return type.iconImage
    }

    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColoer: UIColor {
        return type.iconContailnerColor
    }
}
