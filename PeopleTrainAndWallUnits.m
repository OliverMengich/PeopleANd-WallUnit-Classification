%Positive Instances
PeoplePositiveInstances = People;
%Folder Location
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','NonPerson');
negativeImages = imageDatastore(negativeFolder);
% Training the detector
trainCascadeObjectDetector('peopleOutput.xml',PeoplePositiveInstances,negativeFolder,'NumCascadeStages',5,'FalseAlarmRate',0.005);
detector = vision.CascadeObjectDetector('peopleOutput.xml');
% To classify An Image

camera = webcam;
image = camera.snapshot;
image = imread(image);
bbox = step(detector,image);
% Draw boundary on Classified Image
detectedImage= insertObjectAnnotation(image,'rectangle',bbox,'Person');
% Display the Image
figure;imshow(detectedImage);

% WallUnitsPositiveInstances= table(WallUnit(16:23,1),WallUnit(16:23,3));
% negativeFolder1 = fullFile(matlabroot,'toolbox','vision','visiondata','NonWallUnits');
% negativeImages1= imageDatastore(negativeFolder1);
% trainCascadeObjectDetector('wallUnitOutput.xml',WallUnitsPositiveInstances,negativeFolder1,'NumCascadeStages',3,'FalseAlarmRate',0.01);
