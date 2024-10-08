function computeFourierSeries(signal, T)
    % Υπολογισμός της σειράς Fourier χρησιμοποιώντας τον DFT μέσω της συνάρτησης fft
    %
    % Inputs:
    %   signal: Το σήμα πεπερασμένης διάρκειας T (vector)
    %   T: Η διάρκεια του σήματος (scalar)
    
    % Εφαρμογή της συνάρτησης fft στο σήμα
    X = fft(signal);
    
    % Δημιουργία διανύσματος συχνοτήτων για το αντίστοιχο φάσμα
    N = length(signal);         % Μέγεθος του σήματος
    freq = (0:N-1)*(1/T);       % Διάνυσμα συχνοτήτων
    
    % Εμφάνιση του φάσματος πλάτους
    figure('Name','Υπολογισμός σειράς Fourier');
    subplot(2, 1, 1);
    stem(freq, abs(X), 'b');   % Διάγραμμα στέλεχος του φάσματος πλάτους
    title('Φάσμα Πλάτους');
    xlabel('Συχνότητα (Hz)');
    ylabel('|X(k)|');
    
    % Εμφάνιση του φάσματος φάσης
    subplot(2, 1, 2);
    stem(freq, angle(X), 'r');  % Διάγραμμα στέλεχος του φάσματος φάσης
    title('Φάσμα Φάσης');
    xlabel('Συχνότητα (Hz)');
    ylabel('∠X(k)');
end

% Παράδειγμα χρήσης
signal = [1, 2, 3, 4, 5, 6]; % Αρχικό σήμα
T = 6;                       % Διάρκεια του σήματος
computeFourierSeries(signal, T);
