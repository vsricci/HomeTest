//
//  HomeTestNuApp.swift
//  HomeTestNu

import Foundation
import SwiftUI

@main
struct HomeTestNuApp: App {
    var body: some Scene {
        WindowGroup {
            
            let apiService = APIService(session: URLSession(configuration: .default))
            let movieRepository = AliasRepositoryImp(apiService: apiService)
            let aliasUseCase = AliasUseCase(repository: movieRepository)
            let viewModel = AliasListViewModel(aliasUseCase: aliasUseCase)
            AliasListView(viewModel: viewModel)
        }
    }
}
