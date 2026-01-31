extends Node

#signal emitted whenever any mask is taken off
signal mask_off

# signal emitted whenever the player puts on the default mask
signal default_mask_on

# signal emitted whenever the player puts on the objects mask
# (provisional name)
signal object_mask_on

signal deactivate_input

# signals to indicate wether the timer is running or not
signal mask_timer_started
signal mask_timer_stopped
