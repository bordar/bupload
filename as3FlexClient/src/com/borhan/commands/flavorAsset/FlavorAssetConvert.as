// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Borhan Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2011  Borhan Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetConvertDelegate;
	import com.borhan.net.BorhanCall;

	/**
	 * Add and convert new Flavor Asset for Entry with specific Flavor Params
	 * 
	 **/
	public class FlavorAssetConvert extends BorhanCall
	{
		public var filterFields : String;
		
		/**
		 * @param entryId String
		 * @param flavorParamsId int
		 * @param priority int
		 **/
		public function FlavorAssetConvert( entryId : String,flavorParamsId : int,priority : int=0 )
		{
			service= 'flavorasset';
			action= 'convert';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push('entryId');
			valueArr.push(entryId);
			keyArr.push('flavorParamsId');
			valueArr.push(flavorParamsId);
			keyArr.push('priority');
			valueArr.push(priority);
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new FlavorAssetConvertDelegate( this , config );
		}
	}
}
