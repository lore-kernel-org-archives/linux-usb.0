Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9704766BC
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253782; cv=none; b=jELR3e9TFCH7u/0I9cAJCL4MdFiDmkxn9b4Fw/qyga9aPgk7BQ2ZclgW01Q5vbf19kY15i7UrrqF9sqBjZzqOB/oZ+DmQXtuycg3Q1bcxYRvxx+c1+jGkzfAU9YDxeOY+Qq2OBucZAnY+96BeedPEAuUFu3jXioPhv8jjyIznEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253782; c=relaxed/simple;
	bh=y7UTcUWUoBnMc+zZrnRm8OKhU9VJ3hhvzRZqCGFhB4w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PF28aSdMENYN/8/bTqWl8+HrZszWgWPx769Hq5n0TE7SFbcKnyr3m9cWQ0z7CERfw2g+v+53SFKsrPPtTs1w/hp6tPYlZxyUiqlte/cggUexGJNsjHEn5Fo6TbeLNy6HZjfmjeLb45uyQgLvIMYZgJP1cyyJ0b6ZSOmo2J4Hvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2g7X/Pv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2g7X/Pv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F25F9C2BD00
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788253781;
	bh=y7UTcUWUoBnMc+zZrnRm8OKhU9VJ3hhvzRZqCGFhB4w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j2g7X/Pvny5aGkQS+e3pIQuQp7fcDizfsyxQYccwq4rGv+u5JkBC5i9BWkBdkuLWe
	 ofgzgO/qLuB09I7Bydhw+R5DlzP8CZ/Wlrgct8YfDjNIrnwaqnR3mHjtXrQHYhHUyW
	 TPHFrL9r2VMMY7LYxtgMOCJL9zrlsKC8aP8jsd/vLrvFhhVnCd+wXH7g09jkVZPYq8
	 LvdOImbDxEs45EzhTFWTvBdIV12ljna8O7OL2RURJwYR6RFtkydjoyUAQU/Ioli5gZ
	 QoB5zNh3ltbwUqGOuTNPhG/yXXb3Qx/xnWJsWfKkB/7YWOvypMpJnxtxaaadu6lv+m
	 UbU7zxEXpOjBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E20BBC53BC5; Tue,  1 Sep 2026 09:09:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 01 Sep 2026 09:09:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-jGoDGAHI3b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #38 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Could it be that your sleep is too short and the loop runs faster than any =
real
world software typically does? What if you increase it to 0.2, 0.5 or 1?

It's theoretically possible that the crash happens when the xHC is resumed =
too
quickly after being suspended. Maybe it doesn't matter how long we keep it
awake, until this duration is so long that immediately after suspending some
userspace loop enters another iteration and resumes it back.

This *could* explain why the regression happened and why reducing time to
suspend from 200 to 120ms helped somewhat. In such case, we only need to get
this down enough to stop crashes with real world software. The underlying b=
ug
is still there and you will always be able to trigger it with a particularly
chosen loop.

The only fully reliable workaround would be to characterize how long the xHC
must stay asleep to reliably resume and add in-kernel timeouts to enforce t=
his
limit, no matter what userspace (or kernel USB drivers) are trying to do.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
