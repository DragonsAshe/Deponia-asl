state("deponia")
{
	byte text : 0x0E15724 , 0x10, 0xA8;
	byte cutscene : "SDL2.dll", 0x00B7270 , 0x360;
}

init
{
	vars.split = 0;
	vars.timer = 0;
}

update
{
	print(vars.split.ToString());
	print(vars.timer.ToString());
	
}

start
{
	if (current.text == 0 && old.text == 1)
	{
		vars.split = 0;
		return true;
	}
}

split
{
    if (current.cutscene == 0 && old.cutscene != 0)
    {
        vars.split += 1;
        if (vars.split == 6 || vars.split == 8 || vars.split == 11)
        {
            return true;
        }
    }

	if (vars.split == 6)
	{
		vars.timer += 1;
	}

	if (vars.timer == 1500)
	{
		vars.split = 7;
	}

	if (vars.split == 7)
	{
		vars.timer = 0;
	}
}