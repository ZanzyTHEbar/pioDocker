#pragma once
#ifndef UTILITIES_hpp
#define UTILITIES_hpp
#include <Arduino.h>
#include <WiFi.h>
#include <unordered_map>
#include "mbedtls/md.h"
namespace Network_Utilities
{
    bool LoopWifiScan();
    void SetupWifiScan();
    void my_delay(volatile long delay_time);
    int CheckWifiState();
    int getStrength(int points);
    static std::string shaEncoder(const std::string &data);
}
#endif // !UTILITIES_hpp