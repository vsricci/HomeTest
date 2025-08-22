import Foundation
import SwiftUICore
import Combine


class AliasListViewModel: ObservableObject, Identifiable {
    @Published var listAlias: AliasResponse = AliasResponse(alias: [])
    @Published var isloding: Bool = false
    @Published var errorMessage: String?
    @Published public var searchText: String = ""
    
    private let aliasUseCase: AliasUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(aliasUseCase: AliasUseCase) {
        self.aliasUseCase = aliasUseCase
        setupBindings()
    }
    
    private func setupBindings() {
       $searchText
           .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
           .removeDuplicates()
           .sink { [weak self] alias in
               guard let self = self else { return }
               
               if !alias.isEmpty {
                   self.postAlias(aliasUrlString: alias)
               }
           }
           .store(in: &cancellables)
    }
    
    func postAlias(aliasUrlString: String) {
        isloding = true
        errorMessage = nil
        
        aliasUseCase.postAlias(aliasdUrlString: aliasUrlString) { result in
            DispatchQueue.main.async {
                self.isloding = false
                switch result {
                case .success(let alias):
                    self.listAlias.alias.append(alias)
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
