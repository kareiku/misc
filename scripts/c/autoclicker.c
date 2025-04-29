#include <windows.h>

int main() {
    const char KEY = 'Z';
    const int CLICK_INTERVAL = 100;
    const int KEY_DOWN_UP_INTERVAL = 50;

    while (1) {
        while (GetAsyncKeyState(KEY) & 0x8000) {
            mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
            Sleep(KEY_DOWN_UP_INTERVAL);
            mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            Sleep(CLICK_INTERVAL);
        }
    }
}
