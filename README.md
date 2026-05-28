# Synthetic Textures CNN: Spatial vs. Fourier Domain

This repository contains the Jupyter Notebooks (`.ipynb`) and data generation scripts used for training, evaluating, and analyzing the CNN model presented in our research on synthetic texture analysis.

## Repository Structure

* `generate_textures.m`: GNU Octave / MATLAB script used to mathematically generate homogeneous synthetic texture images using 2D convolutions with `valid` padding to eliminate edge artifacts.
* `train.ipynb`: Robust training pipeline for the CNN.
* `test_predictions.ipynb`: Evaluation script providing continuous regression metrics ($MAE$, $R^2$) and a proximity-based confusion matrix.
* `compare_convergence.ipynb`: Script to plot and compare training loss dynamics between Spatial and Fourier domains using Exponential Moving Average (EMA).

## How to Run (Google Colab & Google Drive)

These notebooks are configured to run seamlessly out of the box on **Google Colab** with **Google Drive integration**. The internal directory structures are preserved to match the dataset pathing.

### 1. Prerequisites & Environment
1. Open any of the `.ipynb` files directly in Google Colab.
2. Ensure you have your Google Drive mounted when executing the first cells.
3. Make sure your dataset is uploaded to your Google Drive under the corresponding paths specified in the scripts or update it accordingly.

### 2. Switching Between Domains (Spatial vs. Fourier)
To minimize errors and ensure reproducibility, the exact same code structure is used for both experiments. To switch between the **Fourier Domain** and **Spatial Domain**, simply navigate to imply navigate to the code you are testing (`train.ipynb` or `test_predictions.ipynb`) and uncomment your target configuration block.

## Dataset & Pre-trained Models

The complete datasets (training and test sets) along with the trained CNN models, are available as compressed `.zip` files in the **Releases** section of this repository.

To replicate the experiments:
1. Navigate to the **Releases** tab on the right side of this GitHub page.
2. Download `training_set.zip`, `test_set.zip`, and `models.zip`.
3. Extract them into your local environment or Google Drive, matching the directory paths expected by the notebooks.
