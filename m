Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC383DD521
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581165; cv=none; b=mbbydw2MlJuhcMFtehDLyJENRGYspkMWYMFCSE4zwpP6UoDI7Z8TSFYUdM9EUY3i14sR3+3+pw6PiDjs/uKvTqByKtXdIsQVKlg4l3ByEHApHXcnMbVvYl6+9EQKL4b+dlRFD41P8AOkiD61McuGC4T65WnDWmcNz87lFMSL7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581165; c=relaxed/simple;
	bh=yL9sQGOoxmwLbGOhCRLUGUbnElnssYx7OeuNS9SZsDs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UGavkEbDf39GllAh31J7n/eA/ThgvtM6KDWgxqDUC19YQw2tFjSP2PLomD37uN8FU5o/u28QZOzF0iSZ4HYIkGzkgiTL9DHmpcepFaIATU/5XyjTTT2v7nBI6JdUTFvXf8p+I9FxQuihOTifsTkg9pOHpOfBApocLPn361dBGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pATG0FKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pATG0FKo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26EBFC2BCB3
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789581164;
	bh=yL9sQGOoxmwLbGOhCRLUGUbnElnssYx7OeuNS9SZsDs=;
	h=From:To:Subject:Date:From;
	b=pATG0FKoz1Z0uYy6YgE0K2jN3wekVJbYj0YbxUDPxc0qqLE7T4HBYQgRx9qz+P2lh
	 pYk6ciVSX6T1y90rBmQic6GX/CUV0UE+7kIM8G9qwETmkvLjeq5YDTquQtyWqHH+XP
	 2we7uUiI/LdXHayVVrvo+AYh49su+PHi98irBWq8gqMyTPtmm7AR6XCk5ULyIdL7WE
	 R6zi+7U3zosp30hO4AefmH7mF8h8Eujg7d09gsIitEt+DbyPrK+MvDIMoN/NIpLqIQ
	 8AXkggLgj4qEZLW59ErmeT+ThUDY3jpoKzk8/JmFtxDunVNUNTf9FR1QnGRudWQOC5
	 eknmfLvywuw8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 027DFC3279F; Wed, 16 Sep 2026 17:52:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] New: Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Wed, 16 Sep 2026 17:52:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: splint.em85@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

            Bug ID: 222021
           Summary: Not charging via USB C after Kernel update
                    "underpowered" Dell XPS + workaround
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: splint.em85@gmail.com
        Regression: No

System: Dell XPS 15 9500
Kernel: 7.2.4-3-cachyos
Distro: CachyOS (Arch-based)

Description:
When the AC adapter is connected while the system is powered off,
or already connected during boot, charging works normally. However,
plugging in the same (original Dell) AC adapter while the system is
already running and unplugged causes the OS to report the adapter as
underpowered / "not charging", even though the identical adapter
charges correctly at boot or offline.

Steps to reproduce:
1. Boot the laptop with the AC adapter unplugged
2. Once fully booted, plug in the original Dell AC adapter
3. Observe: system reports adapter as underpowered / not charging
4. Power off and charge while off =E2=86=92 works normally
5. Reboot with adapter already connected =E2=86=92 charges normally
6. Suspend and resume with adapter connected =E2=86=92 charging resumes cor=
rectly

dmesg (relevant excerpt from boot):
[    8.703625] ucsi_acpi USBC000:00: unknown error 0
[    8.703631] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)

This started suddenly following a routine system/kernel update via
pacman; no hardware or adapter changes were made. Adapter and battery
confirmed functional via the offline/boot-charging test described above.

Workaround: a suspend/resume cycle after plugging in restores correct
charging behavior.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
