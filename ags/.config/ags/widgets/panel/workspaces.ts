import { Workspace } from "types/service/hyprland"
import { sh, range } from "../../lib/utils.js"
import Gdk from "gi://Gdk"
import cairo from "gi://cairo?version=1.0"

const hyprland = await Service.import('hyprland')

const create_workspace = (workspace: Workspace) => Widget.Button({
    child: Widget.Label({
        name: workspace.name,
        class_name: "workspace",
        vpack: "center",
        label: workspace.name == workspace.id.toString() ? "*" : workspace.name,
        setup: self => self.hook(hyprland, () => {
            const active = hyprland.active.workspace.id === workspace.id
            self.toggleClassName("active", active)
            self.toggleClassName("occupied", (hyprland.getWorkspace(workspace.id)?.windows || 0) > 0 && !active)
            self.toggleClassName("empty", (hyprland.getWorkspace(workspace.id)?.windows || 0) === 0 && !active)
        }),
    }),
    on_primary_click: () => sh("hyprctl dispatch workspace", workspace.name),
})

function create_persistent_workspaces(monitor: number, count: number): Workspace[] {
    return range(count).map(value => {
        const workspace: Workspace = {
            "id": value + 1,
            "name": `${value + 1}`,
            "monitor": "",
            "monitorID": monitor,
            "windows": 0,
            "hasfullscreen": false,
            "lastwindow": "",
            "lastwindowtitle": "",
        }
        return workspace
    });
}

export default function (monitor: number, persistent: number = 0) {
    const ids = hyprland.workspaces.map(workspace => workspace.id);
    return Widget.Box({
        name: "workspaces",
        class_name: "workspaces",
        spacing: 4,
        children: [
            ...hyprland.workspaces,
            ...create_persistent_workspaces(monitor, persistent).filter(
                workspaces => !ids.includes(workspaces.id)
            )
        ].filter(
            workspace => workspace.monitorID == monitor
        ).sort(
            (a, b) => a.id - b.id
        ).map(create_workspace)
    })
}
