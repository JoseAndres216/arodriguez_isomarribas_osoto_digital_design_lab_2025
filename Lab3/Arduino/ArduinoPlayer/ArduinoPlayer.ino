void setup() {
  Serial.begin(9600);
  Serial.println("Handshake iniciado");
}

void loop() {
  Serial.write('H');  // Enviamos un caracter de saludo

  delay(500);         // Esperamos medio segundo

  if (Serial.available()) {
    char c = Serial.read();
    Serial.print("FPGA respondió: ");
    Serial.println(c);
  }
}
