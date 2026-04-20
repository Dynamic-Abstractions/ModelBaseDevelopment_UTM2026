# LKA Reference Application (MBD + CARLA + Driver-in-the-Loop)

**Audience:**  
- [M] Master’s students & senior undergrad engineers (higher semesters): run, modify, test  
- [P] PhD students: research experiments, robustness limits, ablation studies  
- [E] Engineering-grade: requirements, traceability, evidence, ISO 26262 mapping  

## What this project is
A reusable reference application for Lane Keeping Assist (LKA) using:
- MATLAB/Simulink for controller + plant/model integration
- CARLA for scenario simulation and sensor/road context
- Logitech steering wheel for Driver-in-the-Loop (DIL)

## What this project is not
- Not a certified safety product
- Not a claim of ISO 26262 compliance  
(We provide an **ISO 26262-aligned mapping** of artifacts and evidence.)

## Requirements

- CARLA Simulator 0.10.0
- Python 3.11.x
- MATLAB 2024a
  
## Quickstart
1. Follow `docs/00_Quickstart.md`
2. Run baseline scenario: `docs/06_Scenarios.md#baseline`
3. Validate outputs: `docs/08_Metrics.md` + `results/baseline/`

## How to contribute
- See `docs/09_Results_Reproducibility.md`
- Every change must update: Requirement → Test → Evidence link
- Use tags: [M], [P], [E]

## Documentation map
- Concept & boundaries: `docs/01_ConOps.md`, `docs/02_ODD_Assumptions.md`
- Architecture & interfaces: `docs/03_Architecture.md`, `docs/04_Interface_Control_Document.md`
- Requirements & scenarios: `docs/05_Requirements.md`, `docs/06_Scenarios.md`
- Testing & metrics: `docs/07_TestPlan.md`, `docs/08_Metrics.md`
- ISO mapping: `safety_iso26262_mapping/`
