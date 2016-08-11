/*******************************************************************************
* NOME DO ARQUIVO :        modules/gameplay/anticheat.pwn
*
* DESCRIÇÃO :
*       Responsável por dar as punições aos jogadores suspeitos de cheating
*
* NOTAS :
*       -
*/

#include <YSI\y_hooks>

//------------------------------------------------------------------------------

static const g_anticheat_names[][] =
{
    "air-breaking",
    "air-breaking",
    "teleport-hack",
    "teleport-hack",
    "teleport-hack",
    "teleport-hack",
    "teleport-hack",
    "fly-hack",
    "fly-hack",
    "speed hack",
    "speed hack",
    "health hack",
    "health hack",
    "armour hack",
    "money hack",
    "weapon hack",
    "ammo hack",
    "ammo hack",
    "anti anim hack",
    "godmode hack",
    "godmode hack",
    "invisible hack",
    "lagcomp hack",
    "tuning hack",
    "parkour mod",
    "quick turn",
    "rapid fire",
    "fake spawn",
    "fake kill",
    "auto aim",
    "CJ run",
    "carShot",
    "carJack",
    "descongelar hack",
    "AFK Ghost",
    "full aiming",
    "fake NPC",
    "reconnect",
    "ping alto",
    "dialog hack",
    "sandbox protection",
    "invalid version",
    "rcon hack",
    "tuning crasher",
    "assento de veículo inválido",
    "dialog crasher",
    "attached object crasher",
    "weapon crasher",
    "flood",
    "flood",
    "flood",
    "ddos",
    "sobeit NOP"
};

//------------------------------------------------------------------------------

forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
    switch (code)
    {
        case 0, 1:
        {
            SendClientMessageToAllf(COLOR_LIGHT_RED, "* %s foi kickado do servidor. Motivo: Suspeitas de air-breaking.", GetPlayerNamef(playerid));
            Kick(playerid);
        }
        case 9, 10:
        {
            SendClientMessageToAllf(COLOR_LIGHT_RED, "* %s foi kickado do servidor. Motivo: Suspeitas de speed-hacking.", GetPlayerNamef(playerid));
            Kick(playerid);
        }
        default:
        {
            SendAdminMessage(PLAYER_RANK_RECRUIT, COLOR_LIGHT_RED, "[ANTICHEAT] O jogador %s foi acusado de suspeitas de %s.", GetPlayerNamef(playerid), g_anticheat_names[code]);
        }
    }
    return 1;
}

//------------------------------------------------------------------------------

hook OnGameModeInit()
{
    EnableAntiCheat(39, false);
    EnableAntiCheat(38, false);
    EnableAntiCheat(37, false);
    EnableAntiCheat(14, false);
    return 1;
}
