Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79762153BE9
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775475387; cv=none; b=NiFPkwmA8IYK1OmgDgxEuZH1aFTW4U+8qoRDRisQlOs+VbaLGL5UQQWVs3p0Fr+C97ggLnpr5AVt6Mpop+lwklcjljEFCW1Bn4Wc4u0HW1YjkR52GazSHxC6uCNGmdH17IUZZ9ovg9zWz3/cTi7xtfduuLz/M7vMQPC/dIYyCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775475387; c=relaxed/simple;
	bh=jUWKCPYtV5bzAGxAksk3l21014fGus06WhVOg6fEqkI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWTK/sWry4TWKkZZPI41XwJNnYfFjFFDwyd9FdeFQLYAL9svvphlODECwQuLeQp9WZWgdtSX0rwFF550pJxFuD6LVc0eu9J5E/enZxQVurreJbrb1JOLB8Wq+126K0vDantvZ35fa4mjkoepXJ+S4XpRQ8UukvIxYbmZ4cwNVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evlMP/ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evlMP/ml"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 064E1C2BC9E
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775475387;
	bh=jUWKCPYtV5bzAGxAksk3l21014fGus06WhVOg6fEqkI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=evlMP/mloOdPsmI8W+YJ3UHJPpVnbvvRQ0RklFuLXJnXId5y12sAXKBUACGjEW31w
	 TzwtGiy95hbcoIcR7mlMHxAIMi/xTa7NKMq0v9GH4I7Sh4eY3k5Ej49AKHfm2WhBrZ
	 zFdwpdXq13UYD3yLqGWALbycZQlR86E/2Zh60l//F3MhQG5N9cOqzbSED1cb7DRFph
	 YSorHemYp0k2hNRni8HNQ/YOn7v+t2eQ52gN+2Arixd/yM74fNdA4UHYk0hvYKPwlB
	 7EUuXzMsZiZtYKYTUZL5OGQVTQSi4+StmBf6Y0+64aBKX8BqmHga4BqUeEqvBuQuk8
	 fXH5sIOhbWAIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F39CBC4160E; Mon,  6 Apr 2026 11:36:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 11:36:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-OeTCe2TbgZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #13 from manauer.uel@gmail.com ---
Created attachment 309833
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309833&action=3Dedit
dmesg -W with connection through Thunderbolt 2 dongle plugged in udev-rule =
off

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
