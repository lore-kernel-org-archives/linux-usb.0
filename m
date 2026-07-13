Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF7235358
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970072; cv=none; b=rqS4drfdBwWxbclgEe4BUDc4jBEUxnjOnjn/7hG3Zpj2WBLEGrXni2qmzxxD9SRNAP/eK8hPsxwqhHGRq03e7Wwr/TpLgFtLO96sryFVLvFq/BFQk/TioFgZloz8AroxM0eIgnijc2kmmAw36GmWjQEiT1JavcKle+Gdl3PgmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970072; c=relaxed/simple;
	bh=vv5oImI9co6QscHNtjgJKPAEtQ//FiIzShZ9/3bfcqA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tDkUoN6trXlhHyH0lsf9ckMB/IZ1Haooyn9owzR/tZx/tKHain9yceQmIqVDAXAHXcHMUS90fve0G/1Opxc2pge+yRMw2J/Gzhs/yKmkYhN5fj2P0Mq34IoB2MRRsBiV08Y4OXzMN7wrr2mAgokcfD+egBi44C9b32OBeCigp9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAMtBqW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAMtBqW+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4869FC2BCF5
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783970072;
	bh=vv5oImI9co6QscHNtjgJKPAEtQ//FiIzShZ9/3bfcqA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OAMtBqW+w+626RUHW/DHp8294gaeblyZRReD4FClPRcoXhh1sotujAN1RDEgoE3/f
	 FC0IUhfm6x+0lASGctLlZgZ1sqODWI5Tlbf3foFiSgvGOuTDYIBDNqLHBnk2rOPIjj
	 0z2kq2HSmjjhXKxkby4kB37NoHpdkVINi159tOfAdoB3TrEqFpFk6XBrJbomCjoNd2
	 GnovYnEvSJXLRyCimG7Gb7NQDT+YbLftICPfgvnOC6z/kETPjANNidbeyReLKWv0CD
	 d81wLJ5/B3IZZglX0e1BrCeiIs7QtC/yBU2CTZyN25F7sJ3uAzq0rMBVMO4GxGYQSs
	 dX8/yrP05lkPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2EEF0C53BC7; Mon, 13 Jul 2026 19:14:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 19:14:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-PcD61td2xu@https.bugzilla.kernel.org/>
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

--- Comment #57 from Alexander F (superveridical@gmail.com) ---
The v3 version of the patch has finally worked and printed the following in=
 the
klog:

kernel: amdgpu 0000:c4:00.0: USB controller 0000:c4:00.4 D0 power state dep=
ends
on 0000:c4:00.0

I did 100 cycles, and no issues, no "HC died". The cameras that are on the
previously problematic bus work. The NonFatalError state in lspci is also
nominal, I think.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
