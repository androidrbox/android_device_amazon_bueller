/*
 * Copyright (C) 2015 rbox
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * This file sets variables that control the way modules are built
 * thorughout the system. It should not be used to conditionally
 * disable makefiles (the proper mechanism to control what gets
 * included in a build is to use PRODUCT_PACKAGES in a product
 * definition file).
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <linux/input.h>
#include <linux/uinput.h>

static struct termios oldT;
static int fd;

static void sigint_handler(int s)
{
    ioctl(0, TCSETS, &oldT); /* restore previous terminal mode */
    ioctl(fd, UI_DEV_DESTROY);
    close(fd);
    exit(1);
}

int main(void)
{
    struct sigaction sigint;
    struct termios newT;
    struct uinput_user_dev uidev;
    struct input_event     ev;
    int                    i;

    // Set up the SIGINT handler
    sigint.sa_handler = sigint_handler;
    sigemptyset(&sigint.sa_mask);
    sigint.sa_flags = 0;
    sigaction(SIGINT, &sigint, NULL);

    fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);

    ioctl(fd, UI_SET_EVBIT, EV_KEY);
    ioctl(fd, UI_SET_EVBIT, EV_REL);
    ioctl(fd, UI_SET_RELBIT, REL_X);
    ioctl(fd, UI_SET_RELBIT, REL_Y);
    ioctl(fd, UI_SET_KEYBIT, BTN_MOUSE);
    ioctl(fd, UI_SET_KEYBIT, BTN_TOUCH);
    ioctl(fd, UI_SET_KEYBIT, BTN_LEFT);
    for (i = 0; i <= 255; i++)
        ioctl(fd, UI_SET_KEYBIT, i);

    memset(&uidev, 0, sizeof(uidev));
    snprintf(uidev.name, UINPUT_MAX_NAME_SIZE, "uinput-sample");
    uidev.id.bustype = BUS_USB;
    uidev.id.vendor  = 0x1;
    uidev.id.product = 0x1;
    uidev.id.version = 1;

    write(fd, &uidev, sizeof(uidev));
    ioctl(fd, UI_DEV_CREATE);

    printf("Welcome to mouse control...\n");
    printf("CTRL-C to quit\n\n");

    // Switch terminal mode
    ioctl(0, TCGETS, &oldT);
    newT = oldT;
    newT.c_lflag &= ~(ECHO | ICANON);
    ioctl(0, TCSETS, &newT);


    while(1) {
        char c[2];

        read(0, c, 1);

        switch (c[0])
        {
            case 0xa:
                printf("CLICK!\n");
                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_KEY;
                ev.code = BTN_LEFT;
                ev.value = 1;
                write(fd, &ev, sizeof(struct input_event));
                ev.type = EV_SYN;
                ev.code = SYN_REPORT;
                ev.value = 0;
                write(fd, &ev, sizeof(struct input_event));

                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_KEY;
                ev.code = BTN_LEFT;
                ev.value = 0;
                write(fd, &ev, sizeof(struct input_event));
                ev.type = EV_SYN;
                ev.code = SYN_REPORT;
                ev.value = 0;
                write(fd, &ev, sizeof(struct input_event));
                break;

            case 0x1b:
                read(0, c, 2);
                if (c[0] == 0x5b)
                {
                    int dx = 0, dy = 0;
                    switch (c[1])
                    {
                        case 0x41:
                            printf("UP!\n");
                            dy = -10;
                            break;

                        case 0x42:
                            printf("DOWN!\n");
                            dy = 10;
                            break;

                        case 0x43:
                            printf("RIGHT\n");
                            dx = 10;
                            break;

                        case 0x44:
                            printf("LEFT!\n");
                            dx = -10;
                            break;
                    }

                    memset(&ev, 0, sizeof(struct input_event));
                    ev.type = EV_REL;
                    ev.code = REL_X;
                    ev.value = dx;
                    write(fd, &ev, sizeof(struct input_event));

                    memset(&ev, 0, sizeof(struct input_event));
                    ev.type = EV_REL;
                    ev.code = REL_Y;
                    ev.value = dy;
                    write(fd, &ev, sizeof(struct input_event));

                    memset(&ev, 0, sizeof(struct input_event));
                    ev.type = EV_SYN;
                    ev.code = 0;
                    ev.value = 0;
                    write(fd, &ev, sizeof(struct input_event));
                }
            default:
                switch (c[0])
                {
                    case 'a': c[0] = KEY_A; break;
                    case 'b': c[0] = KEY_B; break;
                    case 'c': c[0] = KEY_C; break;
                    case 'd': c[0] = KEY_D; break;
                    case 'e': c[0] = KEY_E; break;
                    case 'f': c[0] = KEY_F; break;
                    case 'g': c[0] = KEY_G; break;
                    case 'h': c[0] = KEY_H; break;
                    case 'i': c[0] = KEY_I; break;
                    case 'j': c[0] = KEY_J; break;
                    case 'k': c[0] = KEY_K; break;
                    case 'l': c[0] = KEY_L; break;
                    case 'm': c[0] = KEY_M; break;
                    case 'n': c[0] = KEY_N; break;
                    case 'o': c[0] = KEY_O; break;
                    case 'p': c[0] = KEY_P; break;
                    case 'q': c[0] = KEY_Q; break;
                    case 'r': c[0] = KEY_R; break;
                    case 's': c[0] = KEY_S; break;
                    case 't': c[0] = KEY_T; break;
                    case 'u': c[0] = KEY_U; break;
                    case 'v': c[0] = KEY_V; break;
                    case 'w': c[0] = KEY_W; break;
                    case 'x': c[0] = KEY_X; break;
                    case 'y': c[0] = KEY_Y; break;
                    case 'z': c[0] = KEY_Z; break;
                    case '1': c[0] = KEY_1; break;
                    case '2': c[0] = KEY_2; break;
                    case '3': c[0] = KEY_3; break;
                    case '4': c[0] = KEY_4; break;
                    case '5': c[0] = KEY_5; break;
                    case '6': c[0] = KEY_6; break;
                    case '7': c[0] = KEY_7; break;
                    case '8': c[0] = KEY_8; break;
                    case '9': c[0] = KEY_9; break;
                    case '0': c[0] = KEY_0; break;
                }
                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_KEY;
                ev.code = c[0];
                ev.value = 1;
                write(fd, &ev, sizeof(struct input_event));
                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_SYN;
                ev.code = SYN_REPORT;
                write(fd, &ev, sizeof(struct input_event));
                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_KEY;
                ev.code = c[0];
                ev.value = 0;
                write(fd, &ev, sizeof(struct input_event));
                memset(&ev, 0, sizeof(struct input_event));
                gettimeofday(&ev.time, NULL);
                ev.type = EV_SYN;
                ev.code = SYN_REPORT;
                write(fd, &ev, sizeof(struct input_event));
                break;
        }
    }

    return 0;
}
