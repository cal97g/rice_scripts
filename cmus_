import datetime
import json
cmus_remote_output = """
status playing
file /home/callam/Music/Stormzy - Gang Signs & Prayer (2017)/01. First Things First.mp3
duration 207
position 50
tag artist Stormzy
tag album Gang Signs & Prayer
tag title First Things First
tag date 2017
tag genre Hip-Hop/Rap
tag tracknumber 01
tag albumartist Stormzy
set aaa_mode album
set continue true
set play_library true
set play_sorted false
set replaygain disabled
set replaygain_limit true
set replaygain_preamp 0.000000
set repeat false
set repeat_current false
set shuffle false
set softvol false
set vol_left 100
set vol_right 100
"""

def parse_cmus_remote(output):
    out_dict = {}
    lines = output.split('\n')

    for l in lines:
        words = l.split()

        if not words:
            continue

        if words[0] == "tag":
            if words[1] in ["artist", "album", "title"]:
                out_dict[words[1]] = "".join([x + " " for x in words[2:]])[:-1]

        if words[0] in ["duration", "position"]:
            out_dict[words[0]] = int(words[1])
    out_dict["percentage_played"] = round(out_dict["position"] / out_dict["duration"] * 100, 2)

    return out_dict


cmus = parse_cmus_remote(cmus_remote_output)
minutes, seconds = divmod(cmus["position"], 60)
of_minutes, of_seconds = divmod(cmus["duration"], 60)
cmus["dur"] = {
    "played": "{}:{}".format(minutes,seconds),
    "of": "{}:{}".format(of_minutes, of_seconds)
}

print(json.dumps(cmus, indent = 4))
