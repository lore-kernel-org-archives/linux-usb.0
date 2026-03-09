Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B6155326
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 03:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773027838; cv=none; b=B6pTQlN/9Mkj048ENGC3DyLwcky4nRR0AQZFCzaqc1mhI5HHMW+mcFSICeYR6QPIK2ts52oF8+guKCLvxTikdfj/a6iYf52i/SsU57Hv+6xPnkc48JZglEMwfUuKKTBAYFD6LzhUEYHFsU+YwuaHcEUCwRcOSwUXa0jziQSKDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773027838; c=relaxed/simple;
	bh=S2egcwUSxpwrAmIBvwmNSS6sEedtmeWDTz1KsTpfKSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RRJijrHzDQLa6gYUpNDeWXi0HVLoyzW5ZZeozyAsB/JoFJisjetp/sQkX2IjMaUuGq7cd9zEqYp0hu5HRepYq7HrQh6JSfAmq42BZy8NaE+X8wlums4MX+vPg8pSed0bgsZPfs50Q3KGYEdIuM0P1XJhKP1Jj4fRewGtzSZp2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMG/cnNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMG/cnNS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99438C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773027837;
	bh=S2egcwUSxpwrAmIBvwmNSS6sEedtmeWDTz1KsTpfKSE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SMG/cnNSZFClhJ+3DT5dboNPHDEYYjIORr0y8HMWOA1EecfBS+rlkp2riTero68Cf
	 eCxogKyNQhdCqQ/41yyP4/1SZJ+qUpKZ/nEAtCuuUCZGZIXbqRvl/OijFLsl/0WxzX
	 n/wylzR9kMQozYvo/eFH0AWUZZ7bpDYBlZfuTYMjZMb1zkLYhFAVqnDTXKkF7LQiyG
	 ronv0eb8ir4pAhHCw+a8fCHDKC2hQRQWwGb4ztTRulycewpPOX2lUfkEILBtXAqQ9R
	 qCHFMyi798HJ13afmhILIUInq9VMF7pNWhLd1Am//vq2tiXyhT7gCHvxpGrI1Hymrs
	 DLDDBPNb3M3TA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88BA9C3279F; Mon,  9 Mar 2026 03:43:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 03:43:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-OMPOJeCRvK@https.bugzilla.kernel.org/>
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

--- Comment #16 from Roman Elshin (roxmail@list.ru) ---
> Re comment #8: Are you sure that other operating system versions really a=
re
> working fine?  Have you tried collecting a usbmon trace under another OS
> version while running your load test, and looking through the trace for -=
71
> errors?

Error reason are -EPROTO from ehci, and at least for mouse was introduced by
64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832, reverting this fixing at least mo=
use
resets (need retest with current kernel), looking at code i am wonder if it
ever correct, code part (ehci-q.c):
---------------------------------------------------------------------------
                /*
                 * When MMF is active and PID Code is IN, queue is halted.
                 * EHCI Specification, Table 4-13.
                 */
                } else if ((token & QTD_STS_MMF) &&
                                        (QTD_PID(token) =3D=3D PID_CODE_IN)=
) {
                        status =3D -EPROTO;
                /* CERR nonzero + halt --> stall */
                } else if (QTD_CERR(token)) {
                        status =3D -EPIPE;

                /* In theory, more than one of the following bits can be set
                 * since they are sticky and the transaction is retried.
                 * Which to test first is rather arbitrary.
                 */
                } else if (token & QTD_STS_MMF) {
                        /* fs/ls interrupt xfer missed the complete-split */
                        status =3D -EPROTO;
---------------------------------------------------------------------------=
--
why additional check:

((token & QTD_STS_MMF) && (QTD_PID(token) =3D=3D PID_CODE_IN))

needed here (it was introduced by 64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832),
there are (token & QTD_STS_MMF) already check with same return status later=
 ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
