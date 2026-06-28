Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C2F218845
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782631695; cv=none; b=K5v4/1kRyjewAWw5QCIHZ0KbZHwEv43i+UYk5+aLnW44tZjE4XB/A4QADZJMzoGWmjvsn2eLl+mCIljCRIZ9vV277+OgLU2k9654qC3fB1x3yQ0YkL/TmFOxlJ56+ULgCZO+5On3CjEP0VMOHwAiC+NDc9N9vZyqn27opMRgVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782631695; c=relaxed/simple;
	bh=4sffH032SPCtDJzKHJC9BSGQ8Mid+j0QBd8FturgRnw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5wTjEOrnkY+UePaklggE9VbrGqSeXR5cdWuZslbWWTORFOe1Kk5hduKjLpTvjge+coqFeKFRksaJGNh+RkF/tRzUBc0f6NZKL+IZd3tk7MVtY7SXITw59OJZByCouX3xTdvbIstSzdWXdzbrFq4b9pU7TLEEuVdldOlZiBskm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFBJvcHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFBJvcHb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A2BFC2BCB9
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782631694;
	bh=4sffH032SPCtDJzKHJC9BSGQ8Mid+j0QBd8FturgRnw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PFBJvcHbSjMp2nyPbT6xCA/JikZaOdYJ+4sFtcbC8hzXZ+bbdm2EA5quWEdz8w5JV
	 tO/7GLLIpvDQSDK6pbZtCdNYy0KK/vi+IPWxNVDPXHzB+LcLt2HhpdGL/DbpyudfsC
	 5vdclMpvqL2IKvrMZZxsixYIrMceWSLFo6H+ljcWSRJ8vle1AVjuc6sVVQif5Hsrs7
	 JVkHeGbQ116zaU/Vx0AWV71YZFa8GcfEzwI2ehCwnYgYXrVpXcGCaXNA6+jCmQm+l7
	 uurblY6oIkUk8arh/BVAzH+DyeC7LsBkzYFgAffjyFkXJJtQtVYAeJotgLu1QE8aFz
	 Vvg4MPR0PVkZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E2F8C41614; Sun, 28 Jun 2026 07:28:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE2OTldIFBDSWUgbGluayBkcm9wcyBkdXJpbmcgR1BV?=
 =?UTF-8?B?IEJBUjIgaW5pdCDigJQgTWluaXNmb3J1bSBERUcyIGVHUFUgZG9jayBvdmVy?=
 =?UTF-8?B?IFRodW5kZXJib2x0IDQ=?=
Date: Sun, 28 Jun 2026 07:28:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: artiom@flexlabs.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221699-208809-gzWeQ8ehSU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221699-208809@https.bugzilla.kernel.org/>
References: <bug-221699-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221699

--- Comment #2 from Artiom (artiom@flexlabs.org) ---
Created attachment 310387
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310387&action=3Dedit
dmesg logs: Connected the dock with the nvidia driver disabled in grub, usi=
ng
Nouveau driver instead

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
