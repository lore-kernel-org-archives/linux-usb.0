Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC12BDC05
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783179682; cv=none; b=SMx/mbQvLmE3Z02t5jwyYhfDuQ3uZXS/VSObS022B2lNTWqnYOPfnyf/NBajf+xFdrSutGRb4lZcaSfdXUYQbamYr5xlrtvOk3v8gy0VoBHRpEgy6hX0s7s5eLXiLSCnl6YXqI/LW6oYKcTP7/891nHwujWxiCEnMur8mInxrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783179682; c=relaxed/simple;
	bh=U2BJ4hyZ4vmu49pJ/9WMoarCrT1xyw02QDfQb648v6o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=m2Mpe6f5U4EB5nmkLpV5X+8GlViyrtAfxrDzN7Ngdc3gg2/zGbXvOyeJMTv7lzrLduuPwrPhNC0uY3XCy9myQ54nHSDMeh56OplyqDn3hPPJznj+ggCL1yFTDFEQhJrwvq+SVSXwk3iQBgOigM10GiS4Ipd915a+eR18rPhye/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwMMXsmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwMMXsmx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00AD8C19425
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783179682;
	bh=U2BJ4hyZ4vmu49pJ/9WMoarCrT1xyw02QDfQb648v6o=;
	h=From:To:Subject:Date:From;
	b=CwMMXsmxuIvY44fFez0nWB5QCUqil4QstAfRXG/MgMu3onEC7uX/REGnyds7pZXZ1
	 PiB5cReTjowDJLI1S0d10asdZCbAsYLqW/ryBVk/+tlC/9oWCDT+Wj1eHDvpg6jz8A
	 vJ7EHoprevyuaggA9DqxwI5tMdOPgCG7x6jPy8NTF1jXe3BW887rYNz0bwuwwAEGiY
	 0aexw8m1eQqwxNkIduLSQTDFZFrDenG8Hv0rDV7kaWvUIzjJfD7ulm9JvkOmzb3Ap9
	 5HtzVrXls/dBYUDbYZmb1vCIAksaOtVnnQIPEEGfi8kNsnIKM4Q3gHJehhvTmMpogL
	 Jx8wtlDW7ohBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1CB9C4160E; Sat,  4 Jul 2026 15:41:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Sat, 04 Jul 2026 15:41:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: marx.tomasz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

            Bug ID: 221721
           Summary: prom21-xhci does not allow to use USB keyboard in
                    plymouth
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: marx.tomasz@gmail.com
        Regression: No

Created attachment 310416
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310416&action=3Dedit
output of "sudo lsusb -v"

Hi,

After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
tried both of my USB keyboards, but both of them just briefly lit up the LE=
Ds
and then seemed to turn off. Bisection pointed to

commit 364f4a55c661641c02c86a849f0608d8fc3c0006
Merge: e4b4bfaa5090 1c2b66a7d725
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jun 22 12:09:47 2026 -0700

    Merge tag 'usb-7.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb

and then

commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
Author: Jihong Min <hurryman2212@gmail.com>
Date:   Tue May 19 09:07:31 2026 +0900

    usb: xhci-pci: add AMD Promontory 21 PCI glue

After setting SENSORS_PROM21_XHCI=3Dn and compiling kernel again, I'm able =
to use
my PC normally.

CPU: AMD Ryzen 9 9900X
Motherboard: X870I AORUS PRO ICE
Output of "lsusb -v" provided in attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
