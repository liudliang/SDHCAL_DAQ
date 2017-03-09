
 add_fsm_encoding \
       {usb_synchronous_slavefifo.State} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }

 add_fsm_encoding \
       {Microroc_Parameters.State} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} {111 111} }

 add_fsm_encoding \
       {Param_Bitshift.State} \
       { }  \
       {{000 000} {001 001} {010 011} {011 100} {100 110} {101 101} {110 010} }

 add_fsm_encoding \
       {DaqControl.State} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0101} {0110 0110} {0111 0111} {1000 1000} }
