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

# Images
## Barrel Distortion (Low)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Checkerboard Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Barrel/Barrel_0.1.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated Barrel Distortion (Low)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Barrel/PreCorrected_0.07.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Barrel/Barrel_0.1_Corr_0.07.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>

## Barrel Distortion (High)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Checkerboard Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Barrel/Barrel_0.4.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated Barrel Distortion (High)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Barrel/PreCorrected_0.3.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Barrel/Barrel_0.4_Corr_0.3.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>

## Pincushion Distortion (Low)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Checkerboard Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PC_neg0.1.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated Pincushion Distortion (Low)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PreCorrected_neg0.1.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PC_neg0.1_Corr_neg0.1.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>


## Pincushion Distortion (High)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Checkerboard Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PC_neg0.14.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated Pincushion Distortion (High)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PreCorrected_neg0.14.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Pincushion/PC_neg0.14_Corr_neg0.14.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>

## Chromatic Abberration (Low)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/CA Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/CA_0.01.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated CA (Low)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/precorrected_0.01.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/CA_corrected_0.01.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>

## Chromatic Abberration (High)
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/CA Original.png" style="max-width:100%;"/>
      <br/>
      <em>Reference Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/CA_0.04.png" style="max-width:100%;"/>
      <br/>
      <em>Simulated CA (High)</em>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/precorrected_0.04.png" style="max-width:100%;"/>
      <br/>
      <em>Pre-Corrected Image</em>
    </td>
    <td align="center" width="50%">
      <img src="Images/Chromatic Aberration/CA_corrected_0.04.png" style="max-width:100%;"/>
      <br/>
      <em>Distorted Image appears close to reference image</em>
    </td>
  </tr>
</table>

---


## How to implement

1. Open the Unity project.
2. Load a scene from the `Scenes/` folder.
3. Click on the Main Camera in the inspector pannel.
4. Use the exposed toggles and parameters to inspect distortion and correction behavior.

---

## License

This repository is provided for demonstration and educational purposes.
