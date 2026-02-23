# Chapter 1 — System Overview (LKA Reference Application)

**Audience**
- **[M]** Master’s students + senior undergrad engineers (higher semesters): run, modify, test, contribute safely
- **[P]** PhD students: identify research gaps, evaluate robustness/limits, design experiments
- **[E]** Engineering-grade: maintain traceability, evidence, and ISO 26262-aligned artifacts (mapping only)

---

## 1.1 Purpose of this Project [ALL]

This repository documents and implements a **reusable reference application** for **Lane Keeping Assist (LKA)** using:

- **MATLAB/Simulink** for model-based design (MBD), controller logic, and structured test workflows  
- **CARLA** for scenario simulation and road/lane context  
- **Driver-in-the-Loop (DIL)** via a **Logitech steering wheel** interface for manual driving + override behavior

The goal is to support:
- reproducible learning labs (Master’s/senior engineers),
- research extensions (PhD),
- and engineering-grade structure (requirements, tests, evidence, ISO 26262 mapping).

---

## 1.2 What “LKA” means here [ALL]

**Lane Keeping Assist (LKA)** is treated as a steering assist function that aims to:
- reduce lane deviation (keep vehicle near lane center),
- respect steering limits,
- allow driver override and safe disengagement behaviors.

This repo focuses on a *closed-loop* system view:
scenario → lane/perception signals → controller → steering command → vehicle response → metrics.

---

## 1.3 System Boundary and Key Assumptions [E]

### In scope
- Scenario execution and lane/road context from CARLA
- Controller logic and integration in Simulink
- Closed-loop testing across MIL / co-sim / DIL layers
- Evidence generation (logs, plots, metrics reports)

### Out of scope (for this reference application)
- Production ECU integration & calibration processes
- Formal ISO 26262 compliance claims (we do mapping only)
- Cybersecurity requirements

---

## 1.4 High-Level Architecture [ALL]

At a high level, the reference application is organized into four blocks:

1. **Scenario + World Simulation (CARLA)**
2. **Co-simulation / Integration Bridge**
3. **Controller + Supervisor (Simulink)**
4. **Driver Interface (Logitech Wheel) for DIL runs**

### CARLA architectural note [E]
CARLA is organized as a **client-server model**: a C++ server wraps a modified Unreal Engine and communicates with clients via RPC; developers commonly interface via Python clients. CARLA also uses an **OpenDrive** network topology layer to represent road/lane structure and support lane-related API behaviors. [6](https://revealjs.com/plugins/)

---

## 1.5 Data Flow (Signals and Control Loop) [ALL]

### Typical closed loop
1. CARLA runs the world and produces vehicle state + lane context.
2. The integration bridge transfers relevant signals to Simulink.
3. Simulink computes steering assist command and supervisory state (enable/disable).
4. The command returns to CARLA to actuate the vehicle.
5. Logging/metrics capture results.

### What gets logged (minimum)
- controller outputs (steering command, enable state)
- lane-related measures (e.g., deviation, heading/yaw alignment—depending on available signals)
- timing (timestamps/latency markers)
- scenario identifiers and parameter sets for reproducibility

---

## 1.6 Operating Modes: MIL → Co-sim → DIL [ALL]

This project supports a laddered validation strategy:

### MIL — Model-in-the-Loop [M]
- Simulink-only closed-loop (controller + plant/model)
- fast iteration and debugging of controller logic

### Co-sim — Simulink + CARLA [M]
- closed-loop with CARLA providing scenario and world context
- captures integration realities (timing, bridge behavior)

### DIL — Driver-in-the-Loop (Simulink + CARLA + wheel) [M][E]
- manual steering input is provided by a Logitech wheel interface
- used to evaluate override behavior and driver interaction characteristics

### Testing infrastructure note [E]
A structured testing approach often uses a **test harness** to isolate the component under test within a synchronized simulation environment, along with authoring and managing simulation-based tests and generating reports. [7](https://engage.cloud.microsoft/main/threads/eyJfdHlwZSI6IlRocmVhZCIsImlkIjoiMzM5NTg0MTg1NTc4MjkxMiJ9)

---

## 1.7 Scenario Definition Approach [M][P]

We document scenarios in a catalog and aim for repeatability. For CARLA scenario execution, two patterns are commonly considered:
- **Direct CARLA Python API scripts**
- **OpenSCENARIO via CARLA ScenarioRunner**

An internal design note highlights OpenSCENARIO as a better path to generalization, while also noting support constraints that must be considered in CARLA tooling decisions. [8](https://github.com/w3tecch/reveal.js-boilerplate)

---

## 1.8 Why these tools (short rationale) [ALL]

A simulator survey note highlights that:
- **CARLA** is well-suited for end-to-end testing of self-driving functionality due to built-in automated features and bridge patterns,
- **MATLAB/Simulink** is a strong choice for testing upper-level algorithms due to clear model logic and fast analysis. [9](https://martenbe.github.io/mkslides/)

---

## 1.9 Deliverables of this Chapter [ALL]

By the end of Chapter 1, contributors should understand:
- what the LKA reference application is,
- what components exist and how they connect,
- what “modes” are supported (MIL/co-sim/DIL),
- where scenarios and tests live,
- what evidence outputs are expected.

**Next chapter (suggested):** `docs/02_Architecture_and_Interfaces.md` (block responsibilities + ICD)

---

## 1.10 Glossary (starter) [ALL]
- **LKA** — Lane Keeping Assist  
- **MBD** — Model-Based Design / Model-Based Development  
- **MIL** — Model-in-the-Loop  
- **Co-sim** — Co-simulation (Simulink + CARLA)  
- **DIL** — Driver-in-the-Loop  
- **ICD** — Interface Control Document  
- **ODD** — Operational Design Domain  
