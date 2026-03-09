Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE961A5B8A
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082792; cv=none; b=uOvQ7h622eW4WpqSzSZzDsrENZGo4TRAqS/8egyZxqsQ6kYgmdxCs6XZw0d8RKqeg9TpQyu58Sgz1yb8g/qTSZrMIRe5ZtsAn8KP+oqAm8nDA/ru/zj6leKHIYtrpw6hwUGzWYUpLVGHiutTBdHpsDbnD/R5Isg+EZHa9EmBsa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082792; c=relaxed/simple;
	bh=Sxy4WJuwTizG0jGaypMinKuPRvP7FpfJbEAvLhwyh54=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BWYxZxvNOIaK4Op6XK2vi7lSAq9fS35Z4B0/ZKNSaRXYBh24tf/FaoQCxozHWDc+Aj6k7DnPbc0gkjXah/ZqH1dkKJNfsGk+c8N3y5tEjywxpBEjWjDUkZ8S16/IWc/LM0KCF+DgKgRJI78onBogNqnxZy5E06X9CjeL16AaDFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uz05fIhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uz05fIhi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C568C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082792;
	bh=Sxy4WJuwTizG0jGaypMinKuPRvP7FpfJbEAvLhwyh54=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uz05fIhirTjKhgym2+DHFa/y0vfehULQNSQdP3Cc2dn2uWEvOpgnDaHxZ33y9CK/F
	 ylBwHuDsVn9Sal3R97Dh/gzvgtYz7UckggN+4UmVfSeed5QWKavuuIFD3kw2mdKm5J
	 E6K4oIjym0rweUNMHWeQNDXv9/gWxbBL4VkchVXY2DYNvBflT9iAbUTOSvJCper4M3
	 Vp5YWzGqZYgR7jOwHZjm+08y8DunZ2yWrJB5WDBkHM2M2+xDTuKtSmave2+erX6U+c
	 yM7BjUPa98mKE7HRFr8xQP7XvjCZ/emfDYC03aEoI23ykiHOIfTyTlr00SiR3DS9nN
	 0V6l/MaADtK3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47622C433E1; Mon,  9 Mar 2026 18:59:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 09 Mar 2026 18:59:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-iBMX6ZRqKy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #5 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
Dropping the undervolt didn't have any effect, but it might actually be the
that it doesn't like Logitech wireless peripherals connected through USB
hubs...

Connecting my mouse dongle to it via an adapter is fine.

Connecting an NVMe via an enclosure is fine.

Connecting a USB stick via an adapter is fine.

Connecting a USB stick via a USB hub is fine.

Connecting my mouse or keyboard dongle to it via a USB hub is extremely slo=
w.

Connecting my headset dongle to it via a USB hub is fine.

Last time I tested this I tried 2 different USB hubs to make sure it wasn't=
 the
hub acting up, and the hubs both work fine on ports connected to a different
controller. Unfortunately I only have 1 USB hub with me to test with at the
moment, so I can't reconfirm that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
