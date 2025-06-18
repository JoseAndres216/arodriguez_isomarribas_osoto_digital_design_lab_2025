/**
 * @module videoGen
 * @brief Simple video generator for VGA display.
 *
 * This module generates pixel color outputs (R, G, B) based on the current
 * screen coordinates (x, y). It draws characters from a character ROM and
 * a green rectangle overlay.
 *
 * The code is an adaptation from:
 * "Digital Design and Computer Architecture, Second Edition"
 * by David Money Harris & Sarah L. Harris.
 *
 * @param x Current horizontal pixel position (0 to 639).
 * @param y Current vertical pixel position (0 to 479).
 * @param r 8-bit red color output.
 * @param g 8-bit green color output.
 * @param b 8-bit blue color output.
 */
module videoGen(
	input logic [9:0] x, y,
    input logic [2:0] circles, 
    output logic [7:0] r, g, b
    );

    logic pixel, inrect;
    
    logic inrect1, inrect2, inrect3, inrect4, inrect5;

    // Parámetros para separación y colores de los círculos
    parameter int SEP = 130; // Separación entre centros (más separados)
    parameter logic [7:0] COLOR1_R = 8'hFF, COLOR1_G = 8'h00, COLOR1_B = 8'h00; // Rojo
    parameter logic [7:0] COLOR2_R = 8'h00, COLOR2_G = 8'hFF, COLOR2_B = 8'h00; // Verde
    parameter logic [7:0] COLOR3_R = 8'h00, COLOR3_G = 8'h00, COLOR3_B = 8'hFF; // Azul
    parameter logic [7:0] COLOR4_R = 8'hFF, COLOR4_G = 8'hFF, COLOR4_B = 8'h00; // Amarillo
    parameter logic [7:0] COLOR5_R = 8'hFF, COLOR5_G = 8'h00, COLOR5_B = 8'hFF; // Magenta

    // Nuevos parámetros para los colores alternativos de los else
    parameter logic [7:0] ALT3_R = 8'h55, ALT3_G = 8'h55, ALT3_B = 8'h55;
    parameter logic [7:0] ALT4_R = 8'h00, ALT4_G = 8'h00, ALT4_B = 8'h00;
    parameter logic [7:0] ALT5_R = 8'h00, ALT5_G = 8'h00, ALT5_B = 8'h00;

    circlegen circ1(x, y, 10'd320, 10'd240, 10'd40, inrect1);
    circlegen circ2(x, y, 10'd320-SEP, 10'd240, 10'd40, inrect2);
    circlegen circ3(x, y, 10'd320+SEP, 10'd240, 10'd40, inrect3);
    circlegen circ4(x, y, 10'd320-SEP/2, 10'd240+90, 10'd40, inrect4);
    circlegen circ5(x, y, 10'd320+SEP/2, 10'd240+90, 10'd40, inrect5);

    always_comb begin
        if (inrect1) begin
            r = COLOR1_R;
            g = COLOR1_G;
            b = COLOR1_B;
        end else if (inrect2) begin
            r = COLOR2_R;
            g = COLOR2_G;
            b = COLOR2_B;
        end else if (inrect3) begin
            if (circles[2]) begin
                r = COLOR3_R;
                g = COLOR3_G;
                b = COLOR3_B;
            end
            else begin
                r = ALT3_R;
                g = ALT3_G;
                b = ALT3_B;
            end
        end else if (inrect4) begin
            if (circles[1]) begin
                r = COLOR4_R;
                g = COLOR4_G;
                b = COLOR4_B;
            end else begin
                r = ALT4_R;
                g = ALT4_G;
                b = ALT4_B;
            end
        end else if (inrect5) begin
            if (circles[0]) begin
                r = COLOR5_R;
                g = COLOR5_G;
                b = COLOR5_B;
            end else begin
                r = ALT5_R;
                g = ALT5_G;
                b = ALT5_B;
            end
        end else begin
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
        end
    end
    
endmodule

/**
 * @module rectgen
 * @brief Rectangle generator for VGA display.
 *
 * This module determines whether a given (x, y) pixel coordinate
 * falls within a defined rectangular region on the screen.
 *
 * The code is an adaptation from:
 * "Digital Design and Computer Architecture, Second Edition"
 * by David Money Harris & Sarah L. Harris.
 *
 * @param x       Current horizontal pixel position.
 * @param y       Current vertical pixel position.
 * @param left    Left boundary of the rectangle (inclusive).
 * @param top     Top boundary of the rectangle (inclusive).
 * @param right   Right boundary of the rectangle (exclusive).
 * @param bot     Bottom boundary of the rectangle (exclusive).
 * @param inrect  Output signal: high ('1') if (x, y) is inside the rectangle, low ('0') otherwise.
 */
module rectgen(

	input logic [9:0] x, y, left, top, right, bot,
	output logic inrect
	);
	
	assign inrect = (x >= left & x < right & y >= top & y < bot);
	
endmodule


/**
 * @module circlegen
 * @brief Circle generator for VGA display.
 *
 * Este módulo determina si una coordenada de pixel (x, y) cae dentro de un círculo
 * definido por su centro (xc, yc) y su radio (r).
 *
 * @param x       Posición horizontal actual del pixel.
 * @param y       Posición vertical actual del pixel.
 * @param xc      Coordenada x del centro del círculo.
 * @param yc      Coordenada y del centro del círculo.
 * @param r       Radio del círculo.
 * @param incirc  Señal de salida: alta ('1') si (x, y) está dentro del círculo, baja ('0') si no.
 */
module circlegen(
    input  logic [9:0] x, y, xc, yc, r,
    output logic incirc
);

    logic [19:0] dx2, dy2, r2, dist2;
    logic [10:0] dx, dy;

    assign dx = (x > xc) ? (x - xc) : (xc - x);
    assign dy = (y > yc) ? (y - yc) : (yc - y);

    assign dx2 = dx * dx;
    assign dy2 = dy * dy;
    assign r2  = r * r;
    assign dist2 = dx2 + dy2;

    assign incirc = (dist2 <= r2);

endmodule