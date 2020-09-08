#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk

class HelloWorld:


    def gtk_main_quit(self, widget, data=None):
        gtk.main_quit()
        return False

    def __init__(self):
        builder = gtk.Builder()
        builder.add_from_file("/etc/bus/apps/salamandra/SalamandraTIUSv0.25/win_vst.glade")
        self.window = builder.get_object("window1")
	self.window.set_keep_above(True) ##### ALWAYS ON TOP #####
        builder.connect_signals(self)
	self.window.fullscreen()   ##### FULLSCREEN #####
        self.window.show()

def main():
    gtk.main()

if __name__=='__main__':
    h = HelloWorld()
    main()
