Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820274;
	b=xBfHEOx7fKsC2xiZVOfMEGXWR/o4rBw4upM1g9T/EF5Gd9SVa7j8a5jHyXKhW1MewI01
	 HPdaWyJAEOXPuwHRlfrEvm61LvCMKm/JXfSXwsD2ET7RXHTq9X5qIfBtak5+c/IuqWNFj
	 5seYOB97l4GDgAIHKPviiCRdFVm2LwA8dvEvfEbMiwAte6o2RDO+8kMnjLxwo1P6mCzC+
	 lcML4FnofEoUwkwUb0D5Br/QUqJgmfTbHDe7tQkwe1gHEDQObpbA7syYHm9WfHFNZq0WZ
	 uHPc6ZmzA97zP0551EIxVfMzAEAIFNutNO50Do/YxrxgnvpENGHmonMLRGtObj7uepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820274;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=g2PlMGG47VHyc8PcF/V4L5emQ9jb3Xguf9UidAlmWV8=;
	b=L84RKXpDvXGTkm5gkH3SOiBxzgT8ZJOvz3Mh9gJUx/++CYHU6XQ41op9K0i4QRGgastj
	 9X7Iv0aIakGt5ztK1tmf9B4H+ZUo4T8mnEF1jywE0JWqB1OAITOSVQOAIUbDDbSSGo9px
	 XfPbzJ6a6FHFXmPW8J+WSfiQ+3kCQeMYoTROrSt1HEL/VfsBW/Hxm//Oy/5xDTvrLL9Rv
	 G/zIxCLF7BA8R2NZKIZ0Wkj5EaVUSqXH0h1cKlppIiXLredujOsAKENdfAVqbHYXNeAXS
	 jpoz3c6lcrNpWZ1pmWiPqcm5wUMMwLPZZnhHkc2hkP3uUhHE2/FX81YptIVnZdoEiXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kULminIe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E25607CCAF
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kULminIe
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F0E71F00919
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 19:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820274;
	bh=g2PlMGG47VHyc8PcF/V4L5emQ9jb3Xguf9UidAlmWV8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kULminIeHrzspwx5BDRLBEXKPqB4k9NXsxvP/OQlKMIngwSIMl/IJGl1KsbCvPqVm
	 EajDleJXdCPBLB5PIMqLHtNxa7LQhjIZXoCgFZz3O09pKTO62p+J0IaQY5Y0u5GDKD
	 0SKGAqE/EvgTOdb4LX0ORZB1WtCQtmN7kt/6t/5N/eLWS3yLXl9j3WtNPJlfMAozY/
	 uP9dfibze4WGGrCSBk1PYi+zNNlRNJqdiuwpGvruAwRbitPt/+zxUyLUvM2KvE7lDv
	 6Xtmn5URXYqbEJWZ+qKAwn73yCcVpNxCCvslk6y68mmVcgBb6xNHHhTXBCaFkRBybs
	 BEH8zPkXu6cVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 20B58C41612; Wed,  4 Nov 2026 19:24:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIyMzNdIEpPTUFBIEtCNjE2ICgwOTNmOjI0NTcpIHRy?=
 =?UTF-8?B?YWNrYmFsbCBub3Qgd29ya2luZyBvdmVyIDIuNCBHSHogZG9uZ2xlIOKAlCBo?=
 =?UTF-8?B?aWQtbXVsdGl0b3VjaCBjbGFpbXMgZGV2aWNlIGluY29ycmVjdGx5IChISURf?=
 =?UTF-8?B?REdfQlVUVE9OVFlQRSBvdXQgb2YgcmFuZ2Up?=
Date: Wed, 04 Nov 2026 19:24:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tyagivibhor111@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222233-208809-7rQenOuWzV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222233-208809@https.bugzilla.kernel.org/>
References: <bug-222233-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222233

Vibhortyagii (tyagivibhor111@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tyagivibhor111@gmail.com

--- Comment #1 from Vibhortyagii (tyagivibhor111@gmail.com) ---
Hi,

I=E2=80=99m interested in investigating the HID multitouch device-matching =
problem.

Is anyone currently working on a fix for this issue? If not, would it be ok=
ay
for me to investigate it and work on a potential solution?

I=E2=80=99d be happy to study the relevant driver code and submit a patch f=
or review.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
