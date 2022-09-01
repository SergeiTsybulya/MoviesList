//
//  DescriptionModel.swift
//  MovieList
//
//  Created by Sergei Tsybulya on 31.08.2022.
//  Copyright © 2022 STDevelopment. All rights reserved.
//

import UIKit

//protocol hashDescription {
//    var title: String { get }
//    var year: Int { get }
//}

struct Description: Hashable, Equatable {
    let title: String
    let year: Int
}
