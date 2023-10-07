//
//  PlanetModel.swift
//  planets
//
//  Created by Saw Htet Naing on 05/10/2023.
//


//
//   let planetModel = try? JSONDecoder().decode(PlanetModel.self, from: jsonData)

import Foundation

// MARK: - PlanetModelElement
struct PlanetModelElement: Codable {
    let planetOrder: Int
    let name, description: String
    let basicDetails: BasicDetails
    let source: String
    let wikiLink: String
    let imgSrc: ImgSrc
    let id: Int
}

// MARK: - BasicDetails
struct BasicDetails: Codable {
    let volume, mass: String
}

// MARK: - ImgSrc
struct ImgSrc: Codable {
    let img: String
    let imgDescription: String
}

typealias PlanetModel = [PlanetModelElement]

