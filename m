Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8DC00144
	for <linux-usb@archiver.kernel.org>; Fri, 29 Jul 2022 20:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239023AbiG2UGk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 29 Jul 2022 16:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiG2UGg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 16:06:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F44871BE1
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 13:06:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEC4461F5E
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 20:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16020C433C1
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659125195;
        bh=XfEExkc/chzllP92mJ6+Yuybv8eXPLCTFqAZ/u1yKiM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GiwbrZ6JPI4IqM9pJ2Dru1kXdZaWLxUJWR/3ycHTkZwhj5VqirAaERBisa2pi2QdY
         +Oe5mgSd5Va2bni2mf9Mokfkqxc88oDTjTmEe+6ClRKKOl30hcGYkX9HaOQQrUdbli
         5cyZTxs0p6KWSC9Rsq2vW8M5SiRfT27jJxWjtx525a9zA6a7e+c5nJcH2zgzdumoND
         FY5xXmsH2iw68HrrbrVvPKVGBxSEoZoS+nELbCABqG402WwK2PzndRHRyy3NgkGXOM
         hY9d28hXcdTCfw7hN4601vdkLjQ8m35LP6Iow1DRa/HCL/WeG0eDRmFRlPP4Lt3iD7
         EKH7JPOvYEcRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EEF77C433E6; Fri, 29 Jul 2022 20:06:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Fri, 29 Jul 2022 20:06:34 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-icsnlM87c5@https.bugzilla.kernel.org/>
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

--- Comment #21 from Alan Stern (stern@rowland.harvard.edu) ---
It looks like you may be right about the initial time delay being too small=
.  I
don't see any significant differences in the usbmon trace between the initi=
al
plug-in and the later one, except that the device failed to respond during =
the
initial plug-in when asked to identify itself.

(You can compare them yourself just by looking at the trace file.  The init=
ial
plug-in is detected at line 7, and the second plug-in is detected at line 1=
93.=20
The lines subsequent to those are virtually identical if you ignore the fir=
st
two columns, with just one or two unimportant differences -- up until the
failure at line 75.)

You can change the length of the time delay by setting the usb-storage
delay_use parameter.  For instance, assuming that the usb-storage module is
already loaded, do:

   echo 20 >/sys/module/usb_storage/parameters/delay_use

before you plug in the drive.  That will change the delay to 20 seconds (the
default delay value is 1 second).  Maybe it will help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
