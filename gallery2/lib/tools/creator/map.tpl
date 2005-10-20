<?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2005 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */
/**
 * @version $Revision$ $Date$
 * @package {$ucModuleId}
 * @author {$authorFullName}
 */

/**
 * This is your map!
 *
 * @g2 <class-name>{$mapName}</class-name>
 * @g2 <schema>
 * @g2   <schema-major>1</schema-major>
 * @g2   <schema-minor>0</schema-minor>
 * @g2 </schema>
 *
 * @package {$ucModuleId}
 * @subpackage Classes
 */
class {$mapName}_core {ldelim}

    /**
     * @g2 <map>
     * @g2   <member>
     * @g2     <member-name>itemId</member-name>
     * @g2     <member-type>INTEGER</member-type>
     * @g2     <primary/>
     * @g2   </member>
     * @g2   <member>
     * @g2     <member-name>itemValue</member-name>
     * @g2     <member-type>STRING</member-type>
     * @g2     <member-size>MEDIUM</member-size>
     * @g2   </member>
     * @g2 </map>
     */
{rdelim}

include(dirname(__FILE__) . '/interfaces/{$mapName}.inc');
?>
