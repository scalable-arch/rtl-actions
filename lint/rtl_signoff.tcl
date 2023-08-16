############################################################
# check environment
############################################################
try {
    if { [info exists env(SPYGLASS_HOME)] } {
        puts "\$SPYGLASS_HOME: $env(SPYGLASS_HOME)";
    } else {
        puts "(Env setting error): \$SPYGLASS_HOME is not set"
        exit 1; 
    }
    
    if { [info exists env(DESIGN_TOP)] } {
        puts "\$DESIGN_TOP: $env(DESIGN_TOP)";
        set DESIGN_TOP $env(DESIGN_TOP)
    } else {
        puts "(IP setting error): \$DESIGN_TOP is not set"
        exit 1; 
    }
    
    if { [info exists env(DESIGN_FILELIST)] } {
        puts "\$DESIGN_FILELIST: $env(DESIGN_FILELIST)";
        set DESIGN_FILELIST $env(DESIGN_FILELIST)
    } else {
        puts "(IP setting error): \$DESIGN_FILELIST is not set"
        exit 1; 
    }
    
    #
    set PROJECT RTL_HANDOFF.${DESIGN_TOP}
    
    # Delete an existing project, if any
    file delete -force -- ${PROJECT}.prj ${PROJECT}
    
    # Create a new project
    new_project ${PROJECT}
    
    # Rules for RTL handoff
    current_methodology $env(SPYGLASS_HOME)/GuideWare/latest/block/rtl_handoff
    
    #Read Files
    read_file -type sourcelist ${DESIGN_FILELIST}
    
    #Read waiver files
    waive -rule { {NoAssignX-ML} } -comment {Initialization to 'x' can be helpful for debugging.}
    #read_file -type awl ../waiver.awl
    
    set_option enableSV09 yes
    set_option language_mode mixed
    set_option allow_module_override yes
    set_option designread_disable_flatten no
    set_option ignoredu axi_xbar_intf
    set_option top ${DESIGN_TOP}
    
    # Disable HWPE Mac Engine Usage
    #set_option param {pulpissimo.USE_HWPE=0}
    
    # Link Design
    compile_design
    
    # Set lint_rtl goal and run
    current_goal lint/lint_rtl
    run_goal
    
    save_project
    
    # Create reports
    exec mkdir -p reports
    write_report -reportdir reports project_summary
    write_report -reportdir reports moresimple > reports/moresimple.rpt
    save_project
}
exit -force
