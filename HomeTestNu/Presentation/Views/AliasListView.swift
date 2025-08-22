import Foundation
import SwiftUI
import SwiftUICore

struct AliasListView: View {
    @ObservedObject private var viewModel: AliasListViewModel
    @State private var aliasUrlString: String = ""
    
    init(viewModel: AliasListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter a alias", text: $aliasUrlString)
                    .padding()
                
                Button("Send") {
                    self.viewModel.postAlias(aliasUrlString: aliasUrlString)
                }
                
                if viewModel.isloding {
                    ProgressView("Loading...")
                    
                } else if let errotMessage = viewModel.errorMessage {
                    Text(errotMessage)
                        .foregroundColor(.red)
                }
                else {
                    List(viewModel.listAlias.alias, id: \.alias) { alias in
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(alias.alias)
                                    .font(.headline)
                                Text(alias._links.alias)
                                    .lineLimit(3)
                                Text(alias._links.short)
                                    .lineLimit(3)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Alias")
        }
    }
}
