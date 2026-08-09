Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B76364E88
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318392; cv=none; b=fA1BdIlaDjXPuY6cZo0onltZZ1Sx7BvEBC2LbaLpc6nRuC2DvMy1o+vIKjLy7aOXHTRTr4iGRdmMyY6Q8F/1o7wpbCkufn4z1I8qVnImJzL3APQ98FJ6UNurFx8qweGMOxViVSx9jZpA+SAzW34oV2ckQzA4PJOYaSNk5IYVXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318392; c=relaxed/simple;
	bh=CKeGtjbamFtpI8iKuraCY1/LmQBXPJSfTiDn2a4seno=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UmG7TzbZFHPmwF65MBIhqeIuOOeYfp3lPd+vBnHVYnUSamAuOGxKkls8VuV9XMVog7r4YBkF9GdlR9HRf72U/+4XDoUWo4cIU1BMwPSXjDBLwKE01EW+1Esh6uCD3HSbEfWr2B+vz33+KJp8Xh3tIJcL4va5EveuBEK+CLvLbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvLMh3n0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvLMh3n0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D199C2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318391;
	bh=CKeGtjbamFtpI8iKuraCY1/LmQBXPJSfTiDn2a4seno=;
	h=From:To:Subject:Date:From;
	b=UvLMh3n0V18JioBphzI+uwLvyXgHX7UtbYmoeuije7Ax2O4OIxb6YTOuCmbGbafEK
	 /RsaCJ1NzWnjxehecrmn5gr4455vtfDOJnkNgHOmUr7dEjqVy2cciQG40CHCtvl5Q5
	 pQlw/oUv+8qe48hNyMYFcd12qdGPK3srD8dK9GIYuepEeGXWT2YGo/pueq3Vs+QnEa
	 tsD4zKXEqudaVmSdUjTGLNPjngnd4q3D3i5pxsPR84cFhizRiW5osFZaSZbQ8UXYnn
	 lt+bf6IfeyA7LRUTScRDyxRgO7L+2P6MiBRdG4ib8X2bWepbR7B1jmcZREJGQupVCJ
	 RESF8MO00n6dQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49888C4160E; Sun,  9 Aug 2026 23:33:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] New: ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:33:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

            Bug ID: 221861
           Summary: ucsi_acpi fails to probe on HP EliteBook X G1a
                    (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot
                    reach 140W EPR
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jayden.blain@gmail.com
        Regression: No

Created attachment 310607
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310607&action=3Dedit
LLM Generated report

trying to get the HP Elitebook x g1a to charge at 140w 28v5a. mutltiple cab=
les
and chargers tested that are confirmed to work. laptop was at ~50% for test=
s,
ideal SoC for high power charging. Have not tested on Windows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
