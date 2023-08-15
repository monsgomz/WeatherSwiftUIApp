//
//  WeatherButton.swift
//  WeatherEjercicio
//
//  Created by Montserrat Gomez on 2023-08-15.
//

import SwiftUI

//porque el boton se va a utilizar en toda la aplicacion, por eso en archivo separado
struct WeatherButton: View{
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        
        Text(title)
            .frame(width: 200, height: 50, alignment: .center)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

 
