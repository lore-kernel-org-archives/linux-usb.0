Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E32D97B5
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079825; cv=none; b=DpjGL5GjqvJAVi0ekdYjMDMFydxhRZ8q+DRyjPOtAnxUyR6Dow88xvW2rnrNaxDwxY/IeJT5gz2kbRaz8ANOYbqPMgzvIfE+5bLRRKBqEC8R5P+GFz8jwd3Z9DPDlDQmKyVkSD8ckjs3G+Fp7hqbxR1k1RLxbQAbSoD5OxRCowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079825; c=relaxed/simple;
	bh=XMCz6pVTQXDvMBoGmgoWUcaGlKtV1xjgP8f7so25kPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u+uSg8DBAy7VhTmf6RKxjUzBcPuOU15iqTXiD/ekN3zXxpf9Utc7B3dAit7/RA9ZhKofFY3SwH1nRdSMFURrRCViDQKPUBfR0ZylDcwdyiJQYVNlnGQuPW6fZ/nbknzZeHeFnHwadx2pmkcExaqXZo/rn8WTlARJjXvCWskGVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkgW3dnB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkgW3dnB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57675C2BCB8
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079825;
	bh=XMCz6pVTQXDvMBoGmgoWUcaGlKtV1xjgP8f7so25kPE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AkgW3dnB4ZXxdvyV7EQDtZwOntROq5j3VtFhxBGMSawRJH2ahmOFklcIqWU1BYP4O
	 e02fLxHwLsF0nqgALsQhR4dDa9vb6aSfxrbqEYvIVkBZzc/VdyamHkNNuFB1NGY1A/
	 58DCoDdHoz7v2wlUqY+E6DEYbYvJzA0dtpwGBdbByoRdzeF9KI+JXroeCVmsUiDzk1
	 zMbrvU97QTEbbyd9XpGwoPQX0WQ+tCIdQcPujfb2ggF5JmaTCZuoDAl9w5HrEGnD7P
	 NU5fECA9SX2g5R10Brs9ecnWLoqTNH9QANPFzwZ5cVCJUhmyQztC5dzxlY/vrEBCGk
	 j0ZeDoUTUdxqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4DED6C41616; Wed,  6 May 2026 15:03:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 06 May 2026 15:03:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dylan_robinson@motu.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #27 from dylan_robinson@motu.com ---
Regarding the start_frame, I want to advocate for treating urb->start_frame=
 as
an input parameter when URB_ISO_ASAP is not set. In looking into porting our
drivers to Linux, we've found the current behavior challenging to accommoda=
te.

As Alan mentioned, different host controllers have different representation=
s of
frame numbers. Other platforms address this by only exposing a normalized,
frame (not microframe) index, while handling controller-specific conversion=
s in
the host controller driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
