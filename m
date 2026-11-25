Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645095;
	b=xGNc+o80ye0+O0IVAjcaYJsKDIPbZMBZZfoT6aalV9e57XdRwVRLfBTyD/n5hz/OO4PN
	 DvBSvjlzSUJ3x/CZJ4vg8tLtb0m8fxyBIsRhfR1ZvSLsXe095O1DxpNe8agvrM63TjuGl
	 lxtifg6xiyTDBRCmWPA5ao0HY+vhD9rFuKB2QvXCx5lcQJyuzgIjUXfNfGqjeTKqmdP21
	 vV3RVruU912gYI9In/O//tbQNvJ6bcYfguzLlwkhpz7AfpUUJt2R2ydWipl4RPsLgd3Sx
	 G6S5HAq9FP+Y+h39H0ST3goa54iuvU6bKdA8zKdFL73j87lh+Ikv1h+rZso56pREKrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645095;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=FwFnp70dktCTh7OKfyNRBraYhgbH+5esRdFPTcl+LGY=;
	b=XlZEw/+cA633CVpQgWUxEczEEvtJK+V1OSS/57VfpAlLMSO1gL4gIJVSe/BUtQnlkz8W
	 aipa3+CpMlDm8AxfjdTc/Yv0FW9xbcg9af0yypxaSqmn+ogfzrKu+jhnhv++uEQOfkaDD
	 u4CIP3WVdKt0st0OPOdibprOq+eUl1IhSuq/Nft/Z+baI15R1nM/plu2wZ+yd+/7xq64x
	 N+McfXAwpycYw2o6aX36enUsO2Sq5KC3ffOUW6rfqYyyjV5RH00BHZv5e9kUIqKABNeed
	 yBctDKcJTdzDM+jlS7n4v1ePgcG8CltggnbZxOBeDG00UjyHn6c9yq2Pv+zqnOezm5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4Lkt6vp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1B606A688
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4Lkt6vp
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10C191F000CF
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645095;
	bh=FwFnp70dktCTh7OKfyNRBraYhgbH+5esRdFPTcl+LGY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=F4Lkt6vp42RIFVdjkbUtjAgQP8UG+LOE4hm3Ef2s2/KAcqdZs+VqC5H7/DA986O3A
	 vHTHVYpup8Hdxwnrl1NOXeNFr1T4qaQ7HtGSO5qaW6d1B1+9F1p6VaRWeUmNqmme17
	 9QgtDen1//UhYdX2Qtl2B59Xl2+oZAPEzI8jY3dNSaTPTZnVY3V2X5EgB3KHBjJLvo
	 oSc4b8eQVzOVFQ36R+Cv0BoKCRfXsFMhZU/kDMmBOG9gBvxnxQjMyklNiykgl9c7PR
	 dWadYJXYa4NDxsoDiy4SS34w3/AvWlbYYfnoK/pOkP4LeSdCZxuoeweTVoeqs7Yx7C
	 +DZee6iN2jyEw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 0D631240040D; Wed, 25 Nov 2026 22:18:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] xhci: ASMedia ASM2142/ASM3142 [1b21:2142] skips
 transfer event for bulk TRB before link TRB -> UVC stream (Elgato 4K X, 10
 Gbps) stalls with "not part of TD"
Date: Wed, 25 Nov 2026 22:18:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drastic-vivid-7557@shy.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222328-208809-6k7smdzUNV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222328-208809@https.bugzilla.kernel.org/>
References: <bug-222328-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222328

--- Comment #2 from drastic-vivid-7557@shy.email ---
(In reply to Micha=C5=82 Pecio from comment #1)
> Fascinating, the same happens on my ASM3142 with a 5gbps UVC capture devi=
ce,
> but I haven't seen it with other USB3 bulk IN devices. Typically for
> ASMedia, the bug is random (several TDs at 0x...fe0 succeed before the fi=
rst
> missing event is logged). Or maybe it happens if the unreported transfer =
was
> short?
>=20
> Patching uvcvideo to only submit one URB at a time (#define UVC_URBS 1)
> seems to fix it, but 2 URBs trigger it about as quickly as 5. Seems to
> happen faster if the device is behind a hub.
>=20
> Windows works differently, it uses Event Data TRBs so if the transfers do
> actually occur but IOC/ISP handling is broken, Windows won't notice. And
> there is never such a thing as a transfer TRB immediately before an
> unchained link.
>=20
> But implementing EDs properly seems like a bit of work; I think I will try
> some hacks like padding the ring with NOPs before the link...
>=20
> I haven't seen this on ASM1142 and Promontory yet.

Thanks for looking into this.

A few details from my side, in case they help:
- The Elgato is plugged directly into the ASM3142 card's port, not behind a
hub.
- It also stalls when it enumerates at 5 Gbps (0fd9:009c), not just at 10 G=
bps.
- In my trace, all completed bulk TDs were full length (16384/16384, apart =
from
one 16104), so I can't tell
  whether the unreported one was short.
- The same Elgato works normally on the board's AMD (Promontory/Matisse) po=
rts.

I'm on Bazzite (immutable Fedora), so testing a custom kernel is harder for=
 me,
but I'm happy to test a patch if there's a practical way.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
