clear
close all
clear 
%bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-13-48-51.bag');
%bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-15-41-21.bag');
%bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-15-47-19.bag');
%bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-15-54-23.bag');
%bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-16-01-08.bag');
% bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-16-16-24-44.bag');
bag = rosbag('/home/spadmin/datasets/arduino_vi_sync/ekf_tests/2019-09-18-12-49-57.bag');

residual = readTopic(bag, '/arduino_vi_sync/ekf/residual');
offset = readTopic(bag, '/arduino_vi_sync/ekf/offset');
skew = readTopic(bag, '/arduino_vi_sync/ekf/skew');
inno_offset = readTopic(bag, '/arduino_vi_sync/ekf/inno_offset');
inno_skew = readTopic(bag, '/arduino_vi_sync/ekf/inno_skew');

figure
yyaxis left
plot(offset)
ylabel('Offset [s]')
yyaxis right
plot(skew*1000)
ylabel('Skew [ms/s]')
xlim([0,1200])
xlabel('Time [s]')


figure
subplot(3,1,1)
plot(residual*1000)
ylabel('Residual [ms]')
ylim([-10,10])
xlim([0,1200])
subplot(3,1,2)
plot(inno_offset*1000)
ylabel('Offset innovation [ms]')
ylim([-0.4,0.4])
xlim([0,1200])
subplot(3,1,3)
plot(inno_skew*1000*1000)
ylim([-3,3])
xlim([0,1200])
ylabel('Skew Innovation [us/s]')
xlabel('Time [s]')