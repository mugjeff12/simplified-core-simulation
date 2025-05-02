# ⚛️ Simplified Core Simulation with Randomized Fuel Burnup & Leakage

This MATLAB project simulates a simplified nuclear reactor core made of a 10 by 10 grid of fuel rods. Over 100 simulation cycles, each fuel rod decays randomly and it leaks energy in a directional manner. The decay history is also monitored. The project also predicts inspection days for the next 10 years using Gauss's algorithm.

---

## 🧠 What This Project Covers

- 🎲 **Stochastic fuel burnup** modeled using random decay factors  
- 🔺 **Directional leakage** from upper-triangle elements simulating anisotropic energy loss  
- 📈 **Burnup history tracking** for visualization of decay behavior over time  
- 📅 **Maintenance scheduling** logic using modular arithmetic 
- 📊 **Heatmaps and decay plots** for core analysis

---

## 📁 File Structure

```
Core_Simulation/
├── Core_Simulation.m             # Main script
├── final_core_heatmap.png       # Heatmap of final energy levels
├── rod_decay_plot.png           # Burnup plots for selected rods
├── README.md                    # This file
```

---

## 🚀 How to Run the Simulation

1. Open `Core_Simulation.m` in MATLAB (R2020+ recommended)  
2. Run the script  
3. Two plots will be generated and saved automatically:
   - `final_core_heatmap.png`: Fuel energy distribution after burnup and leakage
   - `rod_decay_plot.png`: Energy decay over time for selected fuel rods  
4. Maintenance days will be printed to the command window


---

## 🧠 Conceptual Highlights

| Feature                 | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `Poisson-like decay`   | Each rod decays randomly by multiplying its current value with a [0–1] rand |
| `Upper-triangle leakage` | Models one-way leakage by subtracting 5% of energy from `i < j` elements   |
| `BurnHistory`          | 3D matrix tracks energy of each rod at each cycle                           |
| `Gauss's Algorithm`  | Determines day of week for inspections over the next 10 years               |

---

## 📄 License

MIT License — open for academic and professional use.

---

## 👨‍🔬 Author

**Mugdho Jeferson Rozario**  
Engineering Physics (Nuclear), McMaster University  
GitHub: [mugjeff12](https://github.com/mugjeff12)
