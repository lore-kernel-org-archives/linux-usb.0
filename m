Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38733FE356
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336954; cv=none; b=mBr4HH5lrRCgSNDHikPd5F5ASTzcQsv1cMgfhFqjB7rbr7Us5HFqFXR5Bf8ItOEtX0s5cS+tTm34ZywWqOyNUY8QXMbeR8dhfw96SfHMzOlCYTlc/fyZLbUcy6mWvLFQnjFyPBUUDuyrfFZ2uV6iS2dAELvgKun0XdI1c0uebeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336954; c=relaxed/simple;
	bh=iolAq1knoVqaHMv/Uu54ZOfxy8yHWpcre6ApoUqwlT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=siLLPE9okAvhImUgMGQtXkVkL8fSq26Bf1zm90BgKQBoG6IwuxRvWlCiacSo2EKxu/Ad4VTSsSO5z4kJmb8vyv9atitMmud63IaPogutf9nhEKDyRYIY+nwmzMGnsinjKgv9ScK8glvg9Ts2qGYS/wcJYh6k3jmEHcmX12D4ebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpY56/U2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpY56/U2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65864C116C6
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336954;
	bh=iolAq1knoVqaHMv/Uu54ZOfxy8yHWpcre6ApoUqwlT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JpY56/U24lbuAtlHFA0kcvHYZIJ23DFT9KlDnfaUZgkQh+LSp/jxiN9OT7L4gR4RG
	 7gNblynWmtV47bCUFCi6YL2I/BDLhojxEQaZ7QjroIHMjw8VdCnSZhHyXoz6DMs4RB
	 p9wd+pvI7l8KXxgGrddLeDrKM3EEU/LjHac3cAbEouT66vshWszIboTR6O4NarDNu1
	 meRnF2WnGTKzcN5WKJKmp35QCi598XGY/GtbjktIYe3K8LUs2BINzpEy7KfMkD9u+4
	 o4Ol/1EPuVNsHk94Gli+8hTUguWRtV63NzRFOGqfXOeYgwU6iuzWaHFtdHoYUd9ydG
	 8ziGbhm9+hd/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56DCFC4160E; Thu, 12 Mar 2026 17:35:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
 usb speed
Date: Thu, 12 Mar 2026 17:35:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vahnenko2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221216-208809-GXt7FqXiOZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

--- Comment #2 from Vyacheslav (vahnenko2003@gmail.com) ---
Sorry I did this kinda junky without actual git patch, I just edited file, =
I'll
attach it. Added 2 lines in 596 and 597

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
