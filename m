Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFC456DEF
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295133; cv=none; b=alFwQ9p50XRz8g2G42wOAtcTJWXuuo82B9j0QQ1NNIPrzf06fz67oi6RdPOcoTklbHcPNZQadlVkSI8ob6o0Bp3Y++bMRsIBct1sK60CkzH5bL68WzlcrOjkfHDT8IaZlhsMR/c7y/YhyGKjtA90Ylvw0wVUuSRlYvEXcEBjxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295133; c=relaxed/simple;
	bh=AwalFK6We/aWmvkU7q5mpvLLdDbJvLDkKzj6O4eRGOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PNgyxx2r6xdoEvcKXh6SpE8rd8Fw8tWEz4AclxfKE6SWYq/mHzH+aWesgIXwVpunW5yOpjTfdWNY+GFz9OkyAVw54PR+ybF2pVbcX0NiIkBsnvm18O/6B6twstcHt3kdjiO6bVhIXLsyJHGzno9uzx8yJLai2Q8415xQthp/b4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq9GKDkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq9GKDkF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1485C2BCF4
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788295132;
	bh=AwalFK6We/aWmvkU7q5mpvLLdDbJvLDkKzj6O4eRGOw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dq9GKDkFp8C2nOEHCYbQw2ZhmxOlXdVZ4CCPIp94DynF9VahUnjKSSroz55gvBM00
	 8Fx5fizsS07nVYP5cUy8iyeOoJE6pjUv86fnIg1oU5vWGqtDIEe7uSxBAGkdlFJ2/X
	 ec4cldfqquFJr2dslXQr7ppDLttFgxS7VyPHbEEyhu3mg8UeKJi1Kq6UoejmXw0/Wt
	 tF6v9DokNPyOIGF1N8POY14rg212UWUqidvYqgfg974Cpxy4l76BoBf2S+r/7AxLPC
	 L8aTtFrYvJHrm90Ye0yVJ4Nh/mDwkIDo1eE91D9muksJtSRhpoJbowDZaGLy07f28I
	 h3GIQ2jkhsuFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DB3EC3279F; Tue,  1 Sep 2026 20:38:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221954] ASUSTeK ROG OMNI RECEIVER (0b05:1ace) handshake timeout
 and power management failure on AMD B850 / Ryzen 9000
Date: Tue, 01 Sep 2026 20:38:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221954-208809-uknZUysSga@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221954-208809@https.bugzilla.kernel.org/>
References: <bug-221954-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221954

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lovekeshsolanki00@gmail.com

--- Comment #1 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
I think the this isn't a kernel bug but a systemd regression,
https://github.com/systemd/systemd/issues/41296, which seems to have been
fixed. Could you see if their fix resolves or issue.

many reports seems to have been made on this bug on different places.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
