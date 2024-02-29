//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Emre Yilmaz on 2024-02-27.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding()
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
