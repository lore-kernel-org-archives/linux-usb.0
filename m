Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89F1DE8BE
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997940; cv=none; b=pOXXl3Ip3CX5N9L5Fmk70o0Snju8YCgv3XuEu2414/9IaAe4a/oKyGcMDcBjOY8giy92x6K4Tyu3+wm4wShQ9Zj877H/R+gCb6brZ3zTaobgyNhcBm/XH/oQlq/EkIAFX6MdFq4QNe9nfhJMpC5sWPXXztj0ejqauASY9buVdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997940; c=relaxed/simple;
	bh=HUjl61smVeXfv6ezVjF1cnAb2a/VsqxT//+SR7gXHww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=do6PhiX3D0wT/MB7WkZYYV/MHBgM9mQzWaiFFg66fI76w2KJI3D8MVS8gnXdkbufuIohWm95hatVUDDIwY9qpvg8luem9Zsw5EcqvHiDog00lcwhXUUE0l6saGkqPGU+hlV5HpzXB6o+Lmpzy9KsXkmTTAlDHGGk78J56yth0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr65kUPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr65kUPn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C307DC2BCB8
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784997939;
	bh=HUjl61smVeXfv6ezVjF1cnAb2a/VsqxT//+SR7gXHww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dr65kUPnYVkUzqpk1HH82NyqSMBMbPT5W42yIkDvpjc1qGyXfbrIZmpQIvbKB1Iet
	 WqsnxaXApsRUdVhguahP4yRf9B0KR08VDtWTDzP5kqlHQZhV6ZXB4ay7xuPrNRhw9Z
	 IaiewxaGNxfrXXCiFkTbFFVPMnnXi4wyJfn8lvebt8srq8LBJ2luoNCi3frxbqZTOv
	 woJyruSHInvGi2cWR6g9mS8EV0qXL3sCUknFJi47aY0BaFRHKAlstc+QUx99CHD2iZ
	 pNBNufwEYEbdbZH9Cn2RxcG2cdmF7yby4diSIpRgN9dbo86mkGxNduAJOMob/DYltR
	 ODypALN4MNGvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94B53C3279F; Sat, 25 Jul 2026 16:45:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Sat, 25 Jul 2026 16:45:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221785-208809-Wy8burL2fU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #9 from lkorcm@gmail.com ---
Created attachment 310510
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310510&action=3Dedit
dmesg, kernel 7.1.5, USB4-entered state (reproduction)

Reproduced on 7.1.5 (Linux work 7.1.5-070105-generic #202607241434 SMP
PREEMPT_DYNAMIC Fri Jul 24 14:57:06 UTC 2026 x86_64): identical signature =
=E2=80=94
"Cannot enable" x4, attempt power cycle, unable to enumerate on the xHCI
companion port (usb5-port1), occurring in parallel with successful USB4
bring-up (Sonnet Echo 20 router and both retimers enumerated, this time on =
the
other domain/port). Fresh dmesg attached.

(Note: the usb-storage.quirks / rootdelay entries on the kernel cmdline rel=
ate
to an unrelated NS1081 USB enclosure used as the boot disk, not the dock.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
