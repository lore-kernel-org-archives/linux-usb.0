Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47A46AEDD
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709471; cv=none; b=OGL48Sj1NoPSyN98rQoF+yrSZKbWVItm8oEe7l8vdyJceRoSQ2oZ6/By0YzptBujqmYTYxNUS3/hGMdOXvIpbNZjZIUaZUtSZTGKCqYRQpl3eZ9DlSSQlEuGeu4I7Rtt4Q8zc3OPJHt1ws1mhpiqZD8RNy6chCB+UbF0lB8xUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709471; c=relaxed/simple;
	bh=Vjz/Vm9m3CChUZlze8iQD3aqpnndWscTciqmXo8PNIs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F0ANU4FuHuIlQXZtBhzqTo6uKSRf1bVkc0DrHrEgAT+XxUumWGbk/pPUbA5autzPJycudm40iFXw3HXLDvdVH8CUmrSgIMEbgx/gkFVLDvr0vVU+1J7bGOicyrh7FdE5yqLPpr6L5c8VFA/fdbOcteif1JT+Yp3a1isL/ESeA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOVgQxTV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOVgQxTV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F13C0C2BCC9
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781709471;
	bh=Vjz/Vm9m3CChUZlze8iQD3aqpnndWscTciqmXo8PNIs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KOVgQxTVFIzXloga32yWMcT27VO9J5KmALnUv0ZsrJTzZ9nKpW/c58QJPBfZ6fwMk
	 5JPRYzQR2SrtnTyAn5voPCjsoH9514q7ABB0jjHN/GYXDbjaKlc5xaLl2ODZZBYY6T
	 MF1MXrjbsVzWH8CBmLFhWPwDu8ccWZOU7sr8SFHADZEjnehwhdk+tx5Tnfg8PZO3wd
	 6GJKOrGa18cGjy0BuM3BwYdbJ8HiDUMISH8ONaG3PvnQ8UDVddbSGez+cCzUnRMa5u
	 spDJXY/Igg2yjAiZZmU0zXx4Pe8d81lbTjcR9XdiH3yeQ2D8fgWNdmF7sxQcDuQJxh
	 8MXFyQwHDNWjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EB944C41612; Wed, 17 Jun 2026 15:17:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 17 Jun 2026 15:17:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hannes@vonhaugwitz.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-WU5d6V9tJ8@https.bugzilla.kernel.org/>
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

Hannes von Haugwitz (hannes@vonhaugwitz.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hannes@vonhaugwitz.com

--- Comment #44 from Hannes von Haugwitz (hannes@vonhaugwitz.com) ---
FWIW I can reproduce this issue on a ThinkPad T14 Gen 6 AMD device running
Debian unstable (internal USB camera disappears after resume from suspend e=
very
now and again). Setting `xhci_hcd.quirks=3D0x40` workarounds this issue for=
 me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
