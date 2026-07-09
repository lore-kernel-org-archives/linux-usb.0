Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9641DEF4
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598256; cv=none; b=uXCwS6EpWaOOqTsMY/3X0I4eJZ409r3zen3g6IRR2glAhArIti2Tks3WCM7xPg255xMv+Cc6CNeK71Lt53Hd33IiREBlMv+pg6fp0A1gHBv3m4bwWviTDSm4Rm7AYwe6wtmWNke5t4xMazIlgQteHESu5cE27XhAYXMmz29CPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598256; c=relaxed/simple;
	bh=Sodavl1ttvGUP5TSzUARUo5T5C2OF4OMwZ3yWeqBRT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VKAYvk7+BUBFZWPVuPZoaNOjHpZFIPS3uL7AwqnVNhGrr7dPTQnoRFqPcSHCR1HcxBsNMlXVhDujd/LcF7KOuArFx5tD2pcho8Hh2hsIrDHXtydeFFi8jgX3O5x5YHvF+G0HP3UU6i6L9OVHohmwJ8+jxdfGjc9rDV3P4QzcROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVGZsO/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVGZsO/V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58334C2BCB7
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783598255;
	bh=Sodavl1ttvGUP5TSzUARUo5T5C2OF4OMwZ3yWeqBRT4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mVGZsO/VbfDUN4R+E7LjNQ4RcLkhTSGADncRjejlWEXPSLJMwl37wlHgYFmSZ/n5S
	 ocSoLaGsUXjEsoi2bVHcIeLBLsAD3JMVhlXw/pCt/OoH9iK5aTr5/Wlp7zwOuumEeq
	 I43HAMnuvqi/FgEhmxrYUGNpWdCtQUtWLr9seezpxPVVUrtQ9g9uA99IFuO7VCHjKL
	 SK1FLEtpIxAj1UWWI8rWTjUT3+/EraffSa+03BAMp0PNXcuHjmyfo0tRRy6xmtubwo
	 ZYFM91gHjt0s3FuQjAjRzG+P7k/K4kIu+ugw1UL5gkye0/Dxrc1zReKuqaDPCheK8Q
	 B7a/ZZac9YHHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4362AC53BC9; Thu,  9 Jul 2026 11:57:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 09 Jul 2026 11:57:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-gXtWFFA2MC@https.bugzilla.kernel.org/>
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

--- Comment #49 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Since there is a failure rate associated with this - yes please use rtcwake=
 or
amd-s2idle to automate the testing and run large number of cycles.=20=20

I don't know that 4 cycles is representative enough to reproduce it or not.

> What about PCI runtime PM then? Any chance that bug 221103 has the same
> cause?

Completely plausible to me.  Testing won't hurt to see if it helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
