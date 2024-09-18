# Preventing Sensitive Data Leaks in Flutter: Managing Memory Heap Effectively

This repository contains the code and resources related to the article "How to Prevent Sensitive Data Leaks in Flutter: Managing Memory Heap Effectively", where I discuss strategies to avoid leaving sensitive information, such as passwords and authentication tokens, in the memory heap.

## Table of Contents

[Introduction](#introduction)

[Problem](#problem)

[Setup](#setup)

[Contributing](#contributing)

## Introduction

This project complements the article where I explore best practices for managing sensitive data in mobile applications. Specifically, it shows how to ensure sensitive information does not remain in the memory heap after use, reducing potential security risks in Android, iOS, and Flutter applications.

Read the full article on [Medium](https://medium.com/@amarturelo/how-to-prevent-sensitive-data-leaks-in-flutter-managing-memory-heap-effectively-75769c58cf07).

## Problem

When frameworks like Android and Flutter don't efficiently manage memory, sensitive information such as passwords or tokens can temporarily remain in RAM, even after they are no longer in use. This can be dangerous during a security audit or if an attacker gains access to the device's memory.

## Setup

To run this project locally, follow these steps:

### Prerequisites

1. Flutter installed on your machine.
2. Android Studio or Xcode for running the project.
3. Optional: Setup for memory analysis tools on Android and iOS.

### Installation

1. Clone this repository:

   `git clone https://github.com/AMarturelo/flutter-memory-heap.git`
2. Navigate into the project directory:

   `cd flutter-memory-heap`

3. Install dependencies:

   `flutter pub get`

4. Run the project on your preferred emulator or device:

   `flutter run`

## Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.
