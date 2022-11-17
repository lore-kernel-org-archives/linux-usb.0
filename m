Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C388C4332F
	for <linux-usb@archiver.kernel.org>; Thu, 17 Nov 2022 07:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbiKQH4l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Nov 2022 02:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234775AbiKQH4h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 02:56:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82C2716C1
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 23:56:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93E9BB81FA3
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 07:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 547B8C433D7
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668671793;
        bh=6eyM8cnkh89KixJAERUMMxpMjDbuLQET9BBCMQqvrXE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xosru2IZgdlKeU5VmBjIpdTzi2qtu81Te9bIRVIHGM9mQfmtltRALhEeCVmqONduW
         4DU24JNDjwqHjQO65XFu+PnW1j6Rawt5nwAUx8uv/ei0Q28isXl71Ebj7I8yMAu8Cz
         YpGi+efIv4Fa9CwGaCdT+SHF/oWqdPQ7ivtvtRMRdyI09wGyHR+hwwLNnIHtMm7NdX
         OhHeu0YePD/heOqh99pcHCYQ0P3zEBSszZO4nFXmnNMzfCS9zNkrHFXF/ZTDwDH2Mk
         z+2IfqvmfMuFyP3czxYVVX0cLkWQwc0DmNojzLKsHqIBqkcQYKpIhFWZGsBQ8TlpBh
         f4bVt2R5DCEZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 457C6C433E7; Thu, 17 Nov 2022 07:56:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Thu, 17 Nov 2022 07:56:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: denis@speran.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-uWI5Xv8gHB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #44 from Dennis (denis@speran.info) ---
Just checked with 6.1.0-rc5-1-mainline package wich is a "patchless" kernel
from Archlinux AUR and the problem still occurs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
