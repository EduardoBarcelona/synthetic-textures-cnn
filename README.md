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

## Citation

If you find this code or dataset useful for your research, please cite our paper published in *The Visual Computer*:

```text
Barcelona, E. B., Martins, A. C. G. (2026). Source Code and Datasets for Synthetic Texture Analysis using CNN (Spatial vs. Fourier Domain). The Visual Computer.

You can also use the following BibTeX entry for LaTeX integration:

@article{barcelona2026synthetic,
  author    = {Barcelona, Eduardo Bianucci and Martins, Antonio Cesar Germano},
  title     = {Source Code and Datasets for Synthetic Texture Analysis using CNN (Spatial vs. Fourier Domain)},
  journal   = {The Visual Computer},
  year      = {2026},
  publisher = {Springer}
}
```


## Requirements and Dependencies

The code in this repository was developed and validated using a hybrid environment combining local execution for texture generation and cloud computing for deep learning models.

### 1. Texture Generation (Local Environment)
- **GNU Octave:** version `8.4.0`
- Standard built-in toolboxes for image processing.

### 2. CNN Training and Evaluation (Cloud Environment)
The deep learning scripts were executed on **Google Colab**, utilizing its hosted runtime environments with the following specifications:
- **Python:** version `3.12.13`
- **TensorFlow / Keras:** version `2.20.0`
- **NumPy:** version `2.0.2`
- **Pandas:** version `2.2.2`
- **Matplotlib:** version `3.10.0`
- **Seaborn:** version `0.13.2`
- **Scikit-learn:** version `1.6.1`

*Note: Built-in libraries used (such as `os`, `csv`, and `google.colab`) are part of the standard Python and Google Colab environments. Since the notebooks are designed to run on Google Colab, all major deep learning dependencies are pre-installed in the cloud runtime. You only need a standard Google account to open and execute the notebooks using the provided files.*
