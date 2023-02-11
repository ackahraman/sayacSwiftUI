//
//  ContentView.swift
//  sayac
//
//  Created by ahmet caner kahraman on 10.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var saniyeInput = 0
    //@State var salise = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func cevirici(saniyeDeger: Int)->String{
        let kalanSaniye = saniyeDeger % 60
        let kalanDakika = (saniyeDeger / 60) % 60
        let kalanSaat = saniyeDeger / 3600
        
        return String(format: "%02i:%02i:%02i", kalanSaat,kalanDakika,kalanSaniye)
    }
    
    let yayici = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            HStack{
                TextField(
                            "Saniye giriniz",
                            value: $saniyeInput, formatter:formatter
                        )
                .keyboardType(.numberPad)
                .padding()
                .frame(height: 60)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            }
            
            Text(cevirici(saniyeDeger:saniyeInput))
                .foregroundColor(.black)
                .font(.system(size: 50))
                .onReceive(yayici) { _ in
                    if(saniyeInput > 0)
                    {
                        saniyeInput -= 1
                    }
                }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(width: 400,height: 400)
        .background(.white)
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
