Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109D63B9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924718; cv=none; b=uElDFOpnJYC6U1qdvCMSMeTTGhjvfjHvGuJEudGlGxhdnzwhv7bPwDp5o2c2o++eM3Qbpcrc1F8/HSRZwvStkHrtouH74ER5MFRtHd1pj9zRDYOt0Byh0ophrvqxu3uaVVGX4983qwaKw9msLyGdXz0fyld6aBEhEtYCY4ofuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924718; c=relaxed/simple;
	bh=yHdOQ9NvFhdnrOPwRBAIA2G2ps4BIkBDpoLfEDFe3DY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O+0mDq3fuO06ZzMfwmWki6PdXGy8gFT7d6J8Gqx8L/djMvoEEC3WaRV2U3WaXORR42k8+62SNiFMnnczSAKzo4SrcFc2wXtqf43crYE7aEeqMQsR+DXoiKg0HZn8WGNzTl8y/sw/lgRjJJyXe1DoMQyJ3x0dEMyeWGNkiaIJaGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVC6mXNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVC6mXNd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F14FC2BCF4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783924717;
	bh=yHdOQ9NvFhdnrOPwRBAIA2G2ps4BIkBDpoLfEDFe3DY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LVC6mXNdYJPEyjAxD3C5tOYskEt8RBazSDaokeSAwAnSifE/pYIv2/1F+slRwJsgx
	 5/lbvrtNzKr62wwnwQQzMHXwmBjtWLapLnVIA16XXoylIX8m52UtHj/1BE8zX58ET2
	 sm4beGz+1R2RiyXd3ZVhbujK6tnymwuPvnFiTp7++vTYyJL1zNHEv7wc6yrQsAm8xn
	 MlGWNroxfVzI4IoVuUPztJg+H/CJYl7l4/3EPQk8ZHWmspekygQ2C2PW3SwEsgc2eO
	 K6ojQmqHKPAOkXcwLaxJn+CX0N0swOKNd63+/0LCSs5JWsGZkA1SVIo1TIoyd63nQy
	 sTrgakYS8M7FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 740B8C41616; Mon, 13 Jul 2026 06:38:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Mon, 13 Jul 2026 06:38:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221721-208809-poJ44soamb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #8 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
> I may end up doing PR to that as well.

Well, fixing this is nice, but do you plan to fix this on the kernel level,
too? This is maybe a borderline thing wrt to the "no regressions" rule, but
still would be nice to prevent problems for users that do update their kern=
els
without updating their initramfs tool.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
