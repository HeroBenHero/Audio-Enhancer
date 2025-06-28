## Audio Enhancer MATLAB Project

### **Overview**

This project implements an *Audio Enhancement System* in MATLAB. The main objective is to improve the clarity and intelligibility of audio signals by reducing noise and enhancing desired speech components. The system demonstrates basic audio processing techniques including noise generation, mixing, filtering, and enhancement.

### **Features**

- **Noise Generation:** Create various types of noise (low frequency, high frequency, Gaussian, random) to simulate real-world audio disturbances.
- **Audio Mixing:** Combine clean audio with generated noise to produce test signals.
- **Filtering:** Apply high-pass, low-pass, and Wiener filters to attenuate noise and enhance the audio.
- **Amplification:** Boost the amplitude of the processed audio for better audibility.
- **Visualization:** Plot time-domain and frequency-domain representations of clean, noisy, and enhanced signals.
- **Audio Playback:** Listen to the original, noisy, and enhanced audio at each processing stage.

### **File Structure**

| File Name              | Description                                                        |
|------------------------|--------------------------------------------------------------------|
| `Main.m`               | Main script: runs the entire enhancement pipeline.              |
| `Generate-Noise.m`     | Generates synthetic noise signals.                              |
| `Mix-Noise.m`          | Mixes clean audio and noise to produce a noisy test signal.     |
| `plotWave_YW.m`        | Utility for plotting waveforms and spectrograms.                |
| `Clean.mp3`            | Input clean audio (user-supplied).                                 |
| `Noise.wav`            | Generated noise audio.                                             |
| `Test.wav`             | Noisy audio (clean + noise).                                       |
| `Output.wav`           | Enhanced (filtered) output audio.                                  |

### **Requirements**

- MATLAB (R2017 or later recommended)
- Signal Processing Toolbox (for filtering and audio functions)
- Audio files: Place your clean speech file as `Clean.mp3` in the project folder.

### **How to Run**

1. **Prepare Input:**
   - Place your clean audio file as `Clean.mp3` in the project directory.

2. **Run the Main Script:**
   - Open MATLAB.
   - Set the working directory to the project folder.
   - Run the following command in the MATLAB Command Window:
     ```matlab
     Main
     ```

3. **Outputs:**
   - The script will generate and save intermediate and output audio files (`Noise.wav`, `Test.wav`, `Output.wav`).
   - Listen to the audio at each stage using the `sound()` commands in the script.
   - Visualizations of the waveforms and spectrograms will appear as MATLAB figures.

### **Processing Steps**

1. **Noise Generation:**  
   Generate synthetic noise (cosine wave or Gaussian noise) and save as `Noise.wav`.

2. **Audio Mixing:**  
   Mix the clean audio (`Clean.mp3`) and noise (`Noise.wav`) to create a noisy signal (`Test.wav`).

3. **Filtering:**  
   Apply digital filters (high-pass, low-pass, or Wiener) to the noisy signal to suppress noise and enhance speech (`Output.wav`).

4. **Amplification:**  
   Amplify the enhanced signal for better clarity.

5. **Visualization:**  
   Use `plotWave_YW.m` to plot time and frequency domain representations of the signals.

### **Key MATLAB Functions Used**

- `audioread`, `audiowrite`: Read and write audio files.
- `sound`: Play audio in MATLAB.
- `highpass`, `lowpass`: Digital filtering.
- `awgn`: Add Gaussian noise.
- `subplot`, `plot`: Visualization.
- Custom: `plotWave_YW`, `noiseReduction_YW` (for plotting and Wiener filtering).

### **Sample Usage**

```matlab
% Generate low-frequency noise
fl = 600;
[x,  = audioread('Clean.mp3');
n = length(x);
t = (1:n)/fs;
z = cos(2*pi*fl*t)';
audiowrite('Noise.wav', z, fs);

% Mix clean and noise
[x,  = audioread('Clean.mp3');
[z,  = audioread('Noise.wav');
y = x + z;
audiowrite('Test.wav', y, fs);

% Apply high-pass filter
[z,  = audioread('Test.wav');
y = highpass(z, fl+150, fs);
audiowrite('Output.wav', y, fs);

% Plot results
plotWave_YW(0, x, fs, 'time', 1, 'Clean speech');
plotWave_YW(0, y, fs, 'time', 1, 'Enhanced speech');
```
*(See `Main.m` for full workflow.)*

### **Notes**

- Ensure all required files are in the same directory.
- The project is modular; you can run individual scripts to test specific steps.
- For custom filtering or enhancement, modify the relevant section in `Main.m`.

### **References**

- For visualization utility, see `plotWave_YW.m` documentation and comments.

### **License**

This project is intended for educational and research purposes.

### **Acknowledgments**

- MATLAB documentation and community.