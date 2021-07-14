Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2039AC07E9A
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 17:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F397A613C0
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 17:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhGNRYB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 14 Jul 2021 13:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhGNRX7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Jul 2021 13:23:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BBD04613B5
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626283267;
        bh=Z4l2rJrLgPm+HK5kob2Pt56T4pOr5E0JAYEM1DKvhSI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WBSzXqeDGbomsufotzMdv7MaGtpFzV9TXPxdLzno8vY8I5a1/PG+XPZSFTblnOi2U
         eoICsQQRogKxApa9TO+L3iQxD4Osnu6Bwx03tQsR5mn24rUp6RndEHjc3vRSR4M4Iw
         FhDSpZEfvDAGv/aGNkqWHUVAoEnVSTfYsNRaLDbcLQhbFrsujyUBMpRAzTqL96ORqH
         QaRjxZtivtEKuvvg8gsK2n6MI411SwOC0/caXoiuKIK/+o1UX3gQzi8sRFXXZt2Rab
         LSNNC4CoSVc4r7IZ/K4EIHl1+1GQWmsqNQ3EudfMGqbq7wnjHnz/LnLJbW3XNxYGEE
         wsBC5vfLECKYA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211097] Resume from suspend sometimes makes some programs
 freeze for 30s
Date:   Wed, 14 Jul 2021 17:21:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yesmichel@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211097-208809-xyJ5cHVnFD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211097-208809@https.bugzilla.kernel.org/>
References: <bug-211097-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211097

Anthony Vital (yesmichel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Anthony Vital (yesmichel@gmail.com) ---
I haven't been able to reproduce this for a few weeks, I assume this has be=
en
fixed in one of the recent releases. Closing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
