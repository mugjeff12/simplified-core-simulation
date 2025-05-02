%% Simplified Core Simulation with Randomized Fuel Burnup & Leakage
% Author: Mugdho Jeferson Rozario
% Description: Simulates a nuclear core matrix with randomized burnup,
% directional leakage, and a maintenance scheduler.

%% PARAMETERS
% Grid and decay parameters
gridSize = 10;              % 10x10 reactor core
initialEnergy = 100;        % Initial energy level of each fuel rod
threshold = 1e-3;           % Minimum threshold to consider as "depleted"
nCycles = 100;              % Number of burnup simulation cycles
leakageRate = 0.05;         % Energy leakage rate (5%)

% Initialize core matrix and leakage tracking
coreMatrix = initialEnergy * ones(gridSize);
leakageMatrix = zeros(gridSize);
burnHistory = zeros(gridSize, gridSize, nCycles);  % Stores energy over time

%% SIMULATE DECAY OVER TIME
for cycle = 1:nCycles
    for i = 1:gridSize
        for j = 1:gridSize
            if coreMatrix(i,j) > threshold
                decayFactor = rand();  % Random value between 0 and 1
                coreMatrix(i,j) = coreMatrix(i,j) * decayFactor;
            end
            burnHistory(i,j,cycle) = coreMatrix(i,j);  % Log energy level
        end
    end
end

%% APPLY DIRECTIONAL LEAKAGE (upper-triangle logic: i < j)
for i = 1:gridSize
    for j = 1:gridSize
        if i < j
            leakage = leakageRate * coreMatrix(i,j);
            coreMatrix(i,j) = coreMatrix(i,j) - leakage;
            leakageMatrix(i,j) = leakageMatrix(i,j) + leakage;
        end
    end
end

%% VISUALIZE FINAL ENERGY LEVELS (Heatmap)
figure(1), clf
imagesc(coreMatrix)
colorbar
axis square
title('Final Energy Levels of Fuel Rods')
xlabel('Rod Column'), ylabel('Rod Row')
saveas(gcf, 'final_core_heatmap.png')  % Optional: save figure

%% PLOT BURNUP OVER TIME FOR SELECTED RODS
figure(2), clf
hold on
for i = 1:3
    for j = 1:3
        plot(squeeze(burnHistory(i,j,:)), 'DisplayName', sprintf('Rod (%d,%d)',i,j))
    end
end
legend show
title('Burnup Over Time for Selected Rods')
xlabel('Cycle'), ylabel('Energy')
saveas(gcf, 'rod_decay_plot.png')  % Optional: save figure

%% MAINTENANCE SCHEDULING (Zeller’s Congruence-Based)
yearsToSimulate = 10;
inspectionInterval = 3;
startYear = 2025;
dayList = {'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'};

fprintf('\nScheduled Maintenance Days:\n')
for year = startYear : inspectionInterval : startYear + yearsToSimulate
    dayIndex = mod((1 + 5*mod(year-1,4) + 4*mod(year-1,100) + 6*mod(year-1,400)), 7);
    fprintf('Inspection in %d will be on a %s\n', year, dayList{dayIndex+1});
end
