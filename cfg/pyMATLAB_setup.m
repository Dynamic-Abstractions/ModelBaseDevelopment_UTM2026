%% carla_matlab_minimal_test.m
% Goal:
% - See a vehicle in CARLA
% - Read vehicle data in MATLAB
% - Vehicle does NOT need to move

clear; clc;

%% 1) Configure Python for MATLAB (must match where CARLA is installed)
pyenv( ...
    Version="C:\Users\marti343\AppData\Local\Programs\Python\Python311\python.exe", ...
    ExecutionMode="OutOfProcess");

disp(pyenv);

%% 2) Import CARLA Python API
py.importlib.import_module("carla");
disp("CARLA module imported");

%% 3) Connect to CARLA server (CARLA must already be running)
client = py.carla.Client("localhost", int32(2000));
client.set_timeout(10.0);

world = client.get_world();
disp(world);

% Save original world settings (IMPORTANT)
orig_settings = world.get_settings();

vehicle = [];

try
    %% 4) Set synchronous mode (safe & deterministic)
    settings = world.get_settings();
    settings.synchronous_mode = true;
    settings.fixed_delta_seconds = 0.05;   % 20 Hz
    world.apply_settings(settings);

    %% 5) Get blueprint library and select ANY vehicle
    bp_lib = world.get_blueprint_library();

    veh_list = py.list(bp_lib.filter("vehicle.*"));
    if double(py.len(veh_list)) == 0
        error("No vehicle blueprints found");
    end

    vehicle_bp = veh_list{1};
    disp("Using vehicle blueprint:");
    disp(string(vehicle_bp.id));

    %% 6) Get spawn points
    spawn_points = py.list(world.get_map().get_spawn_points());
    spawn_tf = spawn_points{1};

    %% 7) Spawn vehicle
    vehicle = world.try_spawn_actor(vehicle_bp, spawn_tf);

    if isempty(vehicle) || ~logical(vehicle.is_alive)
        error("Failed to spawn vehicle");
    end

    disp("Vehicle spawned successfully");

    %% 8) Read vehicle data for a few ticks (NO MOVEMENT)
    N = 50;
    state = zeros(N, 7); % [t, x, y, z, vx, vy, yaw]

    for k = 1:N
        world.tick();   % advance simulation (required in sync mode)

        tf  = vehicle.get_transform();
        loc = tf.location;
        rot = tf.rotation;
        vel = vehicle.get_velocity();

        t = (k-1) * 0.05;

        state(k,:) = [ ...
            t, ...
            double(loc.x), double(loc.y), double(loc.z), ...
            double(vel.x), double(vel.y), ...
            double(rot.yaw)];
    end

    disp("Sample vehicle data (first 5 rows):");
    disp(state(1:5,:));

    %% 9) Simple plot (vehicle should be stationary)
    figure;
    plot(state(:,2), state(:,3), "o-");
    grid on;
    xlabel("x [m]");
    ylabel("y [m]");
    title("Vehicle position (should be static)");

catch ME
    disp("=== ERROR ===");
    disp(getReport(ME, "extended"));
end

%% 10) Cleanup and restore settings
try
    if ~isempty(vehicle) && logical(vehicle.is_alive)
        vehicle.destroy();
    end
catch
end

try
    world.apply_settings(orig_settings);
catch
end

disp("Done.");
