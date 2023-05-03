//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/03.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable{
    
    var id = UUID()
  
    private let type: RMSettingsOption
    
    init(type: RMSettingsOption){
        self.type = type
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
