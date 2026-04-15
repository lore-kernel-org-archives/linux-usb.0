Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DC327C18
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259389; cv=none; b=YpaP29WaxBdoVoYZzwWlQmSCo38QRLH4aq1IVRS1nmVbDd7FIzlP8aMwlSMjnqOHFmd2r+b4x8Er+BTkeIhO98p2FdCGNLrx7AguQbrFDI8e9lqUZsYpJ9Tt+VQLFL0HE6Jzbt0HZBdovJ6fGG2+0JvVtC52lK8INOESvjtaFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259389; c=relaxed/simple;
	bh=HHjEPJcWfRYsjop4E0jGlP7LYj/r/nMo6WF4aW9RK0o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJbA8GQJ5vG7BQujYI4iFaQ2zgZ9Ahr5rw9TxXCZyCcXelyJ5gylbMiHHN8V/BZ9GE7cwK0XyO4HvRxaT5vrFokAODlgmA6VwYPtca69FBauDC93hso5U+wy1s/jmyng98mvY7lu0Z42ocCfpFL82j1n0E/z67zm/vjmeHwVCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoeY2DPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoeY2DPO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCBB2C19424
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776259388;
	bh=HHjEPJcWfRYsjop4E0jGlP7LYj/r/nMo6WF4aW9RK0o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uoeY2DPOGPWvk4GWHEY3UgrrPiImz9UB45598l9vwgOGnR0GIOJbtBwEKb/WLJ0/x
	 NEG7LlRL87hLhj+UWyL0FL6cb4CJSFL7guywgoOMEHqh+ogZMkOc3RkABcWBNFe+OP
	 +/wovkPLbSpse32nXCXxxp5lRkS8rzV9G7wTT6bLojTd87lXc7SLzENOK6HJLNTkrP
	 2zQ97i5qNGAlwZ97gkKYBA3tBdOESSiHkzbCX8t+ixEWXGX+nAXSWAYwbwMkcNxiNh
	 N1GnEhwFQ0MZTaXPBbl+nqXu6w1IKd+u1jeYwEKpUdAp2PaJbrDNo+vXsZvu/SYJdQ
	 LVPDFuUMpSEJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A595AC4160E; Wed, 15 Apr 2026 13:23:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221359] Regression/Warning: typec_altmode_update_active+0x101
 triggered by UCSI poll worker when negotiating Alt Mode on DisplayLink device
Date: Wed, 15 Apr 2026 13:23:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221359-208809-6IQVObcHrd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221359-208809@https.bugzilla.kernel.org/>
References: <bug-221359-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221359

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
> 6.17.0-20-generic

This is a heavily patches vendor kernel, you either want to report this to
Canonical or reproduce with 7.0 or later =E2=80=93 and then bisect if the i=
ssue still
occurs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
