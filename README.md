# UN-Datathon2023
# Project Name
# Main Resorce:

[UN Statistics WIKI](https://unstats.un.org/wiki/display/UNDatathon2023/Getting+Started+with+UN+Datathon+2023)

AWS Office hours:
# Week 1: Introduction to AWS and the UN Datathon

## Plan

1. **Presentation about AWS Cloud**
   - What is the Cloud?
   - The AWS Regions / AZs
   - All the Data Analytics Services
   - AI/ML Services available
   - Navigating the AWS Platform
   - Different ways to access the AWS services
   - Access during the workshop

2. **Integration of Geospatial Information and Statistics for the SDGs in the context of Big Data**

## Services

- **Amazon Simple Storage Service (Amazon S3)**

## Additional Resources

- [AWS Cloud Overview](https://www.youtube.com/watch?v=362uYjvNqIE&ab_channel=UNBigData)
- [Integration of Geospatial Information and Statistics for the SDGs in the context of Big Data](https://youtu.be/fS9jL4WCXPs)

# Week 2: A Deep Dive into Amazon SageMaker

**Description:**

Amazon SageMaker is a powerful tool for building, training, and deploying machine learning models for various use cases. In Week 2, we'll take a deeper look into what SageMaker has to offer.

## What Covered

1. **Introduction to Amazon SageMaker**
    - Understanding the capabilities of Amazon SageMaker.
    - How SageMaker simplifies machine learning tasks.

2. **Benefits of Amazon SageMaker**
    - Enabling innovation with ML through various tools.
    - Handling structured and unstructured data for ML.
    - Improving productivity with optimized infrastructure.
    - Automating MLOps practices and governance.
3. **A Guide to AIS Data Utilization**

## Additional Resources

- [Amazon SageMaker Overview](https://www.youtube.com/watch?v=JqCIdrGdAvg&t=403s&ab_channel=UNBigData)
- [A Guide to AIS Data Utilization](https://youtu.be/KKD6iFJjC7k)

## Join Discord

- [here](https://discord.gg/3XtmWkRFUx)


# Table of Contents

- [AI Detects Peatfires in Sumatra: Unmasking with Technology](#ai-detects-peatfires-in-sumatra-unmasking-with-technology)
  - [Project Overview](#project-overview)
  - [Datasets](#datasets)
  - [Methodology](#methodology)
  - [Data Analysis and Processing](#data-analysis-and-processing)
  - [Results](#results)
  - [Repository Structure](#repository-structure)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
  - [Future Work](#future-work)
  - [Contributing](#contributing)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)


# AI Detects Peatfires in Sumatra: Unmasking with Technology
 ![Fire in Sumatra](https://onecms-res.cloudinary.com/image/upload/s--lgoCHk2D--/c_fill,g_auto,h_468,w_830/fl_relative,g_south_east,l_mediacorp:cna:watermark:2021-08:cna,w_0.1/f_auto,q_auto/v1/mediacorp/cna/image/2023/09/27/KARHUTLA%201.jpg?itok=Cb3aLBxe)

This project integrates MODIS fire detection data with climate data from the NASA POWER dataset, utilizing Amazon SageMaker for analysis and modeling. The goal is to identify potential peatfire hotspots in Sumatra by analyzing and modeling environmental data.

## Project Overview

Peatfires contribute to significant environmental damage and carbon emissions. Early detection and accurate prediction of such fires are crucial for taking timely action. This project applies machine learning techniques to satellite and climate data to predict peatfire hotspots.

## Datasets

The datasets used in this project include:

- **MODIS Fire Detection Dataset**: Contains satellite observations of active fires and thermal anomalies.
- **NASA POWER Climate Dataset**: Provides meteorological and solar data designed for renewable energy, agroclimatology, and other climate-related research.

Both datasets are hosted on AWS S3 buckets and are publicly accessible via the AWS Open Data Program.

## Methodology

1. **Data Extraction**: Data is extracted from the S3 buckets directly into a SageMaker notebook instance.
2. **Data Integration**: The extracted MODIS and NASA POWER datasets are integrated within the notebook.
3. **Correlation Analysis**: A correlation heatmap is generated to understand the relationship between various environmental features.
4. **Model Training**: The integrated dataset is split into training and test sets. A CatBoost ensemble model is trained to classify locations as hotspots or not.
5. **Hyperparameter Tuning**: The model's hyperparameters are tuned for optimal performance.
6. **Model Evaluation**: The model's effectiveness is assessed using the ROC-AUC curve and F1 score.

## Data Analysis and Processing

### MODIS Fire Detection Data Analysis

The project involves in-depth analysis of the MODIS Fire Detection Dataset. Key steps in the data processing include:

- **Reading and Cleaning Data**: The MODIS fire data (`fire_archive_M-C61_397859.csv`) is loaded and cleaned. This includes converting various columns to numeric types and parsing the acquisition date (`acq_date`) to a datetime format.
- **Density and Box Plots**: We generate density plots for the `scan` and `track` columns to understand their distributions. Box plots are also created for `brightness` and `bright_t31` to analyze variations across different times of the day.
- **Geospatial Analysis**: Latitude and longitude data are used to create scatter plots against `brightness` and `bright_t31` to visualize the spatial distribution of fire intensity.
- **Continuous Fire Analysis**: We identify continuous fire events by assessing spatial proximity and temporal closeness of the fire observations.

### NASA POWER Climate Data Analysis

The NASA POWER climate dataset is also processed to extract meaningful insights:

- **Data Integration**: Multiple CSV files corresponding to different regions and years (e.g., `POWER_Regional_Daily_20120101_20121231_001d10N_007d10N_100d28E_107d28E_LST.csv`) are read and merged for comprehensive analysis.
- **Correlation with Fire Data**: Climate data such as temperature, precipitation, and humidity are correlated with fire incidents to identify potential patterns and triggers.

### R Scripts and Analysis

The R environment is utilized for data processing and analysis. Key packages include `ncdf4` for NetCDF manipulation, `terra` for geospatial analysis, `ggplot2` for plotting, `sf` for handling geospatial data, `tidyverse` for data manipulation, and `raster` for raster data analysis.


## Results

- The correlation heatmap revealed significant relationships between certain climate features and the occurrence of peatfires.
- The tuned CatBoost model showed promising classification results, as indicated by the ROC-AUC curve and F1 score.

## Repository Structure
Below is a description of the key directories and files in this repository:
- `Dashboard/`: A dedicated folder for hosting dashboard files, providing visualization and interactive analysis capabilities.
- `Datasets/`: Includes the raw data files used in the project, such as MODIS fire data and NASA POWER climate data.
- `Scripts/`: Python and R scripts for preprocessing, data analysis, and other tasks.
- `Models/`: Stores the trained machine learning models and any results from hyperparameter tuning or model evaluation.
- `requirements.txt`: Lists all the Python libraries required to run the project.
- `README.md`: Provides an overview of the project, instructions on how to set up and run the code, and other important information.
- `CONTRIBUTING.md`: Contains guidelines and instructions for contributing to the project.


## Getting Started

To get started with this project, you'll need to set up an AWS account and configure access to the S3 buckets containing the MODIS and NASA POWER datasets.

### Prerequisites

- Amazon SageMaker
- AWS S3 access
- Python 3.6+
- Required Python libraries: `boto3`, `pandas`, `numpy`, `sagemaker`, `catboost`, `matplotlib`, `seaborn`

### Installation

Clone this repository using Git:
```shell
# Example installation commands
$ git clone https://github.com/debsankarde/UN-Datathon2023.git
$ cd UN-Datathon2023
$ npm install
```

Install the required libraries:
```shell
pip install -r requirements.txt
```

### Usage

Launch the Jupyter notebooks within the `notebooks` directory to explore data analysis and model training:


## Future Work

Going forward, the project aims to incorporate Enhanced Vegetation Index (EVI) data to enhance the understanding and prediction of peatfires. The key areas of focus for future work include:

- **Integration of EVI Data**: Incorporating EVI data into our dataset will enable us to monitor vegetation health and density over time. This will provide valuable insights into the impact of peatfires on vegetation loss and recovery.

- **Correlation Between EVI and Fire Incidents**: Analyzing the relationship between EVI changes and fire incidents will help in understanding how fires affect vegetation over different timescales and geographical areas.

- **Predictive Modeling of Vegetation Impact**: Leveraging machine learning models to predict the impact of peatfires on vegetation. This includes assessing the risk and severity of vegetation loss due to fires.

- **Real-Time Monitoring System**: Developing a real-time monitoring system that uses EVI data to provide early warnings about potential vegetation loss due to peatfires.

- **Long-Term Ecological Analysis**: Conducting a long-term analysis of the ecological impact of peatfires on the Sumatra region, using the integrated dataset of fire incidents, climate data, and EVI.

These enhancements aim to provide a more comprehensive understanding of the environmental impact of peatfires, contributing to more effective prevention and mitigation strategies.

## Contributing

Contributions to this project are welcome. Please refer to the `CONTRIBUTING.md` for guidelines.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## Acknowledgments

- NASA POWER for providing open access to climate datasets.
- MODIS Fire Detection Dataset contributors.
- Amazon Web Services for hosting the datasets and SageMaker platform.

