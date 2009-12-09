###############################################################################
#
# Copyright (c) 2008 by GolemJ <golemj@gmail.com>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
###############################################################################
#
# Log highlights msg to core buffer
#
# History:
#   2009-05-02, FlashCode <flashcode@flashtux.org>:
#       version 0.6, sync with last API changes
#   2008-11-30, GolemJ <golemj@gmail.com>:
#       version 0.5, conversion to WeeChat 0.3.0+
#
###############################################################################

use strict;

weechat::register( "awaylog", "Jiri Golembiovsky", "0.6", "GPL", "Prints highlights to core buffer", "", "" );
weechat::hook_print( "", "", "", 1, "highlight_cb", "" );

if( weechat::config_get_plugin( "on_away_only" ) eq "" ) {
  weechat::config_set_plugin( "on_away_only", "off" );
}

sub highlight_cb {
  if( $_[5] == 1 ) {
    my $away = weechat::buffer_get_string($_[1], "localvar_away");
    if (($away ne "") || (weechat::config_get_plugin( "on_away_only" ) ne "on"))
    {
        my $plugin = weechat::buffer_get_string($_[1], "plugin");
        my $name = weechat::buffer_get_string($_[1], "name");
        weechat::print("", "${plugin}.${name} -- $_[6] :: $_[7]");
    }
  }
  
  return weechat::WEECHAT_RC_OK;
}
