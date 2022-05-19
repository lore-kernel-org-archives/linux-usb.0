Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECC7C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 19 May 2022 18:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243375AbiESScz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 19 May 2022 14:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiESScy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 14:32:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBCB46B0C
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 11:32:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6993C61AEF
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 18:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C86CDC34100
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652985172;
        bh=2rH/uPqoF4+NQjxP9YdMDb5O3rNk/S0y/fCQoy7BzTA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bAFQIU3mYWbbuYbce0mkDoIoAw381ksj9CjSv9yVKuwsqDNA4EgVFZuLkkK5jDmGe
         bKAXs3YwgqN2ZbhO/NkT3e2EEDg6DBQmZrNoHRIkqlKePwKAfd5noWl5VG4J5bHDEi
         jMvo/BA06vYR7poE2+gzC/M/lkR+LFT+pMIkCv7JkeuYNDXOxdHl/MPgKzElrE8P8c
         gRNI2Aq1ZNOuA3f871pQyxsV1/OT8YuHecDj/H+B/gWrohbnEXMxZxeXvO0tSYXYwo
         SqP/BQsll04Uw8odDvbo2r4xSwhQ1ehe9ISFbdsKK7y3Iy92OS2ExH+Biiu6s38AmP
         2asHZV6h9sVfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A77F2C05FD6; Thu, 19 May 2022 18:32:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 19 May 2022 18:32:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214259-208809-NBkSK3xmnE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #18 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for your bug report.

I've prepared a patch series fixing bug 206459 as well as this bug:

https://lore.kernel.org/linux-pci/20220519152150.6135-1-hdegoede@redhat.com=
/T/#t

This series is using DMI matching to identify affected systems and to enable
the workaround only on affected systems.

I've used DMI_MATCH(DMI_BOARD_NAME, "X170KM-G") as match for this Clevo
Barebone.

Can you confirm that:

cat /sys/class/dmi/id/board_name

outputs "X170KM-G" ?

Or even better, give this patch series a try ? Note the series is based on =
top
of:
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=3Dpc=
i/resource

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
