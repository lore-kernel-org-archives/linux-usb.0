Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A54EC77B78
	for <linux-usb@archiver.kernel.org>; Thu,  4 May 2023 11:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjEDLtg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 May 2023 07:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjEDLtf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 07:49:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67641994
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 04:49:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 429B060A08
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4683C433EF
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683200973;
        bh=lzOnJWcZ7Xn2J7V2zOSOqwcw2y3RYhOcI5HKoCc0JNc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bshfHdiehiGD47O+mrMjPiwgsb+tzldS/n6Rb1f0qRCsGhsNpLXtoAao9TMAP6HPy
         vTay5IhtOsAycmzXHLwYa1azNgxdMz/3mKeTAXHhM5MYAdXHLmsq3KQEaKOmcvvfrZ
         efqk7ZvkbZbYMk/QmkBjplsSZLHkG5svOyUX7jsjphOqx5Ol8RlOUCWk4DgZCLe+YX
         DkmEi2W2YW8v5aARTaRYVz4F6nZw/rFdSLlbZSPKPxKb9aFEKto4cX0ZrN5f+mJNrO
         buRJRN58u2tnkeNiDDD8yoMnr5QvySWh4HUoPImLvWnf6qgs7KzLHOYypQ4lgiSBKP
         JUhb0iC6d1bIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 84009C43141; Thu,  4 May 2023 11:49:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Thu, 04 May 2023 11:49:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217399-208809-sdmZimIxrY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

--- Comment #1 from Bernd Buschinski (b.buschinski@gmail.com) ---
lsusb:
Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit
Ethernet Adapter


and yes, I made a typo in the call trace, it is `rtl8152_cfgselector_probe`

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
