# Set the Vivado project name and path
set project_name "ethernet_test_project"
set project_dir "./$project_name"  
set src_dir "./src"   

# Create a new Vivado project
create_project $project_name $project_dir -force

set_property board_part digilentinc.com:arty-a7-100:part0:1.1 [current_project]

# Add all HDL files from the 'src' directory
set hdl_files [glob -nocomplain $src_dir/*.vhd $src_dir/*.v $src_dir/*.edn]

# Add each HDL file to the project
foreach file $hdl_files {
    add_files $file
}

# Add HDL files to the project for synthesis
update_compile_order -fileset sources_1

add_files -fileset constrs_1 -norecurse ../ethernet_test/xdc/Arty-A7-100-Master.xdc
import_files -fileset constrs_1 ../ethernet_test/xdc/Arty-A7-100-Master.xdc


# Open the Vivado GUI
start_gui
