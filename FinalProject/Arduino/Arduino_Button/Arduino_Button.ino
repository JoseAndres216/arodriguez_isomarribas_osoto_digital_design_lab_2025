/**
  This is the code for an Arduino UNO that communicates with an
  FPGA using the UART protocol. It acts as the input controller 
  for Player 2, detecting when either of the two buttons is pressed 
  and sending a corresponding signal to the FPGA.
*/

// Pins 0 and 1 are used as RX and TX, respectively, for serial communication using the Arduino Uno's default hardware UART.

const int selectButton = 8;   ///< Pin connected to the select button

int lastSelectButtonState = LOW;  ///< Previous reading of the select button

int selectButtonState = LOW;      ///< Current debounced state of the select button

unsigned long lastSelectDebounceTime = 0;  ///< Timestamp for last select button state change

const unsigned long debounceDelay = 50;    ///< Debounce delay in milliseconds

bool handshakeDone = false;                ///< Indicates if the handshake with FPGA is complete

/**
 * @brief Initializes input pins and serial communication.
 */
void setup() {
  pinMode(selectButton, INPUT);
  Serial.begin(9600);
  Serial.println("Handshake started");
}

/**
 * @brief Main loop.
 * If handshake is complete, monitors button presses and commuticate with FPGA.
 * Otherwise, continues attempting handshake with FPGA.
 */
void loop() {
  if (handshakeDone) {
    handleButton(selectButton, selectButtonState, lastSelectButtonState, lastSelectDebounceTime, 'S', "selectButton Pressed");
  } else {
    performHandshake();
  }
}

/**
 * @brief Attempts to perform the handshake with the FPGA.
 * Sends 'H' until a 'K' is received as acknowledgment.
 */
void performHandshake() {
  Serial.write('H'); ///< Send handshake character to FPGA
  delay(500);        ///< Optional delay between attempts

  if (Serial.available()) {
    char response = Serial.read();
    Serial.println(" ");
    Serial.print("FPGA replied: ");
    Serial.println(response);
    if (response == 'K') {
      handshakeDone = true;
    }
  }
}

/**
 * @brief Handles debouncing and triggering serial output when a button is pressed.
 *
 * @param pin The digital pin connected to the button.
 * @param buttonState Reference to the button’s current debounced state.
 * @param lastButtonState Reference to the button’s last read state.
 * @param lastDebounceTime Reference to the timestamp of last change.
 * @param command Character to send over Serial when button is pressed.
 * @param debugMsg Message printed to Serial for debugging when pressed.
 */
void handleButton(int pin, int &buttonState, int &lastButtonState,
                  unsigned long &lastDebounceTime, char command, const char* debugMsg) {
  int reading = digitalRead(pin);

  if (reading != lastButtonState) {
    lastDebounceTime = millis();
  }

  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (reading != buttonState) {
      buttonState = reading;
      if (buttonState == HIGH) {
        Serial.println(debugMsg);
        Serial.write(command); // sends a command to the FPGA
      }
    }
  }

  lastButtonState = reading;
}
