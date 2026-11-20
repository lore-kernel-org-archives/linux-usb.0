Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178547;
	b=lnYpthTZo23HVhZzJwedvLuBNzk6LVjOmueBiAODTVZgMQup/QE4JoNuaadDqHMLuTpl
	 K167S3zmN8dgsp2aLhrpDsueDZd7MublrQWoX73gYPzkSQm+LqWcr905L0mKE2dRfVYSM
	 hZnmPIbFxRgtB7IIEPxRQXpx9AX8JJclJOI++NidJNGhgi3r75+J/Sm6fLjj5vZWh7LwA
	 WSgdL8IZcTZVvW1Bz/zSylG1zbNgkMs9HHmR5zUjAm5gPKeeWyio7kigwypO6onNLqdpn
	 WwVpGl2y4ZQJmArSXwKO0WoljqFiJoBnei5ehkPfi4xw1l3wAfnJVQOwgXy57473c6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178547;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=HHjYEI96VPnPa2e/QBrTr9gTjhNNL0jy8iDR4jsoU9Q=;
	b=SDwdjRwUi99febr0pFrqAZGFzVfT9Vgi+AT1RKuPK5k8UXL9VWrxBLYGdticNwEBfX0I
	 eAXTjPXV4TzX3vq/72JAouE56/yJwavzvr159BPrESzLN6Fz4kTtNTvSHkmPy3NiHQtgd
	 zbKU7IrUetLP5Us1kzfa+Ya1v2No3kltqV6kndCKkFU/ahBqPlUlco5g0FfX8JqdH7DCv
	 Rad7REIHmxpQhRH0gu6BNWQAdtuX2pM0SbCUeW2kUbD5cjKSYxNxfeWMLv8w08vFrpndA
	 C41/34V56uw9lq5u4Xpvfi6RXS66Aj49vm48A6eYZ48upSnm0nVe+LYroLdTAzpZWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ul83CSTr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F612606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ul83CSTr
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BAEC1F000CF
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178546;
	bh=HHjYEI96VPnPa2e/QBrTr9gTjhNNL0jy8iDR4jsoU9Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ul83CSTrSH1nSrDUb+dwOpwyX/2b1ao5bU0bWhz83kqRL5HANcFwil58c1ZFgy96h
	 tWe11THUHoxN5k1ujULofZ1Bu/x2T9rdK4Sx2YLjUT3mn6p6mZYChRDfkM5cGSiv20
	 uh5D3aI10iDjkOrAyfgs9lqUp58FqcC8XDoyBPtahCA7O6BP4tJzWjN+CaLp+LVNtP
	 wjqgCQPQSpwws7VsmkdKz/78pUCXmNa+ghrVqo37GUNbg0H7wTuytP9hjEpKjCFa7M
	 Q+s6VtzueNE2DRih596WNei3AsXufzfn2OWetIzqqDD64w/IFvL8PxIDW6WNn07fEL
	 WZ2G/4Q6ZeTUg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 77D95240040F; Fri, 20 Nov 2026 12:42:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222298] hid-steelseries-arctis kernel module not working for
 SteelSeries Arctis 7 1038:12ad
Date: Fri, 20 Nov 2026 12:42:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@michaelgronbak.dk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222298-208809-Cxc7x30Zx4@https.bugzilla.kernel.org/>
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

--- Comment #2 from tux_0xc0de (linux@michaelgronbak.dk) ---
Hi,

The Headset has been in use for 4 years now without any USB problems.

The problem started 1-1=C2=BD month ago and looking at the kernel driver tr=
ee it
looks like the hid_steelseries_arctis kernel module it was introduced as a =
self
contained driver not long ago matching the time when my headset started to =
have
problems. Further, removing the LKM the problem goes away and the USB driver
stays in the kernel as an active driver.

Thus, connecting the dots it looks like the introduction of
hid_steelseries_arctis driver module also introduced the problem maintaining
the hid_steelseries_arctis active in the kernel.

/m



Afsendt med Proton Mail sikker e-mail.

fredag den 20. november 2026 kl. 11:38, skrev bugzilla-daemon@kernel.org
<bugzilla-daemon@kernel.org>:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D222298
>=20
> Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                  CC|                            |michal.pecio@gmail.com
>=20
> --- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
> (In reply to tux_0xc0de from comment #0)
> > The problem is gone if not using LKM: hid_steelseries_arctis
> >
> > The problem has bee around for a while now (1-2 months) and is currently
> > present in Arch Linux kernel version:
> >
> > ArchLinuxDesktopPC 7.3.4-arch1-2 #1 SMP PREEMPT_DYNAMIC Thu, 12 Nov 2026
> > 20:11:37 +0000 x86_64 GNU/Linux
>=20
> Did it work in earlier kernels or is this new HW you got 2 months ago?
> If it worked, did the offending driver exist in earlier kernels?
>=20
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> You reported the bug.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
