Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168036C0D1
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820336; cv=none; b=LQis+lkGvZxxcHutjN6RdZWrp3Q0DZSa8A14UOvtYjRn1/NoAzEdDfuQbdHNTsOxjSwv3T3CubMwf8MpIK2oo3L36VsJ2GU8/jTDPQtCY5MZtUSccxk2iAzrUXnESnCDsvY+w3tQ6P2U5mFYTdwlycyL51wgpnfTa7ibLpzQio8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820336; c=relaxed/simple;
	bh=X3W6Zy7rOqtrmqmCe6wZB8dLtGMBPPuZSz/PvP4gTQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pia8A7/lCpQMdJ9fRZdc81FasZMPO83M33rgkN6DtfBPM5t/FzzSFxc7poqb9nI9TWjb0sKAmL1XzuvPhfpQeBd8stMweJm2yXwR7pLu53VEQ6hzGSeoFm/YwEGxAurtHm5y/OYhWT1kfqSbia9A2baR4FO7Yh7sMdOGGJ9pb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O380M7DV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O380M7DV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32630C2BCB2
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820336;
	bh=X3W6Zy7rOqtrmqmCe6wZB8dLtGMBPPuZSz/PvP4gTQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O380M7DVEOG8K+dIBGdUNnkRGGcI6wv9celtO9l/zxRwX04j+h2tXS8JPIqMrCVpZ
	 0mkuf1286aI67dk4QMsjraTnD/V7fMbRqS8rc+7dtNbM2NJQTt0czZYznp8dn8Xldi
	 B12qbPe5RJpyZkv81amalLiqhAwmFsYJ4E4sah8rIQu3YiSNLylIe3TjZx23UMEA9Q
	 Ey8PWCKJuX8DbmZgdaePEcyipY63Gd9L0aAyNI/+1RWCWuPmaEyWoPo9jlvq3OQinC
	 qyfpZ1x3kAmStOUgtBDQbZcY0gCGzZCTX8RFvfWiryLII7o9a0iWE82JpVo3KNgBl5
	 7+5WboHikVpoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2B71AC41612; Wed, 18 Mar 2026 07:52:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Wed, 18 Mar 2026 07:52:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-JKdCj6sEj1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #31 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
@Piotr, should you still have access to the hardware, it=E2=80=99d be great=
, if you
confirmed that the problem has been fixed, and close the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
