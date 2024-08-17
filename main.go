// ElevenTray
// Version: 1.0.2
// Created on: 2024-08-14
// Last Updated: 2024-08-16
// Author: Ray Heffer
// Website: https://lockdown.media
// License: GNU General Public License v3.0

// This program is intended for use on Windows 11 operating systems. For more information, see the README.md file included with this project.

package main

import (
	"log"
	"os"
	"time"

	"golang.org/x/sys/windows/registry"
)

func monitorNotifyIconSettings() {
	keyPath := `Control Panel\NotifyIconSettings`
	k, err := registry.OpenKey(registry.CURRENT_USER, keyPath, registry.QUERY_VALUE|registry.ENUMERATE_SUB_KEYS)
	if err != nil {
		log.Fatalf("Error opening registry key: %v", err)
	}
	defer k.Close()

	// Check for hidden system tray icons in the registry
	for {
		subKeys, err := k.ReadSubKeyNames(-1)
		if err != nil {
			log.Printf("Error reading subkeys: %v", err)
			continue
		}

		for _, subKey := range subKeys {
			iconKey, err := registry.OpenKey(k, subKey, registry.SET_VALUE|registry.QUERY_VALUE)
			if err != nil {
				log.Printf("Error opening subkey: %v", err)
				continue
			}

			// Check current IsPromoted value
			currentValue, _, err := iconKey.GetIntegerValue("IsPromoted")
			if err != nil || currentValue != 1 {

				// Read the ExecutablePath value from the subkey (used to log executable in system tray)
				execPath, _, err := iconKey.GetStringValue("ExecutablePath")
				if err != nil {
					execPath = "Unknown"
				}

				err = iconKey.SetDWordValue("IsPromoted", 1)
				if err != nil {
					log.Printf("Error setting IsPromoted for subkey %s: %v", subKey, err)
				} else {
					log.Printf("Set IsPromoted=1 for subkey %s (ExecutablePath: %s)", subKey, execPath)
				}
			}

			iconKey.Close()
		}

		time.Sleep(10 * time.Second) // Run check every 10 seconds
	}
}

func main() {
	// Open (or create) log file in the current directory
	logFilePath := "ElevenTray.log"
	f, err := os.OpenFile(logFilePath, os.O_RDWR|os.O_CREATE|os.O_APPEND, 0666)
	if err != nil {
		log.Fatalf("Error opening log file: %v", err)
	}
	defer f.Close()

	log.SetOutput(f)
	log.Println("Starting ElevenTray")
	defer log.Println("Process terminated!")

	// Start monitoring
	monitorNotifyIconSettings()
}
