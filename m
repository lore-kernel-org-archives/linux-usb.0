Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622CCC433E0
	for <linux-usb@archiver.kernel.org>; Sun,  3 Jan 2021 15:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C8262076C
	for <linux-usb@archiver.kernel.org>; Sun,  3 Jan 2021 15:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbhACPC7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 3 Jan 2021 10:02:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:46684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbhACPC7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Jan 2021 10:02:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C34920770
        for <linux-usb@vger.kernel.org>; Sun,  3 Jan 2021 15:02:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] cdc_ncm_fill_tx_frame calls memset with huge length
 when called from cdc_mbim_tx_fixup
Date:   Sun, 03 Jan 2021 15:02:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jks@iki.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209407-208809-b0BrNJXwkD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209407-208809@https.bugzilla.kernel.org/>
References: <bug-209407-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209407

--- Comment #9 from Jouni Seppänen (jks@iki.fi) ---
I believe I figured out what is happening. Patch in
https://patchwork.kernel.org/project/linux-usb/patch/20210103143602.95343-1-jks@iki.fi/

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
