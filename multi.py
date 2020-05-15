# This Python file uses the following encoding: utf-8
import sys
import time
import traceback
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *

# GLI type threadpool implementation
# ----------------------------------
# Below class also shows how to implement own signals
#
# Singals .emit() values which are picked up by slots via arguments on other functions via .connect()
class ThreadSignals(QObject):
    """
    Defines a signal of a Thread in execution

    SIGNALS created
    started,finished = no data
    error = <tuple> of exc_type, value and traceback.format_exc() types
    result = <object> returnes from thread processing
    progress = <int> passes current status of thread: kwarg callback get from running code (main function)
    """
    started = pyqtSignal()
    finished = pyqtSignal()
    error = pyqtSignal(tuple)
    result = pyqtSignal(object)
    progress = pyqtSignal(int)

class Thread(QRunnable):
    """
    OVERRRIDEN METHOD
    Class container of job to be executed on another thread
    """

    def __init__(self, function, *args, **kwargs):
        """
        Allow class to pass arguments and keywords
        Class accepts the function itself to be executed as a thread

        Signals will emit a behaviour as an argument for slots
        """
        super(Thread,self).__init__()
        self.args = args
        self.kwargs = kwargs
        self.fn = function
        self.signals = ThreadSignals()





        # Keyword Callback which is received from running self.fn
        # Note: self.signals.progress set on running code will pass the value to keyword
        # Note: kwargs now holds the progress signal property. Definition on running code will define the .emit() behaviour/output
        self.kwargs['progress_callback'] = self.signals.progress

        print("verification: ",self.kwargs)

    @pyqtSlot()
    def run(self):
        """
        Function to be executed on thread
        self.fn: Function called on constructor

        Note: signals behaviour/output are being implemented here through .emit()
        """
        try:
            self.signals.started.emit()
            # result gets and executes function thread
            result = self.fn(*self.args, **self.kwargs)
        except:
            traceback.print_exc()
            exctype, value = sys.exc_info()[:2]

            #SLOTS for each ThreadSignals
            self.signals.error.emit((exctype,value,traceback.format_exc()))
        else:
            #SLOT results will pass result as argument on signal
            self.signals.result.emit(result)
        finally:
            #SLOT finished will emit anytime def run() is finished processing
            self.signals.finished.emit()
        print("Thread completed")
