    /**
     * @typedef color_t
     * @brief Structure to hold 8-bit RGB color for each cell.
     */
    typedef struct packed {
        logic [7:0] r;   ///< Red component (0-255)
        logic [7:0] g;   ///< Green component (0-255)
        logic [7:0] b;   ///< Blue component (0-255)
    } color_t;