Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D75C04A68
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jul 2022 14:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbiG0OB2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 Jul 2022 10:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbiG0OB1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 10:01:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F282DB03
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 07:01:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63916B81F66
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 14:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 220B8C433D7
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658930484;
        bh=+F1pARcMEB83xS/n++hBOPeYrr/fz7YdxwHeY/p+2qM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ta3l9kcwSGEl+bDAC20JLrkvBy3JfflCOwuoEmAGQPsV+E+6LDh2xma7waib+sbFR
         vhSm2yCTazb7og4387C7768YpUOgC+qVWKSpx0DKGMCrWcKtx4O1iP3ZBi/DhKxwBZ
         XkWOUsCfbFzp4KiOOJAkMyv3H08NHGtbv6FwBCX3jMWmlLTi33RXbWajbJCz5AdspQ
         1uIk5W9v/1EseVcE0DZoPD83Y40DVops86h5duaHrMgmJRL71wwONcw4O9RTo05+1P
         bmT2hDquvwu4IOq34Tq2Ak5keMr0fHuGSqOqEvUfzO7g9hYm7lcizljr1erZT1aZ41
         CNKJ6rb7F00kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 09FAEC433E6; Wed, 27 Jul 2022 14:01:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Wed, 27 Jul 2022 14:01:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216282-208809-hhW3EdNHQ6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|stern@rowland.harvard.edu   |

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
The question is which directory or file on that path is missing.  From comm=
ent
13, it looks like /sys/kernel/debug/usb should exist.  Maybe it doesn't hav=
e a
usbmon subdirectory because the usbmon module hasn't been loaded.  If you d=
o:

   modprobe usbmon

it should create that directory and the 2u file within it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
