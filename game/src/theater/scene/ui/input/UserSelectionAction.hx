package theater.scene.ui.input;

import theater.troupe.actor.BaseViewComponent;
import swfdata.SpriteData;
import gl.GlStage;
import theater.troupe.actor.BaseActor;
import input.BaseInputAction;

class UserSelectionAction extends BaseInputAction
{
    public var actorsList:Array<BaseActor>;
    public var stage:GlStage;

    public var selectedSprite:SpriteData = null;

    public function new()
    {
    }

    override public function execute(value:Bool)
    {
        if (value)
        {
            if (stage.spriteUnderMouse != null)
            {
                if (selectedSprite == stage.spriteUnderMouse)
                {
                    return;
                }
                else if (selectedSprite != null)
                {
                    // remove selection
                }

                // selection
            }
            else
            {
                // remove selection
            }
        }
        else
        {

        }
    }

    function select(sprite:SpriteData, value:Bool)
    {
        var toSelect = null;
        for (actor in actorsList)
        {
            var view:BaseViewComponent = actor.getComponent(BaseViewComponent);
            view.view == sprite;
            toSelect = actor;
            break;
        }

        if (value)
        {
            // set selectstatus
        }
        else
        {
           // set unselect status
        }
    }

}
