Return-Path: <SRS0=VQXk=CF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6863CC433E1
	for <linux-usb@archiver.kernel.org>; Thu, 27 Aug 2020 20:06:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4360C20848
	for <linux-usb@archiver.kernel.org>; Thu, 27 Aug 2020 20:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgH0UGl convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Aug 2020 16:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgH0UGl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 16:06:41 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Thu, 27 Aug 2020 20:06:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208891-208809-ovocY3QetA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208891-208809@https.bugzilla.kernel.org/>
References: <bug-208891-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208891

--- Comment #31 from Matt Turner (mattst88@gmail.com) ---
Unexpectedly, hotplug worked a few times.

I've attached dmesg and sudo lspci -vv output from two hotplug attempts with
v5.8.3, CONFIG_PCI_DEBUG=y, initcall_debug, and the patch from comment #24
applied -- one that succeeded and one that failed.

Again we see the same pattern in lspci -vv output:

--- lspci-patched-failure 2020-08-27 12:54:22.300504263 -0700
+++ lspci-patched-success 2020-08-27 12:47:04.525430133 -0700
@@ -654,9 +654,9 @@
        Latency: 0
        Interrupt: pin A routed to IRQ 167
        Bus: primary=2d, secondary=2e, subordinate=2e, sec-latency=0
-       I/O behind bridge: 00000000-00000fff [size=4K]
-       Memory behind bridge: 00000000-000fffff [size=1M]
-       Prefetchable memory behind bridge: 0000000000000000-00000000000fffff
[size=1M]
+       I/O behind bridge: 00005000-00005fff [size=4K]
+       Memory behind bridge: 68000000-680fffff [size=1M]
+       Prefetchable memory behind bridge: 0000006000000000-00000060000fffff
[size=1M]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
