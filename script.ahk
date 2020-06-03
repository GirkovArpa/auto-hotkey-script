global ctrl_i_pressed := false
global t_pressed := false
global t_released := false

SetTimer, myLoop, 0

myLoop(){
    if (t_pressed) {
      Send, {z down}
    }
}

^i::
  ctrl_i_pressed := true
  return

$t::
  if (ctrl_i_pressed) {
    t_pressed := true
    return
  }
  Send, {t down}
  return

t up::
  if (t_pressed and not t_released) {
    t_released := true 
    return
  }
  if (t_released) {
    ctrl_i_pressed := false
    t_pressed := false
    t_released := false
    return
  }
  Send, {t up}
  return
