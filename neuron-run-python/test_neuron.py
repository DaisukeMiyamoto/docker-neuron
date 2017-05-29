import numpy as np
import matplotlib.pyplot as plt
import neuron

def calc_hh():

    soma = neuron.h.Section(name="soma")

    soma.nseg = 3    # odd number
    soma.diam = 10   # [um]
    soma.L = 10      # [um]


    soma.insert("hh")
    meca = soma(0.5).hh

    stim = neuron.h.IClamp(soma(0.5))
    stim.delay = 50  # [ms]
    stim.dur = 200   # [ms]
    stim.amp = 0.15  # [nA]


    rec_t = neuron.h.Vector()
    rec_t.record(neuron.h._ref_t)

    rec_v = neuron.h.Vector()
    rec_v.record(soma(0.5)._ref_v)

    neuron.h.finitialize(-65)
    tstop = 300
    neuron.run(tstop)


    # convert neuron array to numpy array
    time = rec_t.as_numpy()
    voltage = rec_v.as_numpy()

    # show graph by matplotlib
    plt.plot(time, voltage, color='b')
    plt.xlabel("Time [ms]")
    plt.ylabel("Voltage [mV]")
    plt.axis(xmin=0, xmax=max(time), ymin=min(voltage)-5, ymax=max(voltage)+5)
    plt.show()


if __name__ == '__main__':
    calc_hh()
