//
//  bluetooth.swift
//  Real_time
//
//  Created by Alex Rhodes on 9/21/23.
//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    // Bluetooth properties
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    // UUIDs for service and characteristic
    private let serviceUUID = CBUUID(string: "00002A02-0000-1000-8000-00805F9B34FB")
    private let characteristicUUID = CBUUID(string: "00002A00-0000-1000-8000-00805F9B34FB")
    
    // Initialize Bluetooth manager
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // Start scanning for nearby peripherals
    func startScanning() {
        centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
    }
    
    // Stop scanning for peripherals
    func stopScanning() {
        centralManager.stopScan()
    }
    
    // Connect to a peripheral
    func connect(to peripheral: CBPeripheral) {
        self.peripheral = peripheral
        centralManager.connect(peripheral, options: nil)
    }
    
    // Disconnect from the connected peripheral
    func disconnect() {
        if let peripheral = peripheral {
            centralManager.cancelPeripheralConnection(peripheral)
        }
    }
    
    // CBCentralManagerDelegate methods
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        } else {
            // Bluetooth is not available or turned off
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Found a peripheral, you can connect to it here if needed
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        // Disconnected from the peripheral
    }
    
    // CBPeripheralDelegate methods
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == serviceUUID {
                    peripheral.discoverCharacteristics([characteristicUUID], for: service)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                if characteristic.uuid == characteristicUUID {
                    peripheral.setNotifyValue(true, for: characteristic)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic.value != nil {
            // Received data from the peripheral
        }
    }
}
/*:
 ## ContentView.swift
    */
