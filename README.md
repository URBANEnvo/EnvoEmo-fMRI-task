# EnvoEmo Task
The Environmental Emotion Processing Task (EnvoEmo Task) is a mixed-design fMRI paradigm combining environmental images and emotional face stimuli to study how different environments modulate neural responses to emotional processing.

## Overview
The task includes four conditions defined by:
- Environmental images: green spaces (GS) vs. built-up spaces (BS)
- Facial images: negative: angry and fearful, and neutral facial expressions, including both female and male from The Karolinska Directed Emotional Faces (KDEF) (1)
- Adapted from the Hariri emotional face-matching paradigm (2).  

## Trial Structure
Each trial consists of:
1. Environmental image (5 s)
2. Short jitter with fixation (~1.5 s)
3. Brief face stimulus (200 ms)
4. Long jitter with fixation (~5 s)

Each block consists of 5 trials, and all four experimental conditions appear in a randomized order across 16 blocks.

All images are shown once per participant. Stimuli ordering and timing are implemented in Presentation® software (Neurobehavioral Systems).

## Behavioral Ratings

After each condition, participants provide valence and arousal ratings using the Self-Assessment Manikin (SAM).

## Contents
- `stimuli/environmental/`  
  A folder with environmental images and a README explaining the environmental stimuli. 

- `stimuli/faces/`  
  Empty folder with a README explaining that face stimuli cannot be redistributed.

- `paradigm/`  
Task timing and block structure CSVs

- `code/`  
  Presentation® scripts (`.sce`, `.pcl`)

## Stimuli Access and Usage Restrictions
Facial stimuli (The Karolinska Directed Emotional Faces (KDEF)1) are not included in this repository.  
Users must obtain the original KDEF stimuli from the appropriate copyright holders. https://kdef.se/faq/using-and-publishing-kdef-and-akdef

The environmental images used in the task (GS and BS) are available upon request from the corresponding author. These images may be used exclusively for non-commercial scientific research purposes. Beyond this limitation, researchers are free to use the stimuli as needed.
The environmental images stimuli may NOT be redistributed in any way without written permission from the copyright holder (Central Institute of Mental Health, Department of Psychiatry and Psychotherapy).


## Authors
- **Yuchen Lin**, Department of Psychiatry and Psychotherapy, Central Institute of Mental Health, Medical Faculty Mannheim, University of Heidelberg, Germany  
- **Dr. Oksana Berhe**, Department of Psychiatry and Psychotherapy, Central Institute of Mental Health, Medical Faculty Mannheim, University of Heidelberg, Germany
- **PD Dr. Jamila Andoh**, Department of Psychiatry and Psychotherapy, Central Institute of Mental Health, Medical Faculty Mannheim, University of Heidelberg, Germany
- **Prof. Dr. Dr. Heike Tost**, Department of Psychiatry and Psychotherapy, Central Institute of Mental Health, Medical Faculty Mannheim, University of Heidelberg, Germany

  

Contact: yuchen.lin@zi-mannheim.de, Oksana.Berhe@zi-mannheim.de


## Citation
Please cite this repository if you use the EnvoEmo Task in your research. See `CITATION.cff` for machine-readable citation information.

## License
All content in this repository (except KDEF faces) is licensed under CC BY-NC-SA 4.0. See `LICENSE` for details.

## Notes
- KDEF face stimuli are copyrighted and not included. Users must obtain them separately.  
- Environmental images may be reused for academic and scientific purposes under CC-BY 4.0 with attribution.  

##Reference
1.	Lundqvist, D., Flykt, A., & Öhman, A. (1998). The Karolinska Directed Emotional Faces - KDEF, CD ROM from Department of Clinical Neuroscience, Psychology section, Karolinska Institutet, ISBN 91-630-7164-9.
2.	A. R. Hariri et al., Serotonin transporter genetic variation and the response of the human amygdala. Science 297, 400-403 (2002).
