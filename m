Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD4EC00144
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jul 2022 01:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbiG0BpQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jul 2022 21:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiG0BpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 21:45:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E1FBF45
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 18:45:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B73FB818CC
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D7B8C433C1
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658886311;
        bh=b6iVOgkea6MUYMpS4mn+q3GcMXMdZgqViQL6ru0xPec=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DrtL7cB3KdXtgFIOucao+JHEzezqrVNvS2on6jvn4W7+gmVb9TiTSxYQqpQF72Hwt
         VviTVOrjuPQZX+CkSOqMZ4U00dR6TIJ5CVkxMpLrEdtW6H+Gb6ihX9tzgoFW92G8Bv
         z8RVbcXXpE3AGLPnH0P1pUCRdsxphqv3qpYRYpp/cvdprBxPy9K95EyYnGL/CX+EC9
         no22hduQ5DZ8ixYR3SPWxGaoIOZ07M6m0kQ4iVGcxLXk5FEKkQ4en1gY+3x+HlEwDm
         jsTktmDv3uBXHF11MnylNWrDD3hpGX8o7mHjVMh4pwWbZA6c/ZbawkDVS1kYbBJ4Rn
         BT9NOiPPI/vSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1A508C433E6; Wed, 27 Jul 2022 01:45:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Wed, 27 Jul 2022 01:45:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-5EzWpYWNKA@https.bugzilla.kernel.org/>
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

--- Comment #15 from audioprof2001@yahoo.com ---
i will try with other linux...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
