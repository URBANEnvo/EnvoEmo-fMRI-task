# Faces task
# Brad Zoltick, NIMH/GCAP, 05may04
# Yuchen Lin, Oksana Berhe, Jamila Andoh, ZI/SNiP, Feb2023

scenario = "urbantask";
# uncomment the next line to enable the trigger

#scenario_type = fMRI_emulation;
scenario_type = fMRI;
pcl_file = "urbantask.pcl";

# header defaults
pulse_code = 23;
pulses_per_scan = 1;
scan_period = 800;

#default_background_color = 255, 255, 255;
default_background_color = 0, 0, 0;
#default_text_color = 0, 0, 0;
default_text_color = 255, 255, 255;
default_text_align = align_center;
default_font_size = 24;
default_font = "Arial";

response_matching = simple_matching;
active_buttons = 4;
button_codes = 1, 2, 3, 4;

default_trial_start_delay = 0;      # 0 sec between trials
default_stimulus_time_in = 0;       # stimulus starts with probe
default_trial_type = fixed;         # button press does not end trial
default_all_responses = true;       # log all responses

$delay = 10;								# refresh delays

begin;
picture {}default;

# used for building fixed crosshair
box { height = 9; width = 120; color = 255,255,255; } horiz;
box { height = 120; width = 9; color = 255,255,255; } vert;

# used for building borders for boxes
box { height = 5; width = 600; color = 0,0,0; } borH;
box { height = 5; width = 900; color = 0,0,0; } borLH;
box { height = 304; width = 5; color = 0,0,0; } borV;

picture {
   box horiz; x = 0; y = 0;
   box vert;  x = 0; y = 0;
} crosshair;

picture {
   text {
      caption = "Die Aufgabe startet gleich";
      font = "Arial"; 
      font_size = 46;
      };
      x = 0; y = 0;
} instruct_pic;

picture {
   text {
      caption = "Kreuzen Sie bitte in jeder Zeile die Figur an, 
            die am Besten wiedergibt, wie Sie sich fuehlen! 
         Sie duerfen dabei Ihr Kreuz auch zwischen den Figuren setzen.";
      font = "Arial"; 
      font_size = 22;
      };
      x = -20; y = 0;
} SAM_instruct_pic;



 text {
      caption = "x";
      font = "Arial"; 
      font_size = 6;
      font_color = 200,200,200;
      } button_press;
 
#Fixationskreuze, jitter
trial {  
    picture {text {caption = "+"; font_size = 80;}; x = 0; y = 0;};
    code = "isi";
} isi_trial;

array {
   TEMPLATE "urbantask.tem" {
      TEMPLATE "eimgorder1.txt";
   };
} epics1;                     # enviroment picture


array {
   TEMPLATE "urbantask.tem" {
      TEMPLATE "EEimgorder1.txt";
   };
} pics1;


trial {
   trial_type = fixed;
   stimulus_event {
      picture default;
      time = 0;
      code = "enviroment";
      duration = 5000;
      # target_button = 1;   # set in PCL
   } stim_eimage;
 } eimage_trial;                        # enviroment picture trail

trial {
   trial_type = fixed;
   stimulus_event {
      picture default;
      time = 0;
      code = "face";
      duration = 200;
      #target_button = 1;   # set in PCL
   } stim_image;
 } image_trial;

trial {
   trial_type = fixed;
   stimulus_event {
      picture default;
      time = 0;
      code = "text";
      duration = 2000;
   } stim_text;
} text_trial;



trial { 
   trial_type = fixed;
   picture {text {caption = "+"; font_size = 80;}; x = 0; y = 0;};
   time = 0;
   code = "crosshair";
   duration = 2000;
} fixation_trial;

trial { 
   trial_type = fixed;
   picture {text {caption = "+"; font_size = 80;}; x = 0; y = 0;};
   time = 0;
   code = "crosshair";
   duration = 1000;
} longfixation_trial;

trial {
   picture instruct_pic;
   time = 0;
   picture default;
   mri_pulse = 5;
   code = "instruct";
} instruct_trial;

trial {
   picture SAM_instruct_pic;
   time = 0;
   code = "instruct";
   duration = 5000;
} SAM_instruct_trial;


trial {
   trial_type = fixed;
   start_time = 0;
   # picture instruct_pic;
   picture default;
   time = 0;
   # uncomment to trigger the 8 sec instruction
   code = "ende";
   #duration = '8000 - $delay';
} end_trial;

##########################
# SAM trial
bitmap { filename = "arousal_five_2.png"; } samarousal;
bitmap { filename = "valenz_five_2.png"; } samvalenz;

line_graphic {
	coordinates = -500, 0, 500, 0;
	line_color = 100, 100, 100;
	line_width = 10;
} line1;

ellipse_graphic {
      ellipse_width = 50;
      ellipse_height = 50;
      color = 255, 0, 0;
      rotation = 1;
   }ellipse1;


picture {
	background_color = 0, 0, 0;
	line_graphic line1;
	center_x = 0; center_y = -100;
	ellipse_graphic ellipse1;
	center_x = 0; center_y = -100;
	bitmap samarousal;
	center_x = 0; center_y = 100;
   } vaspic;

picture {
	background_color = 0, 0, 0;
} nopic;

trial {trial_type = fixed; trial_duration = 500;
			picture {text {caption = "+"; font_size = 80;}; x = 0; y = 0;};
			} cross_trial;#new
# vaspresent ###################################################
trial{
	trial_duration = 10000;#forever;
	trial_type = first_response;
	picture vaspic;
	code = "vas_present";
	#target_button = 1;
	time = 0;			
}vas_present;

# save ########################################################
trial{
	trial_duration = stimuli_length;
	trial_type = fixed;
	
   stimulus_event {
			#picture {text cross; center_x = 0; center_y = 0;};
			picture nopic;
			code = "pic2";
			time = 0;
			duration = 1;
   } event1;
}save;
