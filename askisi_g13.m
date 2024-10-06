t=-0.1:.001:0.1;
Ts=0.002;
N1=-50:1:50;
z=cos(100*pi*t)+ cos(200*pi*t)+sin(500*pi*t);
Xs=cos(100*pi*N1*Ts)+cos(200*pi*N1*Ts)+sin(500*pi*N1*Ts);
for k=1:1:length(t)
    x1(k)=Xs*sinc((t(k)-N1*Ts)/Ts)';
end;
hold on;
plot(t,z);
plot(t,x1,'-r');
legend('Xs(t)');
legend('y(t)');% Καθαρισμός του workspace και των figure
clear;
clc;
close all;

% Ορισμός του διαστήματος χρόνου από -0.1 έως 0.1 με βήμα 0.001
t = -0.1:0.001:0.1;

% Συχνότητα δειγματοληψίας
fs = 500; % Hz
Ts = 1/fs; % Περίοδος δειγματοληψίας

% Δειγματοληπτημένα σημεία
N1 = -50:1:50;

% Ορισμός του σήματος z ως άθροισμα των cos(100*pi*t), cos(200*pi*t) και sin(500*pi*t)
z = cos(100*pi*t) + cos(200*pi*t) + sin(500*pi*t);

% Υπολογισμός των δειγμάτων του σήματος
Xs = cos(100*pi*N1*Ts) + cos(200*pi*N1*Ts) + sin(500*pi*N1*Ts);

% Ανακατασκευή του σήματος χρησιμοποιώντας το θεώρημα δειγματοληψίας
x1 = zeros(1, length(t));
for k = 1:length(t)
    x1(k) = Xs * sinc((t(k) - N1*Ts) / Ts)';
end

% Σχεδίαση του αρχικού σήματος
figure;
plot(t, z, 'b', 'LineWidth', 1.5);
hold on;

% Σχεδίαση του ανακατασκευασμένου σήματος
plot(t, x1, 'r--', 'LineWidth', 1.5);

% Προσθήκη υπομνήματος (legend) για τα σήματα
legend('Αρχικό σήμα x(t)', 'Ανακατασκευασμένο σήμα x1(t)');

% Ορισμός του τίτλου του διαγράμματος
title('Ανακατασκευή Σήματος με Θεώρημα Δειγματοληψίας (fs = 500 Hz)');

% Ορισμός των ετικετών των αξόνων
xlabel('Χρόνος (δευτερόλεπτα)');
ylabel('Πλάτος');

% Ενεργοποίηση πλέγματος στο διάγραμμα για καλύτερη ανάγνωση
grid on;

% Ορισμός των ετικετών των αξόνων
xlabel('Χρόνος (δευτερόλεπτα)');
ylabel('Πλάτος x1(t)');

grid on;