Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326E3C1D7A
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614150; cv=none; b=d7O9dqKCmve63R0x11pemq6e0uox4epz7qmMrzMcUdlB3j4CzuG8SSW+MWCnS7Ajr8UNRxidAM68imE6N/s7GWmzj1Z3FWvTr6/nTmH0yj2N1xlHZ8OtPZVoPxZdk5iHhGXaYfPL0MV3OoSisFsJjksQ+3jXTLQkyVZ8q9dUvPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614150; c=relaxed/simple;
	bh=4jeA8bLhDXqhAAgPzlqYDmLs8qIyVvIfxN87vJe9+0Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HJdWspjDjcYLtTjY/3Dfck0khZo9lB05RW1w0Dkth8gQgx+uBGE0hr3TAEeoKxcWKkpfFu3MV2m8zpBgbsUhhcFF+MAqWrpfX89jXmpUpKpNcujflbzV0Avhfl+XNwcodVPklZRXYrup/HR9J8J0aa8xqGPa7gg+sw0sAc+UrgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t//bQ4X8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t//bQ4X8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E181C2BCF4
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785614149;
	bh=4jeA8bLhDXqhAAgPzlqYDmLs8qIyVvIfxN87vJe9+0Q=;
	h=From:To:Subject:Date:From;
	b=t//bQ4X8WdWDdA7Kk8EDuOSNblCgBWnEWE3gW3Ts+Hpwea6HFkxPwo2wGpZoQ+zUR
	 TKgGs8iVREJc6iQQBiMKxJif+c5HsV5XSu0SWdcExa3MdtIqO+9IGAGv1y19SDvCdA
	 tp41oL2d5ZqzS2zA03AgefoKO6SAW//nIH/9e6jyNEnZXEYCeo0MM6Vy2cG64O6F97
	 UOZEB/GopVlF26BjUclzPALLrREmVpJHyiOv5I/HiJfcfEQ8mxBqH+oEW3gRrLomQT
	 rCyofLuycWfED3fOj4RLhMhpmTqMYRHd4aHC8q7JxA8cuV1VVfaQPYlhoFIBRZ7ubc
	 oSYbcAT53lFfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B5F6C41612; Sat,  1 Aug 2026 19:55:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221822] New: tb-retry.patch (against drivers/thunderbolt/tb.c):
 makes USB4 link setup resilient to transient sideband failures on AMD hosts
 with slow-to-ready device routers.
Date: Sat, 01 Aug 2026 19:55:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.jamesjohnson@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-221822-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221822

            Bug ID: 221822
           Summary: tb-retry.patch (against drivers/thunderbolt/tb.c):
                    makes USB4 link setup resilient to transient sideband
                    failures on AMD hosts with slow-to-ready device
                    routers.
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.2-rc5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: j.jamesjohnson@icloud.com
        Regression: No

Created attachment 310555
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310555&action=3Dedit
tb-retry.patch (against drivers/thunderbolt/tb.c): makes USB4 link setup
resilient to transient sideband failures on AMD hosts with slow-to-ready de=
vice
routers.

## Summary

CalDigit Element 5 Hub (USB4 v2 / TB5) on AMD Strix Point USB4 host: link
training fails CL-states/TMU/tunnel creation on ~5 of 6 plug cycles, then o=
ne
cycle lands and is fully functional =E2=80=94 link never lane-bonds (single=
 lane 20
Gb/s)

## Description

An AMD Strix Point mini PC (Meigao F8BAC, Ryzen AI 9 HX 370) cannot reliably
establish a link with a CalDigit Element 5 Hub (vendor 0x3d, device 0x28,
TB5/USB4 v2, firmware 64.1 =E2=80=94 current per CalDigit). The hub works c=
orrectly on
a Mac at USB4 40 Gb/s with the same cables.

Most plug cycles fail identically:

```
thunderbolt 1-2: new device found, vendor=3D0x3d device=3D0x28
thunderbolt 1-2: CalDigit, Inc. Element 5 Hub
thunderbolt 0000:c8:00.6: 2: failed to enable CL states
thunderbolt 0000:c8:00.6: 2: failed to enable TMU
thunderbolt 0000:c8:00.6: 2: USB3 tunnel creation failed
thunderbolt 0000:c8:00.6: 2:1: hop deactivation failed for hop 1, index 8
thunderbolt 0000:c8:00.6: PCIe Down path activation failed: -107
thunderbolt 0000:c8:00.6: 2:9: PCIe tunnel activation failed, aborting
thunderbolt 1-2: device disconnected
```

The host router autosuspends and re-scans every ~18 s, so cycles repeat
indefinitely =E2=80=94 **and after ~5 failed cycles, one attempt succeeds**=
. Once
linked, the device is fully functional and stable:

- `thunderbolt 0-2: Element 5 Hub`, authorized=3D1, **20.0 Gb/s rx/tx** (li=
nk
only ever trains **single lane** =E2=80=94 bonding never occurs, even on su=
ccessful
links)
- USB3 tunnel up: Intel USB3 HUB (8087:5787, JHL9480 internal) + CalDigit
USB3.2 10G hub enumerate through the tunnel
- PCIe tunnel up: full JHL9480 bridge hierarchy (01:00.0 =E2=86=92 02:00.0/=
01.0/02.0)
- 5 USB HDDs, card readers, and an RTL8153 GbE adapter all enumerate and pa=
ss
traffic through the tunnel; sustained reads 208=E2=80=93215 MB/s (platter-l=
imited) with
zero disconnects or errors after the link lands

So the failure is not a hard incompatibility =E2=80=94 the link *can* come =
up, but lane
training/CL-state enablement is unreliable and only succeeds sporadically (=
and
never with lane bonding).

### Hardware

- Host: Micro Computer (HK) Tech Limited "AI Series", board **F8BAC**
(Meigao/miniscloud mini PC), AMD Ryzen AI 9 HX 370 (Strix Point), AMI BIOS =
1.04
(2025-04-11, latest for this board)
- USB4 host routers: `0000:c8:00.5` [1022:151c] (domain0 / Port A) and
`0000:c8:00.6` [1022:151d] (domain1 / Port B). **Both ports train the devic=
e**
and both fail tunnel setup on most cycles; the working 40 Gb/s bonded link
currently in use is on Port A.
- Device: CalDigit Element 5 Hub, TB5/USB4 v2, FW 64.1
- Cables: the CalDigit-supplied TB5 cable

### Kernels tested (all byte-identical failure)

- Proxmox VE kernels: 6.14.8-2-pve, 6.14.11-9-pve, 7.0.6-2-pve, 7.0.14-8-pve
- **Mainline 7.2-rc5** (Ubuntu mainline build) with `thunderbolt.dyndbg=3D+=
p`
- thunderbolt module params: `clx=3D0`, `clx=3D0 bw_alloc_mode=3D0` (link t=
rains,
tunnels still fail)
- Kernel cmdlines: `pcie_port_pm=3Doff`, `pcie_aspm=3Doff iommu=3Dpt` =E2=
=80=94 no effect
- Boot-attached vs hotplug =E2=80=94 no effect
- Both USB4 ports and direct attach =E2=80=94 no effect on the tunnel failu=
re.
**Daisy-chaining the hub downstream of an Elgato TB3 Pro Dock was the only
working topology** (all drives restored, stable) =E2=80=94 it was rolled ba=
ck as
non-viable for this deployment, but it corroborates that the failure is
specific to native USB4-v1=E2=86=94USB4-v2 link negotiation (the TB3 path s=
kips
CL-state negotiation)

### Code analysis + retry patch experiment (drivers/thunderbolt @ v7.2-rc5)

- `-107` =3D **-ENOTCONN** ("transport endpoint not connected") =E2=80=94 s=
ame errno lane
bonding returns (silently) when the second lane never comes up. PCIe path
activation dies on a port-state race.
- The printed `failed to enable CL states` is **not** a support check
(`-EOPNOTSUPP` is swallowed without warning); it is a real **sideband
config-space transaction failure** against the device router in
`tb_port_pm_secondary_set()`/`tb_port_clx_enable()` (clx.c). TMU and
USB3-tunnel failures are the same class.
- **No-fallback aggravator in `tb_enable_clx()`:** CL2 is attempted first f=
or
v2 routers (JHL9480 is v2); only `-EOPNOTSUPP` falls back to CL0s/CL1. A
*transient* CL2 transaction error aborts CL enablement with no fallback and=
 no
retry. Same no-retry pattern in `tb_enable_tmu()` and `tb_tunnel_usb3()`.
- Retimer NVM reads report `vendor=3D0x0 device=3D0x0` even on successful l=
inks =E2=80=94
further sideband unreliability.
- Gil Fine's 7.2-rc1 router-readiness patches (Router-Ready verify `062023c=
`,
Config-Ready timeout `ba2cc38`, notification timeout 255 ms `e24f3c0`) are
present in the test kernel and do not cure it.

**Tested a 3-site retry patch** (CL2=E2=86=92CL0s/CL1 fallback on ANY error=
 + 3=C3=97 retry
with 100/200/300 ms backoff on
`tb_enable_clx`/`tb_enable_tmu`/`tb_tunnel_usb3`/`tb_tunnel_activate`), bui=
lt
as `7.2.0-rc5-tbfix1`:

- **Boot-attached:** CL-states and TMU failures **eliminated** (fallback +
retries fixed both). USB3 tunnel creation still failed every cycle =E2=80=
=94 the 600 ms
retry window isn't wide enough for USB3 specifically.
- **Hotplug (unplug 10 s, replug): full success on first cycle** =E2=80=94
CL/TMU/USB3/PCIe all succeed, zero errors, `PCIe Down/Up path activation
complete`, 4 JHL9480 bridges enumerated, all USB devices + storage via tunn=
el,
sustained reads 207=E2=80=93222 MB/s (platter-limited), stable.
- **Conclusion:** the CL/TMU failures are provably transient and recoverable
in-kernel (retries work). USB3 tunnel creation is the remaining hard point =
=E2=80=94 it
needs either a device reset (hotplug) or a substantially longer
backoff/readiness wait. This narrows the fix target for upstream considerab=
ly.
- **Lane bonding is also timing-flaky:** the host's second-lane port sits in
`TB_PORT_CONNECTING` (state 1) for the full 1 s `tb_wait_for_port` window on
most cycles, then "failed to reach state TB_PORT_UP. Ignoring port." When l=
ane
1 does train late, `tb_switch_set_link_width(DUAL)` is never re-attempted, =
so
the session stays single-lane (20 G) even though both lanes are up. Both a =
TB3
dock and this TB5 hub DO bond at 40 Gb/s aggregate on cycles where lane 1
trains in time. Suggested hardening: re-attempt lane bonding when the second
lane reaches `TB_PORT_UP` after the initial attempt fails.

### Notes

- A Thunderbolt 3 dock (Elgato TB3 Pro Dock) links and tunnels reliably on =
the
same host/port =E2=80=94 the TB3 path skips USB4 CL-state negotiation, so t=
he host
hardware is functional for TB3.
- Blanket auto-authorization udev rule is in place; failure precedes
authorization anyway.
- Possibly related: bug 221319 (AMD USB4 host + TB5 peripherals), and the M=
ay
2026 linux-usb thread "USB4 v2 TBGAA tunnel creation crash in TMU enhanced
uni-directional mode" (AMD Strix Halo + TB5 dock) =E2=80=94 same class, but=
 that thread
ended unresolved with a suspected device PD-firmware cause. This report add=
s a
distinct data point: here the link *does* come up (single lane) and the fai=
lure
is specifically at device-switch CL-state enablement and tunnel creation.

### Attachments

1. `dmesg-tb-plug.txt` =E2=80=94 standard dmesg of one plug cycle on 7.0.14=
-8-pve
2. `dmesg-tb-dyndbg.txt` =E2=80=94 full `thunderbolt.dyndbg=3D+p` trace of =
plug cycles on
mainline 7.2-rc5
3. `tb-retry.patch` - against drivers/thunderbolt/tb.c: makes USB4 link set=
up
resilient to transient sideband failures on AMD hosts with slow-to-ready de=
vice
routers.

---

## Attachment 1: dmesg-tb-plug.txt (7.0.14-8-pve)

```
[  342.119755] thunderbolt 1-2: new device found, vendor=3D0x3d device=3D0x=
28
[  342.119951] thunderbolt 1-2: CalDigit, Inc. Element 5 Hub
[  343.058197] thunderbolt 0000:c8:00.6: 2: failed to enable CL states
[  343.058526] thunderbolt 0000:c8:00.6: 2: failed to enable TMU
[  343.059968] thunderbolt 0000:c8:00.6: 2: USB3 tunnel creation failed
[  343.061282] thunderbolt 0000:c8:00.6: 2:1: hop deactivation failed for h=
op
1, index 8
[  343.061386] thunderbolt 0000:c8:00.6: PCIe Down path activation failed: =
-107
[  343.061749] thunderbolt 0000:c8:00.6: 2:9: PCIe tunnel activation failed,
aborting
[  343.062408] thunderbolt 1-2: device disconnected
```

## Attachment 2: dmesg-tb-dyndbg.txt (mainline 7.2-rc5, thunderbolt.dyndbg=
=3D+p)

Key excerpt (full trace on request =E2=80=94 multi-hundred-line cycles):

```
[  267.142724] thunderbolt 0000:c8:00.6: 2: current link width symmetric,
single lane
[  267.145051] thunderbolt 1-2: new device found, vendor=3D0x3d device=3D0x=
28
[  267.145265] thunderbolt 1-2: CalDigit, Inc. Element 5 Hub
[  268.493956] thunderbolt 0000:c8:00.6: 2: failed to enable CL states
[  268.494796] thunderbolt 0000:c8:00.6: 2:20: available bandwidth for new =
USB3
tunnel 18000/18000 Mb/s
[  268.495368] thunderbolt 0000:c8:00.6: 2: USB3 tunnel creation failed
[  268.496009] thunderbolt 0000:c8:00.6: 0:5 <-> 2:9 (PCI): activating
[  268.496102] thunderbolt 0000:c8:00.6: 2:9: PCIe tunnel activation failed,
aborting
[  268.496176] thunderbolt 0000:c8:00.6: 0:2: switch unplugged
[  268.496231] thunderbolt 0000:c8:00.6: 2: link width set to symmetric, si=
ngle
lane
[  268.496469] thunderbolt 1-2: device disconnected
```

Host-router TMU succeeds each resume: `0: TMU: mode set to: bi-directional,
HiFi`.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
