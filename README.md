# Synthetic Textures CNN: Spatial vs. Fourier Domain

This repository contains the Jupyter Notebooks (`.ipynb`) used for training, evaluating, and analyzing the CNN model presented in our research on synthetic texture analysis.

## Repository Structure

* `train.ipynb`: Robust training pipeline for the 128x128 CNN.
* `test_predictions.ipynb`: Evaluation script providing continuous regression metrics ($MAE$, $R^2$) and a proximity-based confusion matrix.
* `compare_convergence.ipynb`: Script to plot and compare training loss dynamics between Spatial and Fourier domains using Exponential Moving Average (EMA).

## How to Run (Google Colab & Google Drive)

These notebooks are configured to run seamlessly out of the box on **Google Colab** with **Google Drive integration**. The internal directory structures are preserved to match the dataset pathing.

### 1. Prerequisites & Environment
1. Open any of the `.ipynb` files directly in Google Colab.
2. Ensure you have your Google Drive mounted when executing the first cells.
3. Make sure your dataset is uploaded to your Google Drive under the corresponding paths specified in the scripts.

### 2. Switching Between Domains (Spatial vs. Fourier)
To minimize errors and ensure reproducibility, the exact same code structure is used for both experiments. To switch between the **Fourier Domain** and **Spatial Domain**, simply navigate to **Section 1 (Path and Domain Configuration)** at the top of the notebook and uncomment your target configuration:

* **To run the Fourier Domain experiment:** Keep Configuration A uncommented and Configuration B commented out.
* **To run the Spatial Domain experiment:** Comment out Configuration A and uncomment Configuration B.
