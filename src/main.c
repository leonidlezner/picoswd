#include <stdio.h>
#include "pico/stdlib.h"

bool repeating_timer_callback(struct repeating_timer *t) {
    printf("Repeat at %lld\n", time_us_64());
    return true;
}

int main()
{
    const uint LED_PIN = PICO_DEFAULT_LED_PIN;

    setup_default_uart();
    stdio_init_all();

    gpio_init(LED_PIN);

    gpio_set_dir(LED_PIN, GPIO_OUT);

    struct repeating_timer timer;
    add_repeating_timer_ms(2000, repeating_timer_callback, NULL, &timer);

    int i = 0;

    while (true)
    {
        gpio_put(LED_PIN, 1);
        sleep_ms(250);

        printf("i = %d\n", i);

        i++;

        gpio_put(LED_PIN, 0);
        sleep_ms(500);
    }
}