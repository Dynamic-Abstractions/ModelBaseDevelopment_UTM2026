# Introduction to Model-Based Design / Model-Based Development (MBD)

## 0.1 What is MBD? [ALL]

**Model-Based Design (MBD)** is the **systematic use of models throughout the development process** to improve how teams deliver complex systems. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[3](https://caterpillar.sharepoint.com/teams/CatGitHubUserGroup/Shared%20Documents/Forms/DispForm.aspx?ID=28&web=1)  
In this approach, the **model** (for example in MATLAB/Simulink) becomes the central engineering artifact used to:
- specify and validate requirements,
- design and implement algorithms,
- simulate system behavior,
- generate implementation artifacts (e.g., code generation where applicable),
- and support verification and validation activities. [2](https://caterpillar.sharepoint.com/teams/CATutilsUsersGroup/Shared%20Documents/MAB%202018/2021_MAB_Files/Breakouts/Day%203%20Session%20G%20-%20Building%20Simulink%20Simulation%20Apps.pdf?web=1)[1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)

> In short: in MBD, a model is not only a diagram—it is an **executable specification** that you can simulate to test, refine, and verify design intent. [2](https://caterpillar.sharepoint.com/teams/CATutilsUsersGroup/Shared%20Documents/MAB%202018/2021_MAB_Files/Breakouts/Day%203%20Session%20G%20-%20Building%20Simulink%20Simulation%20Apps.pdf?web=1)

---

## 0.2 Why MBD matters (motivation) [ALL]

MBD is widely adopted to shorten development cycles and reduce risk by enabling:
- **Fast, repeatable testing** through modeling and simulation. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[3](https://caterpillar.sharepoint.com/teams/CatGitHubUserGroup/Shared%20Documents/Forms/DispForm.aspx?ID=28&web=1)  
- **Automation** of key steps (for example reporting, verification, and implementation workflows), which reduces manual effort and human error. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[3](https://caterpillar.sharepoint.com/teams/CatGitHubUserGroup/Shared%20Documents/Forms/DispForm.aspx?ID=28&web=1)  
- A **digital thread**: traceability from requirements and architecture to design and tests. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[5](https://app.powerbi.com/groups/dfc32723-ee41-47a0-8fc6-df9b126223a2/reports/17ef0a85-54d5-4461-b5f8-1363ef4372bc?pbi_source=Substrate)  
- Reuse of models beyond development (e.g., operational optimization and digital-twin style uses depending on context). [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[2](https://caterpillar.sharepoint.com/teams/CATutilsUsersGroup/Shared%20Documents/MAB%202018/2021_MAB_Files/Breakouts/Day%203%20Session%20G%20-%20Building%20Simulink%20Simulation%20Apps.pdf?web=1)  

---

## 0.3 MBD as an “executable specification” [M][P]

In MBD, engineers create a model to specify system behavior. That model acts as an executable specification that allows teams to:
- test/refine/retest designs throughout development,
- explore alternatives without building expensive prototypes,
- perform early and continuous verification rather than late-stage only,
- and (when applicable) generate code from models, reducing manual coding and associated errors. [2](https://caterpillar.sharepoint.com/teams/CATutilsUsersGroup/Shared%20Documents/MAB%202018/2021_MAB_Files/Breakouts/Day%203%20Session%20G%20-%20Building%20Simulink%20Simulation%20Apps.pdf?web=1)

This is especially valuable when systems are:
- expensive or risky to test physically,
- real-time,
- hardware-constrained,
- or safety-relevant. [3](https://caterpillar.sharepoint.com/teams/CatGitHubUserGroup/Shared%20Documents/Forms/DispForm.aspx?ID=28&web=1)

---


A practical way to understand MBD is through its workflow:
**Requirements → Design → Implementation → Integration & Test/Verification**, where models are used continuously to simulate, verify, and automate deliverables across phases.

### Figure: Model-Based Design workflow (MathWorks reference)

<div align="center">
  <img src="https://www.mathworks.com/content/dam/mathworks/mathworks-dot-com/images/responsive/supporting/solutions/modelbaseddesign/model-based-design-workflow-vertical.svg"
       alt="MathWorks Model-Based Design workflow diagram"
       style="max-width: 75%; height: auto;" />
</div>

<small>

**Source (reference):** MathWorks — Model-Based Design overview page.  
https://www.mathworks.com/solutions/model-based-design.html

</small>

During design, the model can include (depending on project scope):
- environment models,
- physical component/plant models,
- algorithms/control logic,
and then connect to verification and integration activities. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[3](https://caterpillar.sharepoint.com/teams/CatGitHubUserGroup/Shared%20Documents/Forms/DispForm.aspx?ID=28&web=1)


### Figure: Example Model-Based Design workflow in Simulink (MathWorks reference)

<div align="center">
  <img src="https://in.mathworks.com/help/simulink/gs/example_workflow.png"
       alt="Example Model-Based Design workflow in Simulink"
       style="max-width: 80%; height: auto;" />
</div>

<small>

**Source (reference):** MathWorks Simulink Documentation — Model-Based Design with Simulink.  


---

## 0.5 Important clarification: “MBD” can also mean something else [ALL]

In some domains (for example CAD and mechanical design), “MBD” is also used for **Model Based Definition**, meaning 3D models are used as the primary design definition instead of 2D drawings. [4](https://caterpillar.sharepoint.com/teams/ECMS/req/ISO%2026262-10-2012,%20Road%20vehicles%20%20%20Functional%20safety%20%20%20Part%2010%20-Guideline%20on%20ISO%2026262.pdf?web=1)  
**In this repository**, “MBD” refers to **Model-Based Design / Model-Based Development** for control and software-intensive systems.

---

## 0.6 How MBD is applied in this project (LKA + CARLA + Simulink + DIL) [ALL]

This repository applies MBD to build a reusable **Lane Keeping Assist (LKA)** reference application with:
- **Simulink** as the development center (the executable model),
- **CARLA** for scenario simulation and environment context,
- **Driver-in-the-Loop (DIL)** using a Logitech steering wheel to study driver override and interaction.

MBD enables this project to:
1) design and simulate the controller before relying on real vehicle hardware,  
2) verify behavior with repeatable scenarios and metrics, and  
3) maintain traceability from requirement → test → evidence as part of a digital thread approach. [1](https://caterpillar.sharepoint.com/teams/LWLWDCOn-boardingandLearning/Shared%20Documents/01%20Performance%20Controls%20Learning%20Library/12%20Functional%20Safety/Functional%20Safety%20of%20Control%20Systems%20-%20Overview%20and%20Functional%20Safety%20Letter%20Template%20instructions.pdf?web=1)[5](https://app.powerbi.com/groups/dfc32723-ee41-47a0-8fc6-df9b126223a2/reports/17ef0a85-54d5-4461-b5f8-1363ef4372bc?pbi_source=Substrate)

---

## 0.7 What readers should gain from this section [M][P][E]

After this introduction, readers should be able to:
- explain what MBD is and why the model is central to development,
- understand how MBD links requirements, simulation, tests, and evidence,
- and see how this approach is implemented in the LKA reference application.

**Suggested next chapter:** `docs/01_System_Overview.md`
``
