Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A2357A3E
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804841; cv=none; b=cTGJix3RqrPjp8t93M2LlqDEY3KuSJnGsW97KP9/xY8TakDVgBWXSf2GUYJApxOmrYJDiJqCOwsK1no+JWiNv2DqXdUXBekdsAAp45gxeYOgCESSOfJzjj42ke6LAXB6nu/AWsEZmBksVpNC6hQyzRtr/3yVe7+rlCk+HgxCQ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804841; c=relaxed/simple;
	bh=SdKDX79wEX3XlhaMyEpM0bu3ohYg7cWR/Eci5cjz3II=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N5xN6M7SUyT/ELxbahlfkVicyCfz+7AOp1EfKx6HtN6bRSqofFCeuz6ZvOTzQmgnY1bc/skqbshDOZWApbydWhp1nQ4uhOrVzzx+BBjIJQW/z61p9hZZF7RXfinkXCx7bsx1PucOr/0ZnlY61W7IWhS/S2PewCZSCEUYoZu0vdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYC/kCd7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYC/kCd7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB396C2BCB9
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789804840;
	bh=SdKDX79wEX3XlhaMyEpM0bu3ohYg7cWR/Eci5cjz3II=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HYC/kCd7a2uYlgCqE/MFDuyfgoQVlSYihgJ+9fWlxeXhKA+i8SXlZMjNEaxpou/vR
	 MHnPRBn4lVcvn34ChrHzIWsqWSRevxGZO1IJ5ZYvVhyjd+NMSc1YbrtZCGLz27p7Xv
	 lisNLj5BY0bDt0MJK+/EMyAPHNyAHon/KPdOSBOXO7nQ3R3WyHiHR4ZVLVOK3kabUT
	 KbE2HjAXZjAV3B+SYZNEk9I7pYnoV1uEkbrZiFyp7VQthivN5zu6uzuDRCDUMz5Oqi
	 t1GUene4gEO31LC8hwY67vMqMs617IQaLjNjZPRX5vB7Lm74JLnGwqIVBrvae4prwf
	 gmGeM0AHzYbFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C453FC41613; Sat, 19 Sep 2026 08:00:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Sat, 19 Sep 2026 08:00:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: splint.em85@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222021-208809-YgVCDOODRI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222021-208809@https.bugzilla.kernel.org/>
References: <bug-222021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

--- Comment #4 from SpliNter (splint.em85@gmail.com) ---
Thanks for the reply! Ill test it as soon as I can.Regarding bios/firmware
updates: no updates where done before the bug appeared.
-------- Urspr=C3=BCngliche Nachricht --------Von: bugzilla-daemon@kernel.o=
rg Datum:
18.09.26  18:20  (GMT+01:00) An: splint.em85@gmail.com Betreff: [Bug 222021]
Not cha https://bugzilla.kernel.org/show_bug.cgi?id=3D222021--- Comment #3 =
from
Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---Created attachment 310869=
=C2=A0
--> https://bugzilla.kernel.org/attachment.cgi?id=3D310869&action=3DeditRes=
et if
Error-- You may reply to this email to add a comment.You are receiving this
mail because:You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
