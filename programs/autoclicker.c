#include <windows.h>

int main() {
    const int INTERVAL = 50;
    const char KEY = 'Z';

    while (1)
        while (GetAsyncKeyState(KEY) & 0x8000) {
            mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
            Sleep(50);
            mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            Sleep(INTERVAL);
        }
}
