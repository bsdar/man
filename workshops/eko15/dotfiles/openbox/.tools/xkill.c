/* Xkill sample code by Jesse McClure
 * Released to public domain
 *
 * COMPILE:
 * cc -I/usr/X11R6/include -L/usr/X11R6/lib -lX11 -lXmu -o xkill xkill.c
 */

#include <X11/Xlib.h>
#include <X11/Xmu/WinUtil.h>
#include <stdio.h>

static int catch_window_errors(Display *dpy, XErrorEvent *ev);

int main()
{
	Display				*dpy = XOpenDisplay(0x0);
	if (!dpy)
		return 1;

	Window				root = DefaultRootWindow(dpy);
	Window				ignore, *win;
	XWindowAttributes	attr;
	unsigned int		nwin, i;

	XSync(dpy, 0);
	XSetErrorHandler(catch_window_errors);

	XQueryTree(dpy, root, &ignore, &ignore, &win, &nwin);
	for (i = 0; i < nwin; i++) {
		if (XGetWindowAttributes(dpy, win[i], &attr)
				&& (attr.map_state == IsViewable))
			win[i] = XmuClientWindow(dpy, win[i]);
		else
			win[i] = 0;
	}
	for (i = 0; i < nwin; i++) {
		if (win[i])
			XKillClient(dpy, win[i]);
	}

	if (win)
		XFree(win);

	XSync(dpy, 0);
	XSetErrorHandler(NULL);

	XCloseDisplay(dpy);

	return 0;
}

static int catch_window_errors(Display *dpy, XErrorEvent *ev)
{
	return 0;
}
