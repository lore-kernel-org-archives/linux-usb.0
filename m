Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74139793C
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345841; cv=none; b=dzBiVfpJlzS1Nm/3sD+wfUMVHwOfawgXvikkuObAQpPP2BOo1yRHGMCxnBKEB09cl4GtBjoxVahCL5JtStzOYZiU+dl3A9uTtrysZYQr9EATy9d5n1FA7YUAYH8mD6il0pEHPpxWBzxq5WqYLVJXv53m4uSk+DIy37CROZ4wODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345841; c=relaxed/simple;
	bh=a12Y7a8bQgSn52AIPVsydlnSRQtQ6nZLvXNS38bGKDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YWagdKhya190oNRc8OAgj4WrECgiUzyri5b4cQDTLjb4VLKpS/rQzXHBHepY/o5PZZtzAIM6gYMK2I5gBuDi9yONb41iX+PAGJy3iTomnSzZ91rQb51Xcd48eXUnLWPjpme8w4ljeTrL4EC1fhMGtQb2zddD2fVpKS+nwqi4/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbMcQgcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbMcQgcu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F734C19425
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786345841;
	bh=a12Y7a8bQgSn52AIPVsydlnSRQtQ6nZLvXNS38bGKDg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JbMcQgcuogplW9U9O7Xo4pXrKDZpq8oq5b0IaHGR85cu8VMDd4M9BF99wlIoU+F5F
	 t4I7AGENHfUMnaMiLD6zCVf/Po6tvaklrY6q2sxlCycLXnzfeGnVf4TxgUN2hzGFPR
	 npd1UbJan4dPlgChKJZk5XzFR+Rc7GImcIiYErx586yG2+B4ZgxovsBVKLoBMnrr/E
	 cdI8WPCCmqt71B+Cxb7ePV3WvdNqTADPzXqvh1TBapIa2NhoYgqyqk3Tk7b1th7DcN
	 ax152o9J6d9fQTZxbrKS/SQxM31kjzRCu21UBg4DaYhda6jvHdQEa/394h3IK1o9vS
	 DMjQ8nV7icy/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45949C3279F; Mon, 10 Aug 2026 07:10:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219977] usb: dwc2: memory leak of hsotg->regset
Date: Mon, 10 Aug 2026 07:10:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219977-208809-MYyqonQzP8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219977-208809@https.bugzilla.kernel.org/>
References: <bug-219977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219977

Wei Huang (huangwei@kylinos.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |huangwei@kylinos.cn

--- Comment #1 from Wei Huang (huangwei@kylinos.cn) ---
Hi kakapapa2,

Thanks for reporting this. A fix has been submitted to the linux-usb mailing
list:
https://lore.kernel.org/linux-usb/?q=3Dhuangwei%40kylinos.cn

The fix mirrors the equivalent dwc3 fix (commit e6bdf8195b4a) by
switching hsotg->regset from devm_kzalloc() to kzalloc() and freeing
it explicitly in dwc2_debugfs_exit().

https://lore.kernel.org/linux-usb/20260807100400.3179625-1-huangwei@kylinos=
.cn/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
