Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3672FDC28
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550334; cv=none; b=TJC0qtHpQTWGVcKpolAgoT/F/O2ByQyOB+khVFu+4bhOv8/tMN1zxYmqKcWVZX5jWYiDY7F3fNGFFNnFbOumMOJAhBacT3Z81x8VIrcByNHGIDvr4+obMZcx3lkJ/5JnSzC8JnwyN8eHLqN6CY44bYlNeMC09dlq3wvCbnkoV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550334; c=relaxed/simple;
	bh=QpX0Gyja++niu1+PVBn4/2gMOICxBjKzDQMew7qfEFo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jzfH64a/tj/57I0nOk36v+PUbYrXKp8pckvZXZyqN3oyL7v9GnNWyHlxKyOf/IKr4zFYLrYimyjzZoelF1OVJT1zsQnN20va0KHnfEGDXo85O7i7zlBu9FvtfsNCBldkX3Cp2pKxepVEsV8FoeyZeraEZDW4vvub09x8BqNEHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPLUY4Yr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPLUY4Yr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6508C2BCB1
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772550333;
	bh=QpX0Gyja++niu1+PVBn4/2gMOICxBjKzDQMew7qfEFo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UPLUY4YrELchBw4zhF43zKY1XwLJ5hMdfXUMRAQM2sRrPa1QRHOINuDpl8AxuWB9S
	 9jtdKg4i6s1iUuHNA2Ax6nWoHoHG32zYKLiEoNZUE3xQel4L0rwFD46S4vbsyG40hg
	 9zidjAOW8z9qFdUwandhBlJyWIQaCsh9a7x0BJCiYkN01O188lFbxvXmekGM9tZfTf
	 1t40VV2dYvsCUq5EWCMhoV/+J1lFpxeaoongGbWsr7gX2rE8vQBmIY1u4HmonJN/VL
	 RyI6XmH5Jd8terk1iF13nZSrSPAUsQ6uVdvHtodfiIvzags5rNq+lw13Akm09G5Ln3
	 Tf4RpR4HkJwsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CDF87C53BC7; Tue,  3 Mar 2026 15:05:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 15:05:33 +0000
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
Message-ID: <bug-221073-208809-LqfOzSLyTu@https.bugzilla.kernel.org/>
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

--- Comment #24 from Alexander F (superveridical@gmail.com) ---
Debugfs files were zeroed because tar gzing them directly doesn't work(due =
to
stat call, or something else). You should cp it into a temp directory before
archiving.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
