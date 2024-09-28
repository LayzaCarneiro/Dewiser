//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI

struct ProConsView: View {
    @ObservedObject var cardViewModel: CardViewModel

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                HStack(spacing: 60) {
                    VStack {
                        Text("Pros")

                        ProgressBar(progress: cardViewModel.prosPercentage())

                        ForEach(cardViewModel.cardModel.pros) { pro in
                            ProCard(content: pro.content)
                        }

                        Button {
                            cardViewModel.addPro(content: "")
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()

                    }

                    VStack {
                        Text("Cons")

                        ProgressBar(progress: cardViewModel.consPercentage())

                        ForEach(cardViewModel.cardModel.cons) { con in
                            ProCard(content: con.content)
                        }

                        Button {
                            cardViewModel.addCon(content: "")
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
