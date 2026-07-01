Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7C03BD22C;
	Wed,  1 Jul 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948956; cv=none; b=rqa4ekNRc9JJ/bRpiDAmSETBpAwfkfUrCxr8PUn+s0g7jLiAbTSYoyZgVTdwzhUvbsnERJGgKZvTAei0Af/XTroKwbe6GMIyWTqNOLMkkFs69WMxWRmtcGv9vLvZtAPiMnS038CknlJe5Uh0O+CoCRr9byNF+xlsORrSVMoCJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948956; c=relaxed/simple;
	bh=B3ZPiV8jjvmoCTjiKvejs7eiq7oAOLx/XiGziBtlt28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k3OYkOb+jr6807HTgMwoAvZ5n83mCYYjx+uUCWDhz/G5AeiAwB2PEEtopyvSJlJBYxw5r1LqqC1W/JRlpY2Tz/3ohytcmEdWDcgj1Js2TKNubp5G7Zi0tS7pGDA2Z2iOSvqUQkin0/MiLNbwkqk4HO5NGS+9lDawQmtPU/GUIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W6PMVP73; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W6PMVP73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=B3ZPiV8jjvmoCTjiKvejs7eiq7oAOLx/XiGziBtlt28=;
	h=From:Subject:Date:To:Cc:From;
	b=W6PMVP73fRJDC8qIukSA+ciw6//8AstLmQRug9ch2dyPrDdgc2GG1l2hJBEJjr1zI
	 gtXo4ky5tFOGB6AHnr/bYgCgkvAXrFcot176cp0gNzlIqQXt1oJcPaO8yTSL8kjHw7
	 sDl/Nfl3KrGsZv8L5azA2CMKXXHvI26kThIFtfWAagu9+R1BkLZC9VGE2qSuQbrefg
	 YAAU5msofDzio1Fsj+DgSSU6N5p5JPlFLWMg6SQ3dCqqqU5/+6qMUm/S5GY+w8PV8k
	 F7pv++Q98bf9+GtMTTaKlk7zleCD7ZaU9dHmjoio0EEFqEBWxdmJTaU29UtltWE9Ti
	 ZmT9sIQheJvTw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2E8417E0CD4;
	Thu,  2 Jul 2026 01:35:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AD16A480028; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v9 00/38] phy: rockchip: usbdp: Clean up the mess
Date: Thu, 02 Jul 2026 01:35:38 +0200
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEukRWoC/4XPwU6EMBAG4FfZ9GwNndJp68n3MB7aMpVGpARco
 tnw7pa9QCLo8Z9kvpn/xiYaE03s6XJjI81pSrkvwT5cWGhd/0Y8NSUzqAArqCQfc3gPbRr4dfL
 NwENHrr8OXHllm+gVCidZWR5GiunrDr+8ltym6TOP3/c7s1in/5Kz4BUX6DBaoEZofA6565zPo
 3sM+YOt7Aw7SpxTUCiPmgKAihbpiJIbJf+gZKEkmUjGOllqH1H1RtVgTqm6UFprhVpQIIAjSm0
 UCjilVKEoBiMrtAZtPKJwT9lTCteC3ouoai+jPCyodxSoU0qvlCEvQ0RVx+aIMnsKTylTqFpHN
 GCNNvbXV8uy/AARSXVzzQIAAA==
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12172;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=B3ZPiV8jjvmoCTjiKvejs7eiq7oAOLx/XiGziBtlt28=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPpPhb9ZHN72zv+HYRsd7gz/DAk8ZP0I
 Qk7IhwCG578i4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qanIAP/RKBG77R/jBbZFefkaeREiukulL1zjEYdwPAqx+oBHq0mppWh56QpU/ZQunkINsywjd
 y7pD2H6qAPYdtsDRUkyGIyCZHMcLkM8hhAOsH2wtWJdvikIV3+5sYivaC1D4i2cE53YnWhQiQU9
 8tCQbmwiPi81w6Hejj9LO1VhM+n0x/5pByLi2HSOqKK1gPCmcopcPYiIZ4xd/KsME1viwH7ph4H
 ErQtFlpmpXltUedPgxUl5PU651X0Km5L8i3FvWPiidORaOoLpNQTP6qsK9mqGDx5LXwnmvfSdeq
 fnRfLWmWwDQiK2H0nKsUkGqVxaeY/IkYBzMkMDN7jPjAYF5LDW+p+S5Z1e6Ur0MZ8lpIWZpLemx
 DkkQaH5nEOcFPfMUZn/35eoxbfR0ZomlVfjTD+G4B0vy3zb2TPstjZqLHpFbYDod6thMTYfC9MF
 /2N6yxVrECaUvpwuKFX8GPm2EvwJ4VMtx3veZmeYBz/C6STDEZJ2LWjP5BzmAMS9FAMlXfau7n4
 ggPxwKPuR7X3+8fQAMeBfGBIu0bZTDogmtfWkd/F5lKBe/UDkdpLfcXT1e0uTAFtCgXLRjuYHne
 tlxXRitkXVkg8EQHc7Q+eCfM2Nwo1JCv5CnmNn77mynA3sQy0ojCfQNepYk/sI0XckqjYn7cgMW
 1EIsAUye28Iz757jBYNUsSw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This series does a major overhaul of the Rockchip USBDP driver. The
initial main goal was to add USB-C DP AltMode support to the RK3576
and RK3588 and this series still prepares the PHY driver for exactly
that. But in addition to that I uncovered a huge amount of issues,
that are fixed along the way. Some of the more interesting ones are:

 * Currently the driver might trigger a fatal SError on USB-C hotplug,
   since re-initializing the PHY stops the clocks going to DWC3. If
   the DWC3 driver tries to access its registers at the same time the
   system will crash.
 * The DWC3 hardware can get into a buggy state when the PHY is
   disabled, which results in the PHY not coming up properly again.
 * Swithcing the USB-C connector orientation during hotplug breaks
   USB3 speed, as the PHY is not being re-initialized.
 * Once DP is support the PHY initializes DP mode, even when the DRM
   side did not request DP support.
 * The driver has some locking issues uncovered by Sashiko.

In addition to these bigger ones, Sashiko also found a bunch of
minor problems, which are mostly harmless, but were fixed while
going at it.

I've tested the v9 code changes with dozens of replugs of different
devices (2 different USB-C hubs with USB3 + HDMI via DP AltMode,
1 USB-C to HDMI adapter [4 lanes DP AltMode], 1 USB-C to DP adapter
[4 lanes DP AltMode], 1 USB-C to NVMe adapter [no DP AltMode] as
well as a direct USB-C connection to a Dell display) on a Sige 5
board and haven't run into any issues. In all cases USB3 was working
in both directions and DP mode was properly initialized, so that
the DRM driver could query the available modes.

Technically some of the later patches are fixes, that one would
expect at the beginning of the series, but they are only possible
after the big cleanups.

Changes in v9:
- Link to v8: https://lore.kernel.org/r/20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com
- Update DT binding to explicitly mention that port@3 is for the
  DP aux channel and not DP in general (Sashiko got this wrong)
- Add a 100ms cooldown sleep in "Drop seamless DP takeover" after HPD
  is force disabled (Sashiko)
- Update comment in "Register DP aux bridge" to explain why port@3 is
  checked, but port@0 is used (Sashiko)
- Check for high-speed only mode in "Support going from DP-only mode to
  USB mode" (Sashiko)
- Add new patch for rk_udphy_reset_deassert error handling (Sashiko)
- Add new patch to avoid enabling USB3 in high-speed only mode during
  PHY reinit (Sashiko)
- Add 3 more patches to handle the LCPLL lock issue mentioned in the v8
  cover letter after feedback from Rockchip. Apparently the DWC3 does
  not cope very well with the PHY disappearing resulting in the PIPE
  interface misbehaving, which in turn results in the LCPLL not locking.
  The new patches avoid this by asserting DWC3_GUSB3PIPECTL_PHYSOFTRST.
  As this assert needs to be done when the PHY wants to reset, a new
  notifier system has been implemented to support triggering this from
  the PHY driver. This also means, that this version now also involves
  the USB subsystem.
- Drop old patch trying to solve the DP-only -> USB mode switch in
  favour of 5 new patches completely rewriting and simplifying the
  power status handling. The new code ensures that the PHY always
  has the right modes enabled and also makes sure a re-init happens
  on an orientation change.
- rebased on v7.2-rc1

Changes in v8:
- Link to v7: https://lore.kernel.org/r/20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com
- Move patch "Limit DP lane count to muxed lanes" after single lane
  support, which introduces dp_lanes variable to make sure series
  is bi-sectable (Sashiko)
- Force disable HPD in "Drop seamless DP takeover" patch and update
  patch description to mention potential issues with SErrors for
  bootloaders really keeping the DW-DP on. As mentioned in the new
  commit message this is untested as I'm not aware of such a
  bootloader anyways; this also means we need to keep the HPD GRF
  register defines in the 'Drop DP HPD handling' patch (Sashiko)
- Fix mode logic in "Properly handle TYPEC_STATE_SAFE and
  TYPEC_STATE_USB" patch; I blame the heat (Sashiko)
- Improve "Support going from DP-only mode to USB mode" patch to
  better handle starting in DP only mode; due to TypeC logic
  starting delayed this does not really happen, though (Sashiko)
- Improve "Support going from DP-only mode to USB mode" to avoid
  checking previous state and instead power on USB state based
  on previous requested state to avoid effects from the flip
  callback (Sashiko)
- Update the debug message patch to include some more info
- Ad one more patch, which disables USB3 at startup and drops
  the -EPROBE_DEFER logic

Changes in v7:
- Link to v6: https://lore.kernel.org/r/20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com
- Add new patch handling missing clock-names in DT gracefully (Sashiko)
- Add new patch handling rk_udphy_reset_deassert_all errors in init check (Sashiko)
- Add new patch to handle Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB (Sashiko)
- Add new patch to avoid xHCI SErrors

Changes in v6:
- Link to v5: https://lore.kernel.org/r/20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com
- Add explicit <linux/string_choices.h> include in last patch (Sashiko)
- Add new patch moving mode_change update after error handling (Sashiko)
- Add new patch fixing error masking of devm_clk_bulk_get_all() (Sashiko)
- Add new patch dropping seamless DP takeover as it is non-functional and buggy (Sashiko) 
- Add new patch limiting DP lane count to muxed lanes (Sashiko)
- Add error handling in the patch that keeps clocks running on PHY re-init (Sashiko)
- Also look for DP being configured to second lane for the flip config
  in DP single-lane mode, which should at least keep USB working for
  this super unusual config (Sashiko)
- Drop useless ret variable in patch introducing guard() for the mutex
- Add error handling for PHY re-enablement in the patch fixing support for
  DP-only -> USB mode (Sashiko)

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com
- Picked up Acked-by from Rob Herring for DT binding
- Fix typos in commit messages/comments
- Add Fixes tag to "Do not looe USB3 PHY status" patch
- Collect Reviewed-by: Neil Armstrong for multiple patches
- Drop now unused code from "Drop DP HPD handling" patch (Sashiko)
- Ignore mux events not involving DP AltMode (Sashiko)
- Add new patch to support going back from DP only mode to USB combo
  mode; technically this is a fix, but DP mode does not yet work
  upstream, so it does not matter (Sashiko)
- Add new patch adding a few debug messages, which are useful
  to investigate potential hotplug issues in the future
- Sashiko comments about the DT binding and property usage
  are wrong as the first port is for the superspeed lanes
  used for DP and USB, while the last port is just about
  DP aux. I ignored them.
- There is a pre-existing bug, that can already be hit with the
  upstream kernel and that the series doesn't fix properly:
  Accessing the USB3 controller registers requires the USB PHY
  running, since it provides a clock. Re-initializing the PHY
  means there is a race-condition - if the system tries to access
  the USB3 controller in parallel to the re-init, the system will
  hang and/or fail with an SError. By keeping the clocks running
  and only asserting the resets this time is minimized by this
  series. A proper fix for this will be looked into independently
  from this series.
- I used v7.1-rc6 as base, but the driver has no changes since
  6.18 even in linux-next and there are no pending patches for
  it on the mailinglist either, so it applies to *any* recent
  kernel branch.

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com
- rebased to v7.1-rc1 (no changes)
- Update DRM bridge registration patch to avoid registration when DP aux
  port is not connected to anything, since this results in errors and some
  boards use USBDP instances for USB3 only.
- Add patch renaming mode_change into phy_needs_reinit
- Add patch to re-init PHY on orientation change
- Add patch to factor out lane_mux_sel setup
- Add patch to handle mutex via guard functions

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com
- Add patch to register the USBDP PHY as DRM bridge
- Add patch to describe ports in DT binding (used by the DRM bridge)
- Add patch to drop HPD handling from the PHY

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (35):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Handle missing clock-names DT property gracefully
      phy: rockchip: usbdp: Drop seamless DP takeover
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert_all errors in init check
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Limit DP lane count to muxed lanes
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB
      phy: rockchip: usbdp: Use guard functions for mutex
      phy: rockchip: usbdp: Clear USB status on PHY exit
      phy: rockchip: usbdp: Hold mutex in DP PHY configure
      phy: rockchip: usbdp: Add some extra debug messages
      phy: rockchip: usbdp: Avoid xHCI SErrors
      phy: rockchip: usbdp: Disable USB3 on probe
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors
      phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode
      phy: core: add notifier infrastructure
      usb: dwc3: core: support PHY reset notifications
      phy: rockchip: usbdp: Add phy reset notification support
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Simplify power state handling
      phy: rockchip: usbdp: Rename phy_needs_reinit to orientation_changed
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Power optimizations

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 +
 drivers/phy/phy-core.c                             |  57 +++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 522 ++++++++++-----------
 drivers/usb/dwc3/core.c                            |  82 ++++
 drivers/usb/dwc3/core.h                            |  16 +
 include/linux/phy/phy.h                            |  40 ++
 7 files changed, 470 insertions(+), 272 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

