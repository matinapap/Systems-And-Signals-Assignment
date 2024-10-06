% Συχνότητα Δειγματοληψίας
Fs = 8000;

% Διάρκεια κάθε νότας
Dt = 0.1;

% Συχνότητες για τις νότες μιας οκτάβας
frequencies = [
    220,             % A
    220*2^(1/12),    % A#
    220*2^(2/12),    % B
    220*2^(3/12),    % C
    220*2^(4/12),    % C#
    220*2^(5/12),    % D
    220*2^(6/12),    % D#
    220*2^(7/12),    % E
    220*2^(8/12),    % F
    220*2^(9/12),    % F#
    220*2^(10/12),   % G
    220*2^(11/12)    % G#
];

% Ακολουθία νοτών (συμβολικά οι νότες από 1 έως 12)
Notes_Array = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};

% Συνάρτηση για αναπαραγωγή νότας
function playNote(note, duration, Fs, octaveShift, Notes_Array, frequencies)
    % Αντιστοίχιση νότας με συχνότητα
    noteIndex = find(strcmp(Notes_Array, note));
    if isempty(noteIndex)
        error('Νότα %s δεν βρέθηκε.', note);
    end
    freq = frequencies(noteIndex) * 2^octaveShift;
    t = 0:1/Fs:duration;
    sound(sin(2 * pi * freq * t), Fs);
    pause(duration + 0.1); % Προσθήκη μικρής παύσης μεταξύ των νοτών
end

% Αναπαραγωγή νοτών χωρίς ολίσθηση
for i = 1:length(Notes_Array)
    playNote(Notes_Array{i}, Dt, Fs, 0, Notes_Array, frequencies);
end

% Αναπαραγωγή νοτών με ολίσθηση κατά μία οκτάβα πάνω
for i = 1:length(Notes_Array)
    playNote(Notes_Array{i}, Dt/2, Fs, 1, Notes_Array, frequencies);
end

% Αναπαραγωγή νοτών με ολίσθηση κατά μία οκτάβα κάτω
for i = 1:length(Notes_Array)
    playNote(Notes_Array{i}, Dt*2, Fs, -1, Notes_Array, frequencies);
end
