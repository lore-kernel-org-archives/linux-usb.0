Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793040795;
	b=jr5q/yPLIrCcftaoARd8nbwTa5ZwLBoj9ExUN3EKUjipkBOwonJP7rx8h91YxiLbkFy8
	 q+rNWFY+a5IY8z5ArCfoEs/qDt5NYvH6jU3fhOY3+7BjCBvm2w3tUqgMLc4ttwmu7wFKG
	 gDwZ68Nk7F4N+MCP+NgUxOb/WeHCga2zWtVOVxu9nRgV819q1VoLAIeEsztRH3C8qOQGz
	 Sz5LT9Qc49aLshVLN60rs93D+mCJ2bQmn5XbucaEQBtgCKmt9QZUAmqDoaxXKT2jEQ1h2
	 YShy/f19zNo/XrsjlErOn9lU2VuNRZn0sh/88Uf9DWEqgiltDy9xOmCxw6lVnnldIIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040795;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=tqrKh2Os870flsVJnY3dl+10vqofkJXBgibzVjC83cQ=;
	b=nF+pjuMwOpkB+iUMc/S9cSdoC1yzsHK/Zsai8LdzuXyppF23zsygLmogp4P2GcAgUmOB
	 JnoxYw+e5VUmMYVZq2vHWkqZJ1Zg6BMg5sZHfgEQEy+c8i6kCarEi+zs+BjSrnsCK7cpy
	 HVyUzywEDvARZZ6YgT/Hg0wYNH3xkP+rED9oYK9D9MMHH/CbkJq9ZM0bh1N0gFnsO4isA
	 iojX3ShKEj8MACQE37vGhPK48ymf32Zgos+w6L+90eFOn158YH350gR2mu98/F2/kQvVu
	 oiYSscvMwXl7Qq1wZGgg9A/T7kWYDfa6kVw3U3wK6zIKBI+iD4JBr1/Wg6YR55s5kiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnbDAtRC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556C3606A31A
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Mon, 26 Oct 2026 18:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnbDAtRC
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9336513C0
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793040795; cv=none; b=L7yN1rR37GiUx0sajA+FyHv7FCKhp7UmGJWV/G1n6s8zD8OooUb1B0mepz/RGkhK6dFNsEXJo9I2OKarUTVnWiv3fOj0pvbd5GjzGNmuxqc4M/2uenv6v04GxhzuVJrHUD9blDSGKH39dRzwga+umY8mPgHgIYhV4hxGd0JRDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793040795; c=relaxed/simple;
	bh=tqrKh2Os870flsVJnY3dl+10vqofkJXBgibzVjC83cQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LScIduDynft5hk2zfLkgd2XuSG0lK+IfO3YxhfGdd3mIRq3VYhLMCUoRS7hudOPZmqQyiWU7I+xZHIVTTjXl2CkKdVOPE1i0sY6El4GqMajqhPckqP0IWdmiLDu75baAE+aEVjwHSPA2pCb/q7MYJiLLoVb6bc7kzBIOxjuR1Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnbDAtRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98290C2BD04
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793040794;
	bh=tqrKh2Os870flsVJnY3dl+10vqofkJXBgibzVjC83cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HnbDAtRC5BJPh40RAO/lZonSqByvZ/r9j8vFeVmrxbnL37oEkoaP7iCQRSURZzmSn
	 JjI+tlhTSQTcWhmuk5OLwl8zzFJOOTUwUb59YwFJ1JtsBrly+Dg3CLM9pEc9CjSNyU
	 DxQ/oXqm/b5gW38uqZyBLhpBbIk7AIcCyz+uHeLISiFtS2dWodQDtUGD2Y4dU7BFQD
	 z1jiNZLMLskvLn8aoJpZzOQ2It2k00cMlJZG7zRtoh/M8bt2BBYBRUVhDmkl5TM/Vq
	 q0AdLneFIIGyQoph393RaupeDuTvUPdjwJH9om8leOzvk/1ZL28feewhxJFpLwtDWQ
	 jvAPVV6afNZtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7896DC53BC7; Mon, 26 Oct 2026 18:53:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 26 Oct 2026 18:53:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-SN0vGYdbWT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #12 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
Hi,

> You could try xhci_hcd.quirks=3D0x40000000 as well

That doesn't seem to help. I also tried it with xhci_hcd.quirks=3D0x4002000=
0 and
that didn't help either.


Stuart

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
