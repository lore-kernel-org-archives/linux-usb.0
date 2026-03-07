Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCEA34F462
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884512; cv=none; b=ncyHIduMVFOyap+sy9y9j2nt1aLNtaoondxRx6UgzMoadaw+qp7YpfHNcD1ekqqHNlo+UKtDvR2unwZqJ5CsEa0VUDTa5LHWKjMiS+/4w7Mk/EdUgt7eoHVRZd8wNsRak9jbPb8xnWr9hBQvslj71cWXDaBqLM1Sj8l4RlU/3n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884512; c=relaxed/simple;
	bh=HMjuDXTRm392NIS1eP0xx1rtRd/n+d1DqXuLWtmt4DE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SOPcIBHlbSVw+VQe5d0ITLbqx/5JO5T7ri2XlFH3dm4gw3nBMomIcbaXV7J3ZHelhwksB4fjLrntisAO5l8I+GT3sex6VmWjSTBeUOZEvL1mmoVQgGrAH2EksdjA397Akhp0ffXsZRYkw3KgovrYQhb8+D5jPqykD6zgInVRWdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqvR89Fq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqvR89Fq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29665C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772884512;
	bh=HMjuDXTRm392NIS1eP0xx1rtRd/n+d1DqXuLWtmt4DE=;
	h=From:To:Subject:Date:From;
	b=hqvR89FqQUl+Xy9OBY1w3E2mAD5Xfj1x+5TJoiK81WISJsGQYPnRwPseRLmHFLBAk
	 yRlwxBEnoyocMljAJiqRxv70DBUBPcc8CWjT1SS/fFiOWQYApDcqHREomGAAP+RmaQ
	 mY64VTEOgfVikkSmXxAs/AQw3Gt8zCxvJkrrbkdsZgZciJ+88aVGkWXRLK+nHfzPq5
	 IP80c1NHrn3vnqHjuActF7iOe/C2XdfnSvip0eOwjcOnodC9I3T957RlHNvWoA259W
	 WgiqPtdWjqcMZR/DHbKRH5MmBjFPgCX1RHlWUKzIYWxUSbdxP+J4i8ktaHA6HuNhJD
	 hBBntgsIaD2Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1BF3BC3279F; Sat,  7 Mar 2026 11:55:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] New: mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 11:55:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221184-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

            Bug ID: 221184
           Summary: mouse/keyboard (connected via hub) usb reset under
                    system load with weak cpu
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: roxmail@list.ru
        Regression: No

Created attachment 309564
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309564&action=3Dedit
dmesg

There are occasionally mouse/keyboard (connected via usb hub) resets, seems=
 it
is coursed by high system`s cpu load. I found a "quick" reproducer - it is
firefox and moving photo test
(https://testufo.com/photo#photo=3Dquebec.jpg&pps=3D960&pursuit=3D0&height=
=3D0)

Partly it is regression - mouse resets intoduced by commit:
[64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832] USB: EHCI: Do not return -EPIPE =
when
hub is disconnected.

with attached patch there are no usb resets and mouse/keyboards are quite
usable it this conditions (while firefox test), only backside effect what i=
 see
- it`s some errors in dmesg at devices removing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
