Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633867;
	b=aN0fOWPM0UYe2Yisz90FbkcVj8TIBhl4uidYkpQExgonT/u1WtZX2s10Y0013brkMTh4
	 GcuPkvvFtXXWyoh0n/R+308gzPfIxLjf0hdNYNmmtJWWMU27HYLbcMuCeH5unHdccJpUb
	 rWX570JBxNSMWnHuwJYGJzhdxJTQtv10SsskK9HXJ77E3m94QOCS37j+kwHthcAdqTo27
	 QcSb3UBJFi0+PAbvLeH6d80xcWMsYxRWoUibfm65D8u/9RPS4WtE9huYhP1+/4X87vl2x
	 i6kCGKS0laX2Z6vjiGadkx6PoRfOdiJ9luUjic5knqb+cU6cTP1+BRZGQrD1H5/tWnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633867;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d6vpA+4rmghwgEwVQaaZ+k005NN+eVSYCiLeGLOIT20=;
	b=mc9UO3MaRM6JePTGBdEdrWMpQ0tY00fqvub0diLSwlNQwe4TfbygBLIMt0tTsYE47K+G
	 zjcxHMim6F/NGTIOrMQkyJuVLWC0Vy7mqzgcjM+Dm85zFw/c5+jSMtcKixbTKPdrrhUVG
	 7XtgN1EmwrJLVUBaV8jWueIH9Xe6V5pz+FsRKHqNsjjI/a6SRBhKnwVi8bpxYBoy+Eihm
	 Mrv7biMK4YELmKv2nP5DtEc8HMWv00a/ISY0kARe2TEiteFKB4zVmyZAdjNZ2kjZ2XMvp
	 i7ZsOvxXKwxFllJY8t61ULbEm/TxYM2bHh0iUKjdFiYfcfdQvDa05G+jDjbrB0UzkSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWF7QKqg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6BC606A330
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWF7QKqg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB561F000C4;
	Sat, 14 Nov 2026 05:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794633867;
	bh=d6vpA+4rmghwgEwVQaaZ+k005NN+eVSYCiLeGLOIT20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iWF7QKqgmtTPrnfnkpYUSK2uYwbisg0op2GTdnRpQSaGID0kPqpEdUwiyIoO3jS4H
	 mB9nrvuEv5PqsrlK0SnqS9Ilrp24f4eWk3HyVE9gzFX0v8JY3PRn6RY40711YW4Ep3
	 8538idJ/3EzynqalvJpPnwVHzHQ+7H8plS7pSoom3ul9cx+0TRbIc2h6TJ98dVPo16
	 27R8o3T7tQb9zIdw9bH5SrKce+L4aJasi3wmK6te9W33CnUdWZUMtf8JLgfgUuQwJq
	 C+1yGMGaHfvE493u7S+Ad3hPjBkKZv3Q4hBXrH+pvsJ8pwSwnlGBxaVjeNoQi8zbHS
	 Vm9S5G9dWYkgw==
Message-ID: <sashiko-outbox-214173@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion
 exists
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114051653.1353346-1-william@wkennington.com>
References: <20261114051653.1353346-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 05:24:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
>=20
> Check during ehci_setup() whether HCSPARAMS reports zero companions
> (HCS_N_CC =3D=3D 0), both CONFIG_USB_OHCI_HCD and CONFIG_USB_UHCI_HCD are
> disabled in Kconfig (such as in aspeed_g4_defconfig,
> aspeed_g5_defconfig, and BMC builds without UHCI or OHCI), or a Device
> Tree companion phandle points to a disabled node. Runtime companion
> binding is intentionally not checked at setup time so modular or
> later-probing companion drivers still receive handoffs.
>=20
> When no companion is available, set ehci->no_companion to skip
> PORT_OWNER handoffs and omit the companion sysfs attribute, matching
> the integrated-TT path so usbcore keeps port ownership on EHCI. USB 1.1
> full- and low-speed devices still cannot enumerate without an
> integrated TT or companion controller and will fail usbcore's normal
> reset retries instead of triggering a PORT_OWNER handoff.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114051653.1353=
346-1-william@wkennington.com?part=3D1

