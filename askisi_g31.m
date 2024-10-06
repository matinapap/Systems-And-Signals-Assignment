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

% Διάρκεια κάθε νότας σε δευτερόλεπτα
note_duration = 0.5;

% Συχνότητα δειγματοληψίας
Fs = 8000;

% Δημιουργία του χρόνου
t = 0:1/Fs:note_duration;

% Παράδειγμα ακολουθίας νοτών (συμβολικά οι νότες από 1 έως 12)
sequence = [1, 3, 5, 6, 8, 10, 12, 10, 8, 6, 5, 3, 1];

% Αρχικοποίηση του ηχητικού σήματος
signal = [];

% Δημιουργία του σήματος
for i = 1:length(sequence)
    freq = frequencies(sequence(i));
    note = sin(2 * pi * freq * t);
    signal = [signal, note];
end

% Αναπαραγωγή του σήματος
sound(signal, Fs);

% Αποθήκευση του σήματος σε αρχείο .wav
audiowrite('music_piece.wav', signal, Fs);

% Γράφημα του σήματος
figure;
plot(signal);
title('Μουσικό Κομμάτι');
xlabel('Δείγματα');
ylabel('Απόλυτη τιμή');
