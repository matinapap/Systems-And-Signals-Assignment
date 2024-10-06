% Συχνότητες για κάθε νότα
frequencies = [
    220, 
    220 * 2^(1/12), 
    220 * 2^(2/12), 
    220 * 2^(3/12), 
    220 * 2^(4/12), 
    220 * 2^(5/12), 
    220 * 2^(6/12), 
    220 * 2^(7/12), 
    220 * 2^(8/12), 
    220 * 2^(9/12), 
    220 * 2^(10/12), 
    220 * 2^(11/12)
];

% Διάρκεια κάθε νότας και παύσης σε δευτερόλεπτα
note_duration = 0.5;
pause_duration = 0.1;

% Συχνότητα δειγματοληψίας
fs = 8000;

% Αριθμός δειγμάτων για κάθε νότα και παύση
n_note = fs * note_duration;
n_pause = fs * pause_duration;

% Δημιουργία περιβάλλοντος μείωσης έντασης
t = linspace(0, note_duration, n_note);
volume_envelope = linspace(1, 0, n_note);

% Δημιουργία του μουσικού κομματιού
music_piece = [];

for i = 1:length(frequencies)
    % Δημιουργία ημιτονοειδούς κύματος για τη νότα
    note_wave = sin(2 * pi * frequencies(i) * t);
    % Εφαρμογή του περιβάλλοντος μείωσης έντασης
    note_wave = note_wave .* volume_envelope;
    % Προσθήκη της νότας στο μουσικό κομμάτι
    music_piece = [music_piece, note_wave];
    % Προσθήκη της παύσης
    if i < length(frequencies)
        music_piece = [music_piece, zeros(1, n_pause)];
    end
end

% Αναπαραγωγή του μουσικού κομματιού
sound(music_piece, fs);

% Διάγραμμα του μουσικού κομματιού
t_total = linspace(0, length(music_piece)/fs, length(music_piece));
figure;
plot(t_total, music_piece);
xlabel('Χρόνος (δευτερόλεπτα)');
ylabel('Ένταση');
title('Μουσικό Κομμάτι');
