/*
Copyright (c) 2010 Tink Ltd - http://www.tink.ws

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions
of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package ws.tink.spark.layouts.supportClasses
{
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;
	
	import spark.components.supportClasses.GroupBase;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalAlign;

	public class PerspectiveAnimationNavigatorLayoutBase extends AnimationNavigatorLayoutBase
	{
		
		private var _projectionChanged	: Boolean;
		
		private var _unscaledWidth	: Number;
		private var _unscaledHeight	: Number;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 
		 * 
		 *  @param animationType The type of animation.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */ 
		public function PerspectiveAnimationNavigatorLayoutBase( animationType:String )
		{
			super( animationType );
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  projectionCenter
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get projectionCenter():Point
		{
			return ( perspectiveProjection ) ? perspectiveProjection.projectionCenter : getProjectionCenter();
		}
		
		
		//----------------------------------
		//  projectionCenterHorizontalAlign
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for projectionCenterHorizontalAlign.
		 */
		private var _projectionCenterHorizontalAlign:String = HorizontalAlign.CENTER;
		
		[Inspectable(category="General", enumeration="left,right,center", defaultValue="center")]
		/**
		 *  projectionCenterHorizontalAlign
		 * 
		 *  @default "center"
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get projectionCenterHorizontalAlign():String
		{
			return _projectionCenterHorizontalAlign;
		}
		/**
		 *  @private
		 */
		public function set projectionCenterHorizontalAlign(value:String):void
		{
			if( value == _projectionCenterHorizontalAlign ) return;
			
			_projectionCenterHorizontalAlign = value;
			
			invalidateTargetDisplayList();
		}
		
		
		//----------------------------------
		//  projectionCenterVerticalAlign
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for projectionCenterVerticalAlign.
		 */
		private var _projectionCenterVerticalAlign:String = VerticalAlign.MIDDLE;
		
		[Inspectable(category="General", enumeration="top,bottom,middle", defaultValue="middle")]
		/**
		 *  projectionCenterVerticalAlign
		 * 
		 *  @default "middle"
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get projectionCenterVerticalAlign():String
		{
			return _projectionCenterVerticalAlign;
		}
		/**
		 *  @private
		 */
		public function set projectionCenterVerticalAlign(value:String):void
		{
			if( value == _projectionCenterVerticalAlign ) return;
			
			_projectionCenterVerticalAlign = value;
			
			invalidateTargetDisplayList();
		}
		
		
		//----------------------------------
		//  projectionCenterHorizontalOffset
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for projectionCenterHorizontalOffset.
		 */
		private var _projectionCenterHorizontalOffset:Number = 0;
		
		[Inspectable(category="General", defaultValue="0")]
		/**
		 *  projectionCenterHorizontalOffset
		 * 
		 *  @default 0
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get projectionCenterHorizontalOffset():Number
		{
			return _projectionCenterHorizontalOffset;
		}
		/**
		 *  @private
		 */
		public function set projectionCenterHorizontalOffset(value:Number):void
		{
			if( _projectionCenterHorizontalOffset == value ) return;
			
			_projectionCenterHorizontalOffset = value;
			invalidateTargetDisplayList();
		}    
		
		
		//----------------------------------
		//  projectionCenterVerticalOffset
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for projectionCenterVerticalOffset.
		 */
		private var _projectionCenterVerticalOffset:Number = 0;
		
		[Inspectable(category="General", defaultValue="0")]
		/**
		 *  projectionCenterVerticalOffset
		 * 
		 *  @default 0
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get projectionCenterVerticalOffset():Number
		{
			return _projectionCenterVerticalOffset;
		}
		/**
		 *  @private
		 */
		public function set projectionCenterVerticalOffset(value:Number):void
		{
			if( _projectionCenterVerticalOffset == value ) return;
			
			_projectionCenterVerticalOffset = value;
			invalidateTargetDisplayList();
		}
		
		
		//----------------------------------
		//  fieldOfView
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for fieldOfView.
		 */
		private var _fieldOfView:Number = NaN;
		
		[Inspectable(category="General")]
		/**
		 *  fieldOfView
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get fieldOfView():Number
		{
			return ( perspectiveProjection ) ? perspectiveProjection.fieldOfView : _fieldOfView;
		}
		/**
		 *  @private
		 */
		public function set fieldOfView( value:Number ):void
		{
			if( _fieldOfView == value ) return;
			
			_fieldOfView = value;
			_focalLength = NaN;
			_projectionChanged = true;
			invalidateTargetDisplayList();
		}    
		
		
		//----------------------------------
		//  focalLength
		//----------------------------------  
		
		/**
		 *  @private
		 *	Storage property for focalLength.
		 */
		private var _focalLength:Number = NaN;
		
		[Inspectable(category="General")]
		/**
		 *  focalLength
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get focalLength():Number
		{
			return ( perspectiveProjection ) ? perspectiveProjection.focalLength : _focalLength;
		}
		/**
		 *  @private
		 */
		public function set focalLength( value:Number ):void
		{
			if( _focalLength == value ) return;
			
			_focalLength = value;
			_fieldOfView = NaN;
			_projectionChanged = true;
			invalidateTargetDisplayList();
		}
		
		
		//----------------------------------
		//  perspectiveProjection
		//----------------------------------  
		
		/**
		 *  @private
		 */
		private function get perspectiveProjection():PerspectiveProjection
		{
			return target.transform.perspectiveProjection;
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  target
		//----------------------------------    
		
		/**
		 *  @inheritDoc
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		override public function set target(value:GroupBase):void
		{
			super.target = value;
			
			_projectionChanged = true;
			invalidateTargetDisplayList();
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private function getProjectionCenter():Point
		{
			var p:Point = new Point();
			switch( _projectionCenterHorizontalAlign )
			{
				case HorizontalAlign.LEFT :
				{
					p.x = _projectionCenterHorizontalOffset;
					break;
				}
				case HorizontalAlign.CENTER :
				{
					p.x = ( _unscaledWidth / 2 ) + _projectionCenterHorizontalOffset;
					break;
				}
				case HorizontalAlign.RIGHT :
				{
					p.x = _unscaledWidth + _projectionCenterHorizontalOffset;
					break;
				}
			}
			
			switch( _projectionCenterVerticalAlign )
			{
				case VerticalAlign.TOP :
				{
					p.y = _projectionCenterVerticalOffset;
					break;
				}
				case VerticalAlign.MIDDLE :
				{
					p.y = ( _unscaledHeight / 2 ) + _projectionCenterVerticalOffset;
					break;
				}
				case VerticalAlign.BOTTOM :
				{
					p.y = _unscaledHeight + _projectionCenterVerticalOffset;
					break;
				}
			}
			
			return p;
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @inheritDoc
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		override public function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
		{
			super.updateDisplayList( unscaledWidth, unscaledHeight );
			
			if( _unscaledWidth != unscaledWidth || _unscaledHeight != unscaledHeight )
			{
				_unscaledWidth = unscaledWidth;
				_unscaledHeight = unscaledHeight;
				_projectionChanged = true;
			}
			
			if( target && _projectionChanged )
			{
				_projectionChanged = false;
				
				if( !perspectiveProjection ) target.transform.perspectiveProjection = new PerspectiveProjection();
				
				perspectiveProjection.projectionCenter = getProjectionCenter();
				if( !isNaN( _fieldOfView ) ) perspectiveProjection.fieldOfView = _fieldOfView;
				if( !isNaN( _focalLength ) ) perspectiveProjection.focalLength = _focalLength;
			}
			
		}
	}
}