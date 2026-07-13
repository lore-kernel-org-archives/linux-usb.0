Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84E2EEE84
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922448; cv=none; b=FDKaHKo4xtBFIVTSzl5uCpI/PYcn+QVIF+5Byhvn+22kgZ8fKpaOfr5GHRyYZLz+CEKEpAohxcGEveGyG6sr+Db2gxtMVaf+cHLek1uPnYhljJ3KbE307u7+U+KADf2IKqeEB6yztAX5MzDLa5WP/XYjpyYJi+PMoKC3+Lfv7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922448; c=relaxed/simple;
	bh=g+a0+7BfCqz6+H+IF2BS65T82QsOsnmjLYw0Sr0IqwY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FGzr7d5ktgybZRpNr4vkBGyak6UxDTYsm8NKP+rujH9EHtc1DBPglchQYciIAIe66HWKBcuOKhKvfoew9baZfKsjqbbsXcEFvKUybzjycsznr1BoWo95hqZyU2ZBZ5a06XCT2qr2/TZm6ZnLDBG4t43su4lnbA0oyypNy221s3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRPWH+2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRPWH+2w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42853C2BCFA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783922448;
	bh=g+a0+7BfCqz6+H+IF2BS65T82QsOsnmjLYw0Sr0IqwY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZRPWH+2wicBPRE6BLH2UGEPF3EjKV1EO8cgzYrdSp06TZ/d+4cm0bPkRAOqUhHbps
	 31IHR1w31IQGtmWEpwtHWxSi9g4V58tqEfNrfIrw9DaMDbDXr5LhyXQ5DawKgVw0VW
	 FEFwt6eYohTBxJxVG6WsfvCrm2vcEqk2YrxRDSWgZogt+EFleGmtjLUxVQZeS4nIRK
	 xIfsZHDWNOALbLhy40f4P2Q9VUVCTgxB1/d19C+la2tR8aL8varf4c1oW9MmYhvYTX
	 uNKR2GTp9YxNAghAOQecBIT0MpU8b8kArGZ+Gm1pHOVC6K4uIqcPqMM3Xa3zHGLFe+
	 XOF3xGUIQI6ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2740FC53BC7; Mon, 13 Jul 2026 06:00:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 06:00:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-WqKbN4DLCR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #53 from Alexander F (superveridical@gmail.com) ---
Created attachment 310441
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310441&action=3Dedit
Power dependency patch attempt klog

For reasons that are unknown to me, the flags variable here

2572    if (flags & AMD_IS_APU)
2573            amdgpu_setup_apu_usb_power_dep(adev);

doesn't have the appropriate bits set, so the code doesn't get executed at =
all.

To discover this I instrumented the code with the two pirintks, one just be=
fore
the if with the dump of the flags, one inside the function before the while
loop.

2379         printk(KERN_INFO "OLOLOLOLOLOLOL 2\n");

2561         unsigned long testt =3D AMD_IS_APU;
2562
2563         printk(KERN_INFO "LALALALALALALA 1 flags:%*pbl AMD_IS_APU: %*p=
bl
\n", 64, &flags, 64, &testt);

The flags are indeed different:

Jul 13 08:29:36 rescue-flow kernel: LALALALALALALA 1 flags:2,5 AMD_IS_APU: =
17=20

Then I commented the offending if out, the second printk appeared in the lo=
gs,
but nothing from the loop got printed.

Just in case I supplied klog with debug turned on.

I reverted the previous patch btw. I'm pretty sure AMD is my APU, and 3d
acceleration works nominally(checked with firefox/shadertoy and amdgpu_top)=
. If
it's some misconfiguration on my part(for example my kernel config), please
provide further instructions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
