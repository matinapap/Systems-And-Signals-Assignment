% Ορισμός του διαστήματος χρόνου από -0.1 έως 0.1 με βήμα 0.001
t = -0.1:0.001:0.1;

% Ορισμός του σήματος z ως άθροισμα των cos(100*pi*t), cos(200*pi*t) και sin(500*pi*t)
z = cos(100*pi*t) + cos(200*pi*t) + sin(500*pi*t);

% Σχεδίαση του σήματος z ως συνάρτηση του χρόνου t
plot(t, z);

% Προσθήκη υπόμνημα (legend) για το σήμα z
legend('x(t)');

% Ενεργοποίηση πλέγματος στο διάγραμμα για καλύτερη ανάγνωση
grid on;

% Ορισμός των ετικετών των αξόνων
xlabel('Χρόνος (δευτερόλεπτα)');
ylabel('Πλάτος x1(t)');