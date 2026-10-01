Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1C14825A0
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861147; cv=none; b=j5esG8O12RAzag14ZPywA84ddIwfBT1wsqWyoIWZsnC8chs0bUcsv9DlsCnmYWTJVdSfoQsp+5Gr8DDcVSM03AYzwRBCwIAaYP4bGGvuk4N69RZcFL9pmjuvGQvt1aDB0GKiskcIxW5W8tQgsQADaritmShW3FWFn+42STzbdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861147; c=relaxed/simple;
	bh=0LVudNQim/M+srpoiebwJBCy7OL31arBMW7kjOXpF9o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cs1HfMZI+tbOU4UB7rPGV8eO+pf2WXReVr29dLQSf3bywVTaZc6jwYHJ8e9EQ0P1x7kQqDw5qznxpCd3we2ZwCYcdIHfNddNFfOldql4YgcvNccHRuFehMS0fv2MIsZ1Grpywo+2qMq1KysStJnI9DUr0EJoxVtGKjDH7uUeZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qvck6VsD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qvck6VsD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 314CDC4AF12
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790861147;
	bh=0LVudNQim/M+srpoiebwJBCy7OL31arBMW7kjOXpF9o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qvck6VsD8d185bBsOfse4JKbsXFTr4CggBn9zHn7zgx5ibtVfsAzx9ST0idBkypA2
	 yORuWBFMDv6D/QeT7l9kL0+HakcZHKBNjY87BxMv+CN9RX1TG2odYM4lTVgmBDAbAe
	 blrxLtcP/EWavxqU/pfvIqvBcWEGxR0sxmgvR2p5ONZWNNKcFmHxKoxqGLvEUxQHb/
	 WmpK7gDNL3yuhJdqbYfWqD/lPY9TosIFgilHiR1LOY23oHDA+BZqMoAPZHkOh6X5X3
	 fgTGch6889VkjYC8vM+mTQgTo6q/mbyEEFEDh2l7bcKDE3Ys2UIP48ia8sfGmyZ4Ju
	 eCPXTjOo/8Yyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18E77C53BC5; Thu,  1 Oct 2026 13:25:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Thu, 01 Oct 2026 13:25:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222071-208809-Oe3wp5Avik@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #11 from Niklas Neronin (niklas.neronin@gmail.com) ---
Created attachment 310987
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310987&action=3Dedit
Test patch to fix S4 resume failures when using software tracked bandwidth

Could someone with the relevant HW please give this patch a try and run a f=
ew
suspend/resume cycles?
For convenience, I included the fix from Lovekesh Solanki for testing.

Thanks,
Niklas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
