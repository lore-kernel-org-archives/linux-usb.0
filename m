Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663982;
	b=uiJVGgRU/IgyI//hkLvje68IrobHXrBlifpVe1IIYGnzs808TtUunAzXwJYtAtcK31EH
	 07NUz84R9LNT0Xp5rQ6aCbjE231JvijmSI4r35pFJxQwiCcbEEUYWTK7F8CWEJ/7xEu9m
	 cxfCT1AieQ9R9CFFDfX7IltBuk/do7NP++m0otY3Ek+fw3JosJNLx4f6hW+yGjJjzSyxX
	 qx7M3T9egYxvh8pTnZhLgpWsk9wGQXBh7pXhGpwkQZ7S0vIJN4Wm5/oOrI9KfTHihqHOZ
	 Op/2NWx/fQmNFqKcS417M+2m/5nvaHBUJ8qO4jpbytvn1llSHKObeKpY/kgUAMgRn2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663982;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=xk6DuWT76KkRutkykCaKvDdFqLAIc0SoIOcgZir96a8=;
	b=yq5QWh0c+jENrYMhRIEFnTOjFo0qc1NZFaGGIptvjtJ7NCX5kBGIs0YH2c0fCGghnuXb
	 P359cmt1TxEcV60OmDhnh+dbSQrSvUrMk2e6vD2tkQZb/XxixNAf7aoY6uEJRNjrMdqRb
	 Ch8FmdaLEhkhcxS6E6u2ai863681F3+gh23bw21GpYVijFb7XqGmX/4roKNaovVfmFtMD
	 1NIhywL4EudF4D2XVRMJPrPnDWM327wYznSMwMbsbzCeJSVKek9Sihdyvd52xYLRffCEv
	 3RLLWiZJtLqgiVozlUteGJip0/4UEpI86sn+e1ryWJw+k4P3YGhCXOQfilXz8MFFUqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Vn5UB8LV;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5140606A686;
	Thu, 26 Nov 2026 03:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5140606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Vn5UB8LV
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WFCc83951796, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663935; bh=xk6DuWT76KkRutkykCaKvDdFqLAIc0SoIOcgZir96a8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Vn5UB8LVHGvCV6z87z8umffxGljwU44TwYFSf/cqDliTJ5cMFhuYFebWEjDEC9H8D
	 S5Q5skkEScw/TZt0cGtbeo/nkKvWnrtil5Fzbvg1MpKrnkz21TC68c/h4VMDA5FJjF
	 bSEQCYxtnwi3yi2b5uDj7be0vwqfWk40bdvTVdIk9ACUyyH+zMycRb/vmBmC2GDAio
	 oOjmw1++to8jy2wKRXf3VV3QS7t/9gbCd9ThvZ4aR0pr0/joSceJx8FX0G3X9N94a3
	 RfLKUvHXpSYAIDKgehMIQPczyscMUbXvUEmR/JrYW55g1NurEikrimshoMUjGh1lc/
	 J7Kekl33h7GBA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WFCc83951796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:15 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:15 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 00/12] r8152: refactor and extend RTL8157/8159 support
Date: Thu, 26 Nov 2026 11:31:59 +0800
Message-ID: <20261126033211.51850-1-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

RTL8157 and RTL8159 have different init, enable, up/down, hw_phy_cfg,
and PHY access sequences from RTL8156. This series first fixes the
up/down, unload, change_mtu and flow control settings that these chips
shared with RTL8156 but need to be different, then separates the shared
callbacks by chip generation and adds the missing RTL8157/RTL8159
functionality: TGPHY register access via phy_read/phy_write pointers in
struct rtl_ops, and UPS support via r8157_ups_en().

v9:
- Patch #4 (was v8 #4):
  - Explain in the commit message why SLOT_EN in PLA_RCR is cleared.
  - With no rate bit set, i.e. link down or a rate the driver does not
    advertise (500 or 1250 Mbit/s), disable the pause limit quietly
    with dev_dbg() instead of logging an error.
  - Update the commit message.

- Patch #6 (was v8 #6): explain in the commit message that RMT_WAKE_EN
  is managed by the firmware, and that the driver only clears a stale
  value.

- Patch #7 (new): accept the PLA and USB firmware blocks for RTL8157
  and RTL8159 in rtl8152_is_fw_mac_ok(), which rejected the whole image
  for these chips. Add a Fixes tag.

- Patch #8 (was v8 #7):
  - Select rtl8159-2.fw for QFN100 and keep rtl8159-1.fw for QFN68.
  - A failed read of the package register is logged and yields
    RTL_VER_UNKNOWN, since guessing a package could load the wrong
    firmware. __rtl_get_pkg_det() returns an errno.
  - Split the VER_17 cases added by patch #7 into QFN68 and QFN100.

- Patch #11 (was v8 #10):
  - rtl8152_set_speed() updates the cached speed/duplex, the UPS
    speed/duplex and force_media only once the final BMCR write
    succeeds, and keeps a pending PHY reset if that write fails.
    A failed read while waiting for the PHY reset to finish is
    not reported.
  - set_carrier() keeps the current link state when the BMSR read
    fails.
  - rtl8153_in_nway() reports the PHY as negotiating when the read
    fails, so that runtime suspend is delayed.
  - Update the commit message.

- Patch #12 (was v8 #11): explain in the commit message that the
  backup-restore wait in r8157_ups_en() also applies to RTL8157.

v8:
- Move the fixes to the front of the series, so that they can be
  backported without the refactoring, and add Fixes tags:
  - Patch #1 (was v7 #5): fix up and down register settings, now
    applied to the shared rtl8156_up()/rtl8156_down() before they are
    split.
  - Patch #2 and #3 (were v7 #7): split rtl8157_unload() and
    rtl8157_change_mtu() into separate patches. Reword the commit
    messages.
  - Patch #4 (was v7 #9): fix flow control for
    RTL8156/RTL8156B/RTL8157/RTL8159. It is now applied to the shared
    rtl8156_init() and rtl8156_enable(), and goes ahead of the
    refactoring. Rework the commit message: describe what was missing
    on each chip, and note that the 500 and 1250 Mbit/s rates the
    hardware can report disarm the pause limit.

- Patch #5 (was v7 #1): the RTL8156B-only part of r8156_init() is now
  the AUTO_SPEEDUP clear, as the flow control setup moved to patch #4.
  Update the commit message.

- Patch #6 (was v7 #2): RTL_VER_12 no longer gets
  r8156b_u2phy_backup().

- Patch #7 (was v7 #3): rebase on the new order, with the VER_17 cases
  in rtl_fc_pause_pkt_en(), rtl8156_up() and rtl8156_down() split into
  QFN68 and QFN100.

- Patch #8 (was v7 #4): rebase on the new order. The register fixes
  and rtl8157_change_mtu() now come from patches #1 to #3, so this
  patch is a pure split with no functional change intended. Add
  rtl8156b_enable() for RTL8156B (VER_12/13/15), so that
  rtl8156_enable() serves RTL8156 only and neither needs version
  checks.

- Patch #9 (was v7 #6): rebase on the new order.

- Patch #10 (was v7 #8):
  - Log a TGPHY busy timeout ratelimited, so that a stuck busy bit does
    not flood the log.
  - Propagate the PHY access failure also in
    rtl8152_get_link_ksettings(), r8153_get_eee() and
    r8152_mdio_read(), and stop on a failed read in rtl8153_in_nway(),
    r8156_mdio_force_mode(), r8156_eee_en() and rtl8152_fw_phy_fixup().
  - rtl8152_get_pauseparam() reports no flow control, and
    r8153_phy_status() keeps polling, when a read fails.
  - rtl8152_set_speed() leaves the cached advertising and a pending PHY
    reset untouched when a write fails.
  - read_mii_word() reports a failed read as 0, as the MII library
    takes the return value for register content.
  - rtl_phy_patch_request() returns the errno of a failed write and
    releases PATCH_REQUEST when a later step fails.
  - Rewrite the commit message and list what is left to a follow-up
    series.

- Patch #11 (was v7 #10): in r8157_ups_en(), stop waiting for the
  backup restore, and return, as soon as the device is marked
  RTL8152_INACCESSIBLE.

v7:
- Patch #1: split r8156_init() by chip generation rather than per
  chip. RTL8156 and RTL8156B share r8156_init(), and RTL8157 and
  RTL8159 share r8157_init(), since their sequences are near-identical.
  The few differences are selected with switch (tp->version).
  r8156b_init() and r8159_init() are gone.

- Patch #2: apply the new init writes to the merged r8156_init() and
  r8157_init().

- Patch #3:
  - The RTL8159 QFN68/QFN100 differences become cases of the version
    switches in r8157_init(), and the QFN68-only u2phy backup restore
    write falls through to the common u3phy backup write.
  - Report the number of retries (i - 1) in the "Needed %d retries to
    read package" warning.
  - Update the commit message.

- Patch #4:
  - Share the exit-OOB and enter-OOB sequences of RTL8156, RTL8156B,
    RTL8157 and RTL8159 through r8156_exit_oob() and r8156_enter_oob(),
    as RTL8152B and RTL8153 do.
  - Serve RTL8156 and RTL8156B (VER_10/11/12/13/15) with a single
    rtl8156_enable() instead of adding rtl8156b_enable(). The
    r8156_fc_parameter() call stays behind a version check, so it is
    no longer dropped.
  - Retitle and update the commit message.

- Patch #5: adapt to the shared r8156_exit_oob() and r8156_enter_oob().
  Update the commit message.

- Patch #7: r8156_exit_oob() now calls tp->rtl_ops.change_mtu() instead
  of rtl8156_change_mtu(), so that rtl8157_up() gets
  rtl8157_change_mtu(). Update the commit message.

- Patch #9: apply rtl_fc_pause_pkt_en() in the merged r8156_init().
  AUTO_SPEEDUP is still cleared there for RTL8156B only. Update the
  commit message.

- Patch #10: replace r8156_ups_en() with r8157_ups_en() in the merged
  r8157_init() only. Update the commit message.

v6:
- Patch #1: make it a pure split of r8156_init() per chip, plus the
  wait_autoload_done() helper, with no functional change. The new
  init writes it used to carry move to patch #2. Also convert
  r8152b_init() to wait_autoload_done().

- Patch #2 (new): add the new init writes for RTL8156B/8157/8159,
  taken out of patch #1.

- Patch #3:
  - Fix the "Needed %d retries" warning in __rtl_get_pkg_det() to
    trigger only when a retry was actually needed (i != 1).
  - Reword the commit message.

- Patch #6:
  - r8159_hw_phy_cfg() ends with rtl_eee_enable(tp, tp->eee_en) so
    that the configured state is applied in both directions.
  - Reword the commit message.

- Patch #8:
  - A TGPHY busy timeout no longer sets RTL8152_INACCESSIBLE.
    wait_tgphy_cmd_ready() logs and returns the poll error, as the
    ADV command channel does, and returns -ENODEV only if the device
    is already marked inaccessible.
  - Drop the RTL8152_INACCESSIBLE exceptions from the LAN_ON
    WARN_ON_ONCE() checks in hw_phy_cfg, which are no longer needed.
  - Narrow the commit message to what the patch does and list what is
    left to a follow-up series: the remaining callers, the MII library
    callbacks, and the recovery from a TGPHY timeout.

- Patch #9:
  - Explain the symptom, that RTL8157/RTL8159 could keep sending pause
    frames indefinitely, and add Fixes tags for RTL8156, RTL8157 and
    RTL8159.
  - Keep the FC patch in r8156b_init() split from the AUTO_SPEEDUP
    clearing, and call rtl_fc_pause_pkt_en() right before it.

- Patch #10: note in the commit message that a backup-restore timeout
  in r8157_ups_en() follows what r8159_init() does for the same wait
  (mark the device inaccessible and log, without queuing a reset), and
  that recovery is left to a follow-up series.

v5:
- Patch #1: in r8157_init()/r8159_init(), call
  r8156b_wait_loading_flash() before wait_autoload_done(). Document
  in the commit message that the "Bulk In End" bit is cleared in
  r8157_init(), and drop the claim about the FC-timer block.

- Patch #2: accept the package read only if the full word was returned,
  warn when a retry was needed, and print an unknown package as
  0x%04x. Say "firmware" instead of "PHY tuning" in the commit
  message.

- Patch #3: make it a pure split with no functional change. Its
  register fixes move to the new patch #4.

- Patch #4 (new): fix up and down register settings for
  RTL8156/8156B/8157/8159.

- Patch #5: document the new RTL8159 PHY tuning parameters in the
  commit message.

- Patch #6: add Fixes tags.

- Patch #7:
  - A TGPHY busy timeout now sets RTL8152_INACCESSIBLE and returns
    -ENODEV.
  - sram_write() returns the data-write result.
  - The PHY firmware version checks, the BMCR reset poll,
    rtl8152_set_speed(), the pause parameters and the PHY patch
    handshake handle PHY access failures.
  - SIOCGMIIREG returns 0 with val_out set on success, or the error.
  - Commit message rewritten.

- Patch #8: drop the "no link" case, since the caller checks the link.
  An unknown speed now disarms the pause limit. Commit message
  rewritten.

- Patch #9: wait for the backup-restore flag with a timeout in
  r8157_ups_en(). Rename USB_FW_USE_VER to USB_FW_USB_VER.

v4:
- Patch #1: make wait_autoload_done() bail out immediately on
  RTL8152_INACCESSIBLE instead of waiting out the full 10 second
  timeout.
- Patch #6: propagate PHY access failures instead of ignoring them.
  ocp_reg_read()/ocp_reg_write() and every helper built on top of them
  (sram_read/write, sram2_read/write, the ocp_reg_*_bits and MDIO bit
  helpers) now return int and stop silently operating on stale data
  when a TGPHY access times out.

v3:
Rebase on top of latest net-next to resolve merge conflicts.

v2:
- For patch #1, use read_poll_timeout() to replace the manual
  for-loop polling.
- For patch #2 and #3, rewrite the commit message.

Chih Kai Hsu (12):
  r8152: fix RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings
  r8152: add rtl8157_unload() for RTL8157 and RTL8159
  r8152: add rtl8157_change_mtu() for RTL8157 and RTL8159
  r8152: fix flow control for RTL8156/RTL8156B/RTL8157/RTL8159
  r8152: split r8156_init by generation and factor out
    wait_autoload_done
  r8152: add new init writes for RTL8156/8156B/8157/8159
  r8152: accept PLA and USB firmware blocks for RTL8157 and RTL8159
  r8152: split RTL_VER_17 into QFN68 and QFN100 package variants
  r8152: split rtl8156_enable/up/down into per-generation functions
  r8152: split r8157_hw_phy_cfg into RTL8157 and RTL8159 variants
  r8152: add TGPHY register access for RTL8157 and RTL8159
  r8152: enable UPS for RTL8157 and RTL8159 QFN68

 drivers/net/usb/r8152.c | 1838 +++++++++++++++++++++++++++++----------
 1 file changed, 1386 insertions(+), 452 deletions(-)

-- 
2.34.1

