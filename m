Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAF26AC3
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288857; cv=none; b=MDjn7Aj2jh2l0GJJUnCYCuC8m88DMX6NyG465OkfPWeC0xD6X+i8ejBnEsvCEFV9E8Qc+XN7Nv5vHxoE58rXANNA813FqPUm3K9pZJ19O2iwvdeSfandwaS5tEioNi7BhG0rgz0fYRaPMy0Al0HwuCUKzLv8aXH876CuCaZ0+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288857; c=relaxed/simple;
	bh=iPeWLVNf8+xqWPgg6CC43/RRXTyv8y1Mq/JPI3ms2Dk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOcwkCB+r9gDL47FBXmZcrq7z3p8a5a9YvAEYFzQBBiBgaeL2T3btrGipWoq/aInQla3j7DIYyyNp2kmLJhUoJejCMgkUn89jy07kV8xlSC1wk9EKA2RgJoK+1wbMd8bmA6qvbAwv6iAkyEuSkDBOh4JMnXgTIwZRFSpftYH48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBmdY0px; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBmdY0px"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12382C4AF13
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791288857;
	bh=iPeWLVNf8+xqWPgg6CC43/RRXTyv8y1Mq/JPI3ms2Dk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lBmdY0px58D4R0AJl/Ojot3hU276NxPaRDChf/Y6Sm6wlnisSX/TDKHpNYJXS9vCj
	 sOuz6BE9MJ1Y6FMrspVPxNhs5sx0LB2zO3mTOkcVyvZTDfy9yQVQcULMCq/VIhKJJ1
	 1X09h9X7b5Go5ZTLDKa/8k4XU7hcG3LTkG/4E//Hx3vg5nVcjAEuDeP4sVenjZdl9I
	 +hYMiJz+SCK2pcpDJXfvI0zN0Hr3iKfqlTHmm4v2DENO7erCxx2JZ4b/lri/6LW9qt
	 QKRjtERh9SWMx5E3SBmm4eWzL3yfdyj/rm81LTahMWLRiR+TcM4PkNBXrCMFGdElx4
	 qbK3aZ9s/YZqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E93F5C53BBF; Tue,  6 Oct 2026 12:14:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 06 Oct 2026 12:14:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222071-208809-ujG83z9z74@https.bugzilla.kernel.org/>
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

--- Comment #14 from Harald Judt (h.judt@gmx.at) ---
Successfully tested 8 hibernate/resume cycles with v2 of the patch on
linux-stable-7.2.9. Additionally I did some tests with an USB stick and a
bluetooth adapter and all seems fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
