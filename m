Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFEAECAAA1
	for <linux-usb@archiver.kernel.org>; Thu, 27 Oct 2022 21:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbiJ0VBT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236636AbiJ0VAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 17:00:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648655A82B
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:52:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F29AF62354
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59825C433C1
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666903955;
        bh=OG+TOhAjM9A80+c20joDMwfgW621St/Xc87tyszdep4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z+yGvO21caqrEwD1fWNPsZgxacZm3hR67PN6E4aJN4IryWhlZgucL18S87X2Hq+Nf
         0Vi1nTAUO6/Y0EKN1hSqySTkjwMF9MQR+Pt6DajjmbHlkOsBcXvBwO13zqdCqrhEXK
         6IuouZpImQHDxs11SpyRiwddBjZ+sPNLteXkUu+UrfUhfpFvW/KvYaDD2VbTDbbpW4
         7zICGKJW/WgOSqFkUWRRuvq0lbVQyEdIiHwTX4AQPPWX0kgHGEiIGA85y52FDwZtF0
         opITe6zZ8/yZ2nA2+A8JVHva01JJA054o4LRRgNAyb32sJHNKc6T43wGQJBxTPbZ12
         L6thdPnhkaOlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3DCDBC433E4; Thu, 27 Oct 2022 20:52:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] config 1 has an invalid interface number: 2 but max is
 1
Date:   Thu, 27 Oct 2022 20:52:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216630-208809-lZ8rCo3Osr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216630-208809@https.bugzilla.kernel.org/>
References: <bug-216630-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216630

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
I suppose these messages could be changed to log level notice instead of
warning (although the documentation says that notice is for "normal but
significant conditions", and these conditions are not normal).  The boundar=
ies
between the different log levels are not specified very clearly.  In
particular, there's no explanation of what should count as a warning.

On the other hand, if you don't want to see those messages now, you can jus=
t do
"dmesg -t --level=3Dalert,crit,err,emerg" (i.e., don't show warnings).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
