# CEL-Case-study-Tidal-Wave-Energy-Production
This project models and simulates a tidal current turbine in MATLAB as a nonlinear rotational system driven by time-varying tidal currents. It analyzes the effect of inertia, damping, stiffness, and velocity on performance, and uses machine learning to predict power output efficiently from system behavior.
Here is a **clean, fully descriptive README.md (no bullet points)** written in a professional tone:

---

# Nonlinear Dynamic Modeling and ML-Based Power Prediction of a Tidal Current Turbine

## Project Overview

This project presents the modeling and simulation of a tidal current turbine using MATLAB, with an additional focus on predicting power output through a machine learning approach. The turbine system is represented as a nonlinear rotational mechanical model driven by time-varying tidal currents. The study aims to capture the interaction between hydrodynamic forces and mechanical response, providing a realistic understanding of turbine behavior under varying operating conditions.

## Objectives

The primary objective of this project is to analyze the dynamic response of a tidal turbine system by incorporating fundamental physical parameters such as inertia, damping, stiffness, and tidal velocity. The project also aims to compute the resulting power output and develop a machine learning model capable of predicting power efficiently based on system inputs.

## Mathematical Model

The system is governed by the rotational form of Newton’s Second Law, where the hydrodynamic torque acts as the driving force opposing inertia, damping, and stiffness effects. The torque is dependent on fluid properties and turbine geometry and varies with the square of the tidal velocity. The power output is obtained from the product of torque and angular velocity, while the tidal velocity itself is modeled as a sinusoidal function to represent real tidal variations.

## Implementation

The model is implemented in MATLAB using a numerical approach. The governing differential equation is solved using the ODE45 solver, which provides the time-dependent angular displacement and angular velocity of the turbine. These results are used to calculate torque and power output over the simulation period. A regression-based machine learning model is then applied to the generated data to predict power output using tidal velocity and angular velocity as inputs, improving efficiency in repeated evaluations.

## Results

The simulation results show that the turbine exhibits an oscillatory response due to the sinusoidal nature of tidal velocity. The power output varies dynamically with time and follows the trend of the tidal input. The machine learning model demonstrates a strong agreement with the simulated power values when multiple input parameters are considered, highlighting the importance of capturing system dynamics for accurate prediction.

## Applications

This project is relevant to renewable energy systems, particularly in the field of tidal energy generation. It can be applied to the analysis and optimization of offshore turbines, performance prediction, and integration with smart energy systems. The approach also supports the development of predictive tools for efficient energy management.

## Future Scope

The model can be further improved by incorporating real tidal data and more advanced machine learning techniques such as artificial neural networks. Additional enhancements may include the integration of computational fluid dynamics for more accurate representation of fluid behavior and optimization of turbine design parameters for improved performance.

## Conclusion

The project demonstrates how nonlinear dynamic modeling combined with machine learning can effectively analyze and predict the performance of tidal current turbines. It highlights the value of integrating physics-based models with data-driven techniques to improve the efficiency and reliability of renewable energy systems.

## Author

Tanay Mehta
B.Tech Mechanical Engineering

---

If you want, I can also make a **short version (for GitHub About section)** or a **high-impact version for portfolio**.
