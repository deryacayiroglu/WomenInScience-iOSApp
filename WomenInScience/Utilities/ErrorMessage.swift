//
//  ErrorMessage.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 25.02.2024.
//

import Foundation

enum ErrorMessage: String, Error {
    case unableTocomplete = "Unable to complete your request. Please check your internet connection"
    case invalidRequest = "Invalid request. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
