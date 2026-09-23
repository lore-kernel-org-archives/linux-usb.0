Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A64A0138
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190622; cv=none; b=qTKrAIqNBJfXh0NSlJcUSppZuP1UWhw0PioUCrpgQPopiUfc1gqM/UxNzSW+zzVurwWWMQE97Tfe1H3mcG+f2szIl5vBFWdSrm/UE8eG/FQKddBfPIrT7LmOnfof25/pRCTaZ4ivCnhyueEJ1yKLJ/qmcsOda9Q+01xzRi2CApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190622; c=relaxed/simple;
	bh=FP/dGBe4VnRq8C3XL3m9xhniLacyTo4PnCBd4Fzz+Ek=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hw3g9SIRt4s8W2qqhdqSmNS47PObDYi4pCqnrRTUF3M0LDdmq0Ket/DveLlrzP8tCOD79dO5RPvHAVAf+eyvdBG9sE+/9++g4mvy3QuhZEfjglunI3dr0IMqD0F8iU6qfqtQZlt4dYxW7EqqleSzSYWO4MhZVtzSLYfqkkaAMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zf9vJpVb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zf9vJpVb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75188C2BCF5
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790190621;
	bh=FP/dGBe4VnRq8C3XL3m9xhniLacyTo4PnCBd4Fzz+Ek=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zf9vJpVbXFGrFB4mWGe8owOv1A+INDC75fhqWOeUTgrrlenkCitgg07rosebdGefW
	 YZi7LIvkWvbgXUg5UTWrESBaadPpvKakGhOb08/NpKM8f73a5cwvJtIqsmSaRbYOqy
	 I6aW0bbjtQk1CMFeCXnCJyjsVn7Yt2yxqSA+SJM31PMmNj4DZbbrEWLb7Eb8NvaN7H
	 iBhh3C15mayr36hiXjiGTjqlCRiCsT5iOio7+n9p4HF/YGPoNDNyqr2YD1NnkdsG3+
	 rzHXDalDM9cDglDKrUXs2xwpbZBvWqQKXClwTXhqs6iHPKDpgqfg+vkT0Rpevp7lnA
	 2e4+z2XldsV9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4FBE8C433E1; Wed, 23 Sep 2026 19:10:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Wed, 23 Sep 2026 19:10:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222047-208809-TerRie5v0X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Are you referring to the "usb 1-6" thing?

Before bothering with bisect, does the problem go away when you downgrade t=
he
kernel package to something that worked in the past?

Can you search old logs to identify this device? Something like:
usb 1-6: New USB device found, idVendor=3Dxxxx, idProduct=3Dyyyy, bcdDevice=
=3D z.zz
usb 1-6: Product: some name
usb 1-6: Manufacturer: some name

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
