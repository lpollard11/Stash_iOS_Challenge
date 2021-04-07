# Stash_iOS_Challenge
This app is a small demo for the purpose of demonstrating my understanding of iOS Development best practices. Here is an overview of how the code is structured.

## Installation
- Open the project using Xcode 12.4.

## VIPER Architecture
The app uses the VIPER architecture. Interactors are responsible for loading data from Services and Presenters are responsible for relaying user input as well as generating data that will be used by the View Controllers. View Controllers are repsonsible for laying out the data returned to them by the Presenters. Routers are responsible for building the VIPER stack and returning the entire view.

## Services
Each feature has its own Service to make API calls.

## Dependency Injection
The app uses Dependency Injection to avoid tight coupling. All dependencies are defined as protocols, allowing mock implementations to be injected for the purpose of unit testing.
