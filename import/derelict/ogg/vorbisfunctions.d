/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.ogg.vorbisfunctions;

private
{
    import core.stdc.config;
    import derelict.ogg.oggtypes;
    import derelict.ogg.vorbistypes;
}

extern(C)
{
    alias nothrow void function(vorbis_info*) da_vorbis_info_init;
    alias nothrow void function(vorbis_info*) da_vorbis_info_clear;
    alias nothrow int  function(vorbis_info*,int) da_vorbis_info_blocksize;
    alias nothrow void function(vorbis_comment*) da_vorbis_comment_init;
    alias nothrow void function(vorbis_comment*, byte*t) da_vorbis_comment_add;
    alias nothrow void function(vorbis_comment*, byte*, byte*) da_vorbis_comment_add_tag;
    alias nothrow byte* function(vorbis_comment*, byte*, int) da_vorbis_comment_query;
    alias nothrow int function(vorbis_comment*, byte*) da_vorbis_comment_query_count;
    alias nothrow void function(vorbis_comment*) da_vorbis_comment_clear;
    alias nothrow int function(vorbis_dsp_state*, vorbis_block*) da_vorbis_block_init;
    alias nothrow int function(vorbis_block*) da_vorbis_block_clear;
    alias nothrow void function(vorbis_dsp_state*) da_vorbis_dsp_clear;
    alias nothrow double function(vorbis_dsp_state*, ogg_int64_t) da_vorbis_granule_time;
    alias nothrow const(char)* function() da_vorbis_version_string;
    alias nothrow int function(vorbis_dsp_state*,vorbis_info*) da_vorbis_analysis_init;
    alias nothrow int function(vorbis_comment*, ogg_packet*) da_vorbis_commentheader_out;
    alias nothrow int function(vorbis_dsp_state*, vorbis_comment*, ogg_packet*, ogg_packet*, ogg_packet*) da_vorbis_analysis_headerout;
    alias nothrow float** function(vorbis_dsp_state*, int) da_vorbis_analysis_buffer;
    alias nothrow int function(vorbis_dsp_state*, int) da_vorbis_analysis_wrote;
    alias nothrow int function(vorbis_dsp_state*,vorbis_block*) da_vorbis_analysis_blockout;
    alias nothrow int function(vorbis_block*,ogg_packet*) da_vorbis_analysis;
    alias nothrow int function(vorbis_block*) da_vorbis_bitrate_addblock;
    alias nothrow int function(vorbis_dsp_state*, ogg_packet*) da_vorbis_bitrate_flushpacket;
    alias nothrow int function(ogg_packet*) da_vorbis_synthesis_idheader;
    alias nothrow int function(vorbis_info*, vorbis_comment*, ogg_packet*) da_vorbis_synthesis_headerin;
    alias nothrow int function(vorbis_dsp_state*, vorbis_info*) da_vorbis_synthesis_init;
    alias nothrow int function(vorbis_dsp_state*) da_vorbis_synthesis_restart;
    alias nothrow int function(vorbis_block*, ogg_packet*) da_vorbis_synthesis;
    alias nothrow int function(vorbis_block*, ogg_packet*) da_vorbis_synthesis_trackonly;
    alias nothrow int function(vorbis_dsp_state*,vorbis_block*) da_vorbis_synthesis_blockin;
    alias nothrow int function(vorbis_dsp_state*, float***) da_vorbis_synthesis_pcmout;
    alias nothrow int function(vorbis_dsp_state*, float***) da_vorbis_synthesis_lapout;
    alias nothrow int function(vorbis_dsp_state*, int) da_vorbis_synthesis_read;
    alias nothrow c_long function(vorbis_info*,ogg_packet*) da_vorbis_packet_blocksize;
    alias nothrow int function(vorbis_info*, int) da_vorbis_synthesis_halfrate;
    alias nothrow int function(vorbis_info*) da_vorbis_synthesis_halfrate_p;
}

__gshared
{
    da_vorbis_info_init vorbis_info_init;
    da_vorbis_info_clear vorbis_info_clear;
    da_vorbis_info_blocksize vorbis_info_blocksize;
    da_vorbis_comment_init vorbis_comment_init;
    da_vorbis_comment_add vorbis_comment_add;
    da_vorbis_comment_add_tag vorbis_comment_add_tag;
    da_vorbis_comment_query vorbis_comment_query;
    da_vorbis_comment_query_count vorbis_comment_query_count;
    da_vorbis_comment_clear vorbis_comment_clear;
    da_vorbis_block_init vorbis_block_init;
    da_vorbis_block_clear vorbis_block_clear;
    da_vorbis_dsp_clear vorbis_dsp_clear;
    da_vorbis_granule_time vorbis_granule_time;
    da_vorbis_version_string vorbis_version_string;
    da_vorbis_analysis_init vorbis_analysis_init;
    da_vorbis_commentheader_out vorbis_commentheader_out;
    da_vorbis_analysis_headerout vorbis_analysis_headerout;
    da_vorbis_analysis_buffer vorbis_analysis_buffer;
    da_vorbis_analysis_wrote vorbis_analysis_wrote;
    da_vorbis_analysis_blockout vorbis_analysis_blockout;
    da_vorbis_analysis vorbis_analysis;
    da_vorbis_bitrate_addblock vorbis_bitrate_addblock;
    da_vorbis_bitrate_flushpacket vorbis_bitrate_flushpacket;
    da_vorbis_synthesis_idheader vorbis_synthesis_idheader;
    da_vorbis_synthesis_headerin vorbis_synthesis_headerin;
    da_vorbis_synthesis_init vorbis_synthesis_init;
    da_vorbis_synthesis_restart vorbis_synthesis_restart;
    da_vorbis_synthesis vorbis_synthesis;
    da_vorbis_synthesis_trackonly vorbis_synthesis_trackonly;
    da_vorbis_synthesis_blockin vorbis_synthesis_blockin;
    da_vorbis_synthesis_pcmout vorbis_synthesis_pcmout;
    da_vorbis_synthesis_lapout vorbis_synthesis_lapout;
    da_vorbis_synthesis_read vorbis_synthesis_read;
    da_vorbis_packet_blocksize vorbis_packet_blocksize;
    da_vorbis_synthesis_halfrate vorbis_synthesis_halfrate;
    da_vorbis_synthesis_halfrate_p vorbis_synthesis_halfrate_p;
}