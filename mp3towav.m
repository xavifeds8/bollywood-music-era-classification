
myFolder = "C:\Users\ferna\OneDrive\Desktop\1990's2";

if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir();
    if myFolder == 0
     
         return;
    end
end

filePattern = fullfile(myFolder, '*.mp3');
theFiles = dir(filePattern);
p = 74

for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [audio,fs] = audioread(fullFileName);
    a = size(audio);
   
    n=1
    while n*fs*60 < a(1)
        q = n + p 
        audiowrite("C:\Users\ferna\OneDrive\Desktop\filtered90s2\\"+"1990's "+q+".wav",audio([(n-1)*fs*60+1:n*fs*60],:),fs);
        n = n+1
    end
    p = q
    
end
    
    