Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171100;
	b=TlsgFbGBjov7Z3iLf6443lzou6+owFBrcsg+m5pN31M2/qblH5TGB18iW6OTt54ZA8Uz
	 A9wT7W9mz0nocaVoSrWdcm+TP5c9iTzzoTvQX+SZdho1JVrrN3BBsIvQNi5gwLwxNzUYi
	 WDB/saRNsnzHxqumgCtUkHfNAnottITfOpoSt6qaNGOHp5IXBNyAgVvdQxgZbX9SI0izK
	 bA8Y8jLcsWZ3UnVfHmUpxvi5CEqrpvq1q0UrJj1aTtIsiwLpdfTYz9vQq/iY68jRo0L7i
	 irRJyrgHwv5GnDcfE7rqA5gdms2o2E6MQRPSwav93WFwx6sryD3TfVeQJ0qXx1Me9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171100;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=91MZAfjYtCeVkaULckuIYwFRYuBTkT2ICQGFlVsinSc=;
	b=MDkhMQ6HarZLLGlYK/YEsLwNxhD3gJHRDw/6+OZheRUETqZAW2SPFA4lc4uOc2X5lWWU
	 X6FCB4klCRfVaYmfQUcw+ULePUUaQ54/M0KzAjsuXrLGpYIeasQ88boHnh/WNfskHPXj4
	 jEjdr50qcXUAKacvOQjZRC6RDVL9bdSGFzrtjszi23rlndaEl3CY9cgG4U82SUa5j9tLz
	 yPSy1o0j4eAsP80lDPq8JakKrl3bP5cRoGTOiCigUZPcmQKrZxmT9shFg64LbgtanAWsk
	 iIHrgj9NF9MfBiKheyh02S2NcjCB+osfDLuBg5n9UMxG3t0nZeREILSJKkAmcCOo7uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoXufV9L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE6606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoXufV9L
Received: by smtp.kernel.org (Postfix) with ESMTPS id B324D1F000CA
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171099;
	bh=91MZAfjYtCeVkaULckuIYwFRYuBTkT2ICQGFlVsinSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HoXufV9L0POdkxWEekjo5d4q+4kEH7VhPu5kHBQ4Xylc8bWOwtFPXISrdbuSU5n6B
	 mw35P5x+A93I6PmHx+MumifRg9xGEsayXZ8bpkTCgJfSgQSpXUfKyvBsuN2iIpPwyx
	 L9ZfnYgf6cbSx0tWfr9c8kctCoiTd0hi7H1reb58RgZXwWah8xEfFoL6XWkWfgmQBH
	 ZpHNcpMk4Bg0zTVfsTqHzqFwPS5le9Xg5TS96ZWtiR7Qx1Y+oLf7/OnNKVpVdp9ymz
	 TCxVjoQdCGHNU7iCoVQdgUrF6JKmWUrRVyhWyarQzFVh9PvWo5Zt4fEaJwUZn9Sa8v
	 fiEdefIbXVj1w==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id AD5EC240040D; Fri, 20 Nov 2026 10:38:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222298] hid-steelseries-arctis kernel module not working for
 SteelSeries Arctis 7 1038:12ad
Date: Fri, 20 Nov 2026 10:38:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222298-208809-AW2B6lbq3N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222298-208809@https.bugzilla.kernel.org/>
References: <bug-222298-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222298

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to tux_0xc0de from comment #0)
> The problem is gone if not using LKM: hid_steelseries_arctis
>=20
> The problem has bee around for a while now (1-2 months) and is currently
> present in Arch Linux kernel version:=20
>=20
> ArchLinuxDesktopPC 7.3.4-arch1-2 #1 SMP PREEMPT_DYNAMIC Thu, 12 Nov 2026
> 20:11:37 +0000 x86_64 GNU/Linux

Did it work in earlier kernels or is this new HW you got 2 months ago?
If it worked, did the offending driver exist in earlier kernels?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
