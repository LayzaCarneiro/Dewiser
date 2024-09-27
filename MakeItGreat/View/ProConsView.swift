//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI

struct ProConsView: View {
    @ObservedObject var proViewModel: ProViewModel

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                HStack(spacing: 60) {
                    VStack {
                        Text("Pros")

                        ForEach(proViewModel.pros) { pro in
                            ProCard()
                        }

                        Button {
                            proViewModel.addPro(content: "")
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()

                    }

                    VStack {
                        Text("Cons")

                        ForEach(proViewModel.cons) { con in
                            ProCard()
                        }

                        Button {
                            proViewModel.addCon(content: "")
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ProConsView()
//}
