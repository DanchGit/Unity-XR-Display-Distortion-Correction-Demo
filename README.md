# Unity XR Display Pre-Distortion for Distortion Correction

Unity prototypes demonstrating **image-space pre-distortion** techniques used in XR display pipelines, focusing on:

- Radial geometric distortion (barrel / pincushion)
- Lateral chromatic aberration (LCA)

The goal of this project is to show how virtual content can be **pre-distorted in software** so that, after optical distortion, the **perceived image appears correct**.
 
> All parameters are **synthetic** and chosen to make the effects clearly visible.
> 
> This repository demonstrates the *logic* of pre-distortion and correction, both of which are simulated

---

## What this demo shows

- Barrel and Pincushion distortions and their **inverse pre-distortion correction**
- Chromatic aberration and **per-channel pre-correction**
- Unity-based implementation using shaders and simple runtime controls

---

## Scenes

- **Scene 1 — Barrel/Pincushion Distortion Pipeline**  
  Barrel and pincushion distortion applied to a checkerboard pattern, with toggleable pre-distortion correction.

- **Scene 2 — Chromatic Aberration Pipeline**  
  Chromatic aberration applied to a Siemens sinusoidal star pattern, with toggleable pre-distortion correction.

Each scene allows visual comparison between:
- original content
- optics distortion only
- pre-distortion only
- pre-distortion + optics distortion (corrected result)
 
---

## Images



---


## How to implement

1. Open the Unity project.
2. Load a scene from the `Scenes/` folder.
3. Use the exposed toggles and parameters to inspect distortion and correction behavior.

---

## License

This repository is provided for demonstration and educational purposes.
