Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DA3C4571
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239911; cv=none; b=CMd7Y/LoBHl4E522lPVm0lIgn5nfbc2Eiiics7NEIWy0b001sMhiYGjS9DSw4gEe6V7h7rp5+wRAizmmQUZ7h8Jz8zz8spcvnMyUZp64HyNLRu5SMKFY33kC2Ke/aHcVKH+o3ZvhgR9R+BN8HUPZ0BDjpGvKaIEzTn/AC8M/c7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239911; c=relaxed/simple;
	bh=ETzv97zDgruShPzK93Eq5JH+jzzPKS63r24y/2vXXO4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOU1tvY8Dcj7t6AZh2KwDz54au6c7/PUpdYSi+OAC1pltRaqiPYrhrWpRuOMtrDFTOHH/IWSkW3NzpALqtkt9Dh0ThaWNAqZxnHQDWMzyUGdsqqu2jI/6D3mNIe6AURo6dmqGp7Fsuyahl9dKp38d5XnnCvhcpug7xWXOojveTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKlbhlaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKlbhlaX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D66A0C19425
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239910;
	bh=ETzv97zDgruShPzK93Eq5JH+jzzPKS63r24y/2vXXO4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kKlbhlaXivUGNvoDMXLUePJMBsf2aBh6HNjiOP18mmEwSbPT1eDkz+uz6OOeNfN3M
	 ofFKcNrs3OBlr6WajmLSZPiJgfMI8/HER+dct5/SHY3bSufYjMimxHseGkRZOO+kAV
	 GhWuVt9FmdtLRm7NctpHGdWUQxTbJZculalR8rjvDsm/6euJvBZ4W1eD/hHvi1De8w
	 Gm8Ergm69jSpGmoq+D0BV4qnYigkkcrv7MQEtkQU3VNaToRE+zQ61Vv09k/AXXyNu/
	 s4iv9Jmqe0D+ngJhfDdnpV+DgmLhXYNweyv1rCqU7SwxpPlgyP5kwRiIhUXqzkz+Mu
	 wnYDqIjgb+cjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD315C41614; Wed, 11 Mar 2026 14:38:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 14:38:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-Vyc2KHy5TS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #40 from Alan Stern (stern@rowland.harvard.edu) ---
For USB-2, mismatched toggles usually don't hurt.  Mismatches occur when an=
 ACK
packet is lost, so the sender thinks its data wasn't received but the recei=
ver
thinks it was.  When this happens, the sender will resend the same data usi=
ng
the old toggle value; the receiver will note the mismatch and ignore the
duplicate data while acknowledging it.  This is part of the reason why the =
USB
stack historically has not included much error handling for EPROTO errors.

USB-3 is more complicated, and the host controller hardware keeps track of =
more
information that USB-2 host controllers do.  Re-establishing correct
synchronization after an error is therefore all the more difficult.  It wou=
ld
be worth some effort to find a solution that can work for both USB-2 and US=
B-3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
