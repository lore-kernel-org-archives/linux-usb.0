Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB336AB4D;
	Fri, 10 Jul 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701983; cv=none; b=TdWKiWmsS6qVrzbWMTPnWQUgLDQRRhlVFBEr4rWrsxm1DJbULJiYaOQqvJ4KNY5DVz+jqfbsA7UBr47wfnjkC0U6Dq3beWn0NfVksqiuTrCkqU+kJstlbpoQ9BcB55yNr9B9QMuKfSrhTyEotDbVfwY1Wy2xhjf8gztL03MnH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701983; c=relaxed/simple;
	bh=yByvqOZChehWp3zhGG7TA9o43PruKCDd0tAQZb8Z+3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lA8FjOW3gDeaHEnIEerTMzC7ze5rCeV3eRePlbPW7kZwimIRt3LdFy1BDafgvAdqZzj2jTCOH7xd82hg4AMHlQW0CHPDPHTNmdI+VhU0rMR8I4HfAQFuxh9Do/JLiIt80gt3RyLt0ZkHp4po5QlEQxWepMlAtdV3V8rfjjPZGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RbGuc5LV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RbGuc5LV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=yByvqOZChehWp3zhGG7TA9o43PruKCDd0tAQZb8Z+3o=;
	h=From:Subject:Date:To:Cc:From;
	b=RbGuc5LVu+IPvcVs0kDVPBIYgrAlGZDsjqAJ92j9KLzpwwqN9d+YIyQN9xYxT+C5f
	 CG+fDqjQgukqo8cqTLq/3ogz+g0XvSU0GLeXgq8zt3QShWdZ1bVZJEdATh8yYL7qQW
	 bcoWE1crn5EtTAXpV5LS6vyUhPFyoAkbWlo3fS6XVNIF1SPOsA/zUJREoWgnqqsX/w
	 y9De4HBIPdbVE3yIYmCqNAlyMxtfbTLuja0XwPPnQBTdt6y9AVxDCQKaCnayVqWylg
	 sb0F0hbWQiNL+i8WoNFKE62dLsjJb3uQ44g4akSUkBu4hU2x6zegtTHkopaNhoWN8s
	 MqiOvG4PIm79g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 282B317E0B79;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DB72C480028; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v12 00/36] phy: rockchip: usbdp: Clean up the mess
Date: Fri, 10 Jul 2026 18:44:38 +0200
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHchUWoC/4XSwU7DMAwG4FdBPRMUO42TcOI9EIckdVjFWKuWV
 aBp7066SyuUjKMt5XNs/Zdm5qnnuXl+uDQTL/3cD6dcAD4+NPHgT+8s+i43GpRIEqUS0xA/4qE
 fxXkO3Sjikf3pPAodtOtS0AReNfnxOHHqv2/y61uuD/38NUw/t0ELrN1/yQWEFECekkPuwNBLH
 I5HH4bJP8Xhs1nZBXcU1CnMVCDDEVEnR1yi1EapO5TKlGKb2Dqv8tolqt2oFm2VajNljNFkgCM
 jlii9UQRYpXSmOEWrJDlLLpUo2lOuStG6YAiQdBtUUsUFzY5CXaXMSlkOKibSbepKlN1TVKVsp
 lqTyKKzxrrir9xGGVm/lVtvpYBTCIQdFsMAcm/dyajMmFcODUD01rsiBnusfnlYE++hdT6STIb
 iX+x6vf4CIUqsFLMDAAA=
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15530;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yByvqOZChehWp3zhGG7TA9o43PruKCDd0tAQZb8Z+3o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdgx4VOhc31khX2pWRe9Y68XUrYBx6Zg4
 vQIn9l/5nYqhIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaYwIP/j8w4ATMe63KAyDQpQw94Fh5FBOvV2NHf8e3nbFN4NLQM3k0tH/xsFM/ukbNXL3/7a3
 rPaV/Uaxa4Ze0AeuUrolMQjB7KNLzTIeyYcw5sV8fW9B2ZJ5HRNcUQ31JRv8bz0LhLj88KHMmnI
 wbSurtYAaQ6aoe5h58QqmVck+m3sQvGXOsh8SvTRWL/KcZxTuBz6wGM5abTWQ+DBzofUyJQxIAw
 xAdm/AWu2OGaKsWKNZir5ijgZxX19bjIJS7tIWGKokSj2Pg9e+CDXBnWaMY+ZK1ECssWKYYNokG
 XvP6sCxuN49eQDW6mEn/1DNoFIeGfYALEeMuJyeFAp90erz8YW9dto3/MCYjMLwi+OmH0KxHL9+
 B9izyRaCkzkSeSQubI3BqnyelRcQUjAWWlkmjBwNm9JCibBHLMAOZ0sKnZrIw9iJvfjI0aozmXD
 ZNLRuUcpIawAAeyBTdnQEJrOlB2w1wqtCpIH814C3UZBg4+enPRKQREBp/6yKvZFcmhpMv+I9Rc
 /AWq84RlM/x2JsUFqKGCpKJ2zMenJVupR9aPiMkFRNfczr48OSwQKYaWkx9UpFDJg1YWp9KTBIA
 ygSYI94B0rlDRoTEtd7GqRqJyrUXJsudnNcFYPpvcXxsQckyhK5xu4f6HTkN7yrsEvFX9japYTT
 d0yRDL6Vt+rePcjo/dHMfOg==
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
 * The code always enables DP mode when USB-C is involved.
 * The driver has some locking issues uncovered by Sashiko.

In addition to these bigger ones, Sashiko also found a bunch of
minor problems, which are mostly harmless, but were fixed while
going at it.

I've tested the v12 code changes with dozens of replugs of different
devices (2 different USB-C hubs with USB3 + HDMI via DP AltMode, 1 USB-C
to HDMI adapter [4 lanes DP AltMode], 1 USB-C to DP adapter [4 lanes DP
AltMode], 1 USB-C to NVMe adapter [no DP AltMode] as well as a direct
USB-C connection to a Dell display) on a Sige 5 board and haven't run
into any issues. I've also tested with DWC3 runtime PM being enabled
manually via sysfs in this round and did not notice any issues. Apart
from that the series is boot tested via CI on Rock 5B and Rock 4D.

Technically some of the later patches are fixes, that one would
expect at the beginning of the series, but they are only possible
after the big cleanups.

Changes in v12:
- Link to v11: https://lore.kernel.org/r/20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com
- Add missing U3 port re-enable in Avoid xHCI SErrors patch (Sashiko)
- Mention possible deadlock issues in phy_notify_state() function
  documentation (Sashiko)
- Avoid runtime resume in dwc3 reset handler, which would result in
  a deadlock, if dwc3 is suspended (Sashiko)
- In patch adding reset notifications to USBDP PHY, also send the
  POST reset notification if rk_udphy_setup fails (Sashiko)
- Rework 'Fix power state handling' patch to adapt to these changes and
  avoid calling rk_udphy_u3_port_disable() when the USB3 PHY side is not
  requested by software (which means the USB power-domain being enabled,
  which is needed for the USB GRF). Previously this was guranteed by the
  runtime PM in the reset handler. The new version is better anyways as
  the old version would run into an SError when DWC3 was not loaded.
  (myself)
- I've not fixed various "pre-existing issues" reported by Sashiko to
  avoid further exploding this series. Also most of them are already
  fixed by later patches in this series anyways.

Changes in v11:
- Link to v10: https://lore.kernel.org/r/20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com
- Fix depreated -> deprecated typo in DT binding (Sashiko)
- dwc3 patch: (un)register PHY notifier in probe/remove instead of
  phy_init/exit to avoid AB-BA deadlock (Sashiko)
- dwc3 patch: replace pm_runtime_get_sync by pm_runtime_resume_and_get
  and add error handling (Sashiko)
- implement error handling for PRE_RESET in USBDP driver to match
  this (me)
- dwc3 patch: add reset counter to have balanced runtime PM count if
  dwc3 is removed during an active reset (Sashiko)
- Keep code to disable USB3 in highspeed-only mode in phy_init (Sashiko)
- Always set lane mux in last patch to make sure orientation
  changes are handled properly (Sashiko)
- Update commit message of last patch to mention USB reconnections
  happening during PD state negotiation (Sashiko)

Changes in v10:
- Link to v9: https://lore.kernel.org/r/20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com
- Add 'deprecated: true' to port in DT binding, since ports replaces it (Sashiko)
- In 'Drop seamless DP takeover' simply remove any handling for
  pre-enabled PHY as there is no known bootloader doing that and
  Sashiko keeps finding things, which I cannot test. (Sashiko, myself)
- Use on/off instead of enabled/disabled in PHY reinit message,
  which is shorter (myself)
- Use notifier_to_errno() in "add notifier infrastructure" (Sashiko)
- Rework DWC3 PHY reset notifier patch, so that it works correctly
  for multiple ports (Rockchip is single-port) and keep a runtime
  reference while the PHY reset is going on to massively simplify
  the locking logic. (Sashiko)
- Drop patch renaming phy_needs_reinit keep the existing logic to
  set it whenever the lane configuration changes (Sashiko)
- Update "Simplify power state handling" patch, to mostly depend
  on the DT configured or TypeC negotiated modes to avoid
  data stream disconnections when DP is hotplugged in a dock or
  USB is used with runtime PM (Sashiko)
- Ensure sw_mode is not set when the PHY enablement function fails
  (Sashiko)
- Add new patch adding USB-only mode as USB-C state, which results
  in proper powering off the DP side when the remote hardware is
  not capable of DP AltMode. (myself)

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

Sebastian Reichel (33):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Handle missing clock-names DT property gracefully
      phy: rockchip: usbdp: Drop seamless DP takeover
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
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors
      phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode
      phy: core: add notifier infrastructure
      usb: dwc3: core: support PHY reset notifications
      phy: rockchip: usbdp: Add phy reset notification support
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  24 +
 drivers/phy/phy-core.c                             |  65 +++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 583 ++++++++++-----------
 drivers/usb/dwc3/core.c                            |  88 ++++
 drivers/usb/dwc3/core.h                            |  18 +
 include/linux/phy/phy.h                            |  40 ++
 7 files changed, 523 insertions(+), 297 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

