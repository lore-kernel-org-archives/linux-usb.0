Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480046;
	b=f/jfjC9w+UCpYeI3Gbo+gRgXqHM/sx4ziKO8wF1UXSS83U7gO8ocVD6WcmcHXTXnRfuN
	 EM+C2E5+WyJH3tzPZnKy/6+GyS4fCxMijQDV4/8aDoqudDesBYBVoS0yoOFbMcBVqKERY
	 l/oEAptv7bLnB9rC2LCwJCl6sSF53/5nlF3D1SeW2dX7b/RbTeTYrVz+LDil/kxxZPs0E
	 ZQxbfEXN9Zzfkbh5fSAdao5xbjz+O9kO2YMryyUHYOIjYEyjqVF4POhhaEQY8yaTm9yol
	 Odu+HdaNozGpddE82UxLCoq92z9QVvsRVjCkScK6y3Gvk6xyLxI7HqhHmsgApMXAoOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480046;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=vKY+gQnV8/N4Uf1Lc48JczIgxFMp4tXeDU0yJyNw1fY=;
	b=FoiywPEI8E0anaZ5drobzEDhT0ReCKFi8hsgo7HVGMZGQeYjZqgCFLDzZM89Qk1OMPKw
	 Pps8zo0U6zBZ6cTyqTpUQPJJTHfVa9cUxijRabK94rh9saOjABdO11obAW+Vd8IsKmXkf
	 rbEUeM+iMlXUt0dKWoy/rBQ+a1QgcE8s44nqcqTmNM+MVj3cDkQrKH2gQLK6PhRo2rPjK
	 hQpJ64YGxPiYq5lqhoUQ+3jDCQ2ZXEy9VVosD9xzrewFfj43w5gYyutMqJn8yj2xCOh+O
	 WhK+4sAQfkJcvIELtTdDr1yXMXisQ43LNc9xYgDLuMx16U25uhCZ4EfZf0opfe3qJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gB8+WbnN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5B606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gB8+WbnN
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86A901F00A06
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480046;
	bh=vKY+gQnV8/N4Uf1Lc48JczIgxFMp4tXeDU0yJyNw1fY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gB8+WbnNQThB8o4CDVe42AfQBCG7ibTme9OoqY3oYQer/HtVHO5neTOzr6ZNrNj0f
	 o0qoE7Gn73OSBvINXcFLWVUvOX7RiBzIwtazemD96iAACLb2SeWPv4r/4sDEAqI3Uu
	 pluAe7GIVDIvpR7KYneyrevpvrn6h0ggrdi4sCIb9xrBxdcsXWEpj5SGM+eFOkjXCe
	 nuO6RIdg+WVV6sb3hACzWLipHQCKm0yu2c3YXYqqQBAJjdja83IjfLY1F0dI+Ghk03
	 rnova3iis14RehQMjgNICVyn4WVXO5Wl5gvE1eN8p6kFCdqdkidJrXcY4+aQE6neAv
	 Pu43s5g2vy2gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 830FAC41613; Thu, 12 Nov 2026 10:40:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222261] Regression: ALSA: ua101 breaks genuine Edirol UA-1000
 ("playback packet size 560 too small for 15 capture frames")
Date: Thu, 12 Nov 2026 10:40:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Sound(ALSA)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: londongrad@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222261-208809-1FMetT3vKM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222261-208809@https.bugzilla.kernel.org/>
References: <bug-222261-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222261

--- Comment #2 from londongrad@gmail.com ---
Apologies, changed component to ALSA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
