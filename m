Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4822E8DEB
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967400; cv=none; b=gRoAEg3Sa2zYBOHyndU9Yi52M+K7Q7PgmGHuwKei0IrIW3P9CFHj41N9hH/tIslOFxqolbEEUbj5hFiSKxdGWBtBgRoDMtUur9YW1qGjZr8b7fZDiU0BvuqQFF83OMpY0T1T5B7lysznF4+vfTQes16QmRR8LQmy98bmtgnyrQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967400; c=relaxed/simple;
	bh=WgtYSdkndr1LVqwVRg+ySQ/DhHfyA8Zq9uxFkO7pz5o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uj3mnGo2wTXqTZTonpf0GqVjkymlyhsD6yxgERzxU1StCDzgbKhtAdtw1HGvA8xZGju/UX9PA9NeQxfxFt9dfGrzOhOMZswXnUTuKbkW5wKx3Y9RqLkRvb3grvGfJRSB0FJAGYcHqqASILznC4LP9wf67gq8e8ob/muCGZZvqhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5XBoTeH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5XBoTeH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 379DEC2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783967400;
	bh=WgtYSdkndr1LVqwVRg+ySQ/DhHfyA8Zq9uxFkO7pz5o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f5XBoTeHR9U3CYNWHEK94iypBi7ukYlPbmXFSohKMV8RrIUHM1RCGP2cZvuuMiwKJ
	 xyQz66b0L9f5vbs/U2ghCCDeXdUVn8d4EC97yItpnplO7Fgsqh7fXT6fMpBBmc4pLg
	 2z3L4blfYkXfssOdfx5BRxyIw4Bx2EuUHrGZopoZmzBUTsH0d4hHZxJMCHGAavIv6U
	 jT5ZIfQljul/J6/1/GjKCwA0Yb4wM/n0t3lrPrCKtw5JHt8dYHg89MWczSBY5EbFur
	 gymVXA9Rkpqn2mXI2BDj/QSywSw+sANrF72X6qHFwUBHca8g4f7iY5q4SBT6T3RyKc
	 2aOv0iOsSu0MQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 233A2C4160E; Mon, 13 Jul 2026 18:30:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 18:29:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221073-208809-pkPP7FLHFi@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310442|0                           |1
        is obsolete|                            |

--- Comment #56 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 310446
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310446&action=3Dedit
possible workaround patch (v3)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
