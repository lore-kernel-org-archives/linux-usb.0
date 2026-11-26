Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652841;
	b=5WcyhiZ5DoIduYPzX77wKlEjWXyMVADUFQuNWZIbJQiQTmglFHkD1SwO2ppXC44O2ROe
	 b2n0iCDtKU1gQFbjiq4H6G9SRwY3oCLaa6ekD9NuxSFpfkVyWonbMuBlEFGxfxh3KPVac
	 fyvgeJxSgoTSpgg+lweg3iOQVnra9ZM35c4uAFnzBGqI2Aooe5f6x5kZ6loSCnSjb6ori
	 gxVJX5IVa5x/YCtSGvQ2tEjJCKGLe1ddkD+OrpXZCZmzTlq3vB1QoW1J5nQaj06e3Dcur
	 tJDaz9oLbXPCuzbx71yUN15w3qNUH6J1lAWH1Lg+ND2CBYjiI45/RhNx8RNW9qhkvUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rWV49O+hgV8HyYRF6sT+mj/CtiBnUdkiag8WoNO2YbM=;
	b=EASIKiEZNzplMOsYCpDNlE0UZVmHeiUE6iOh/ljTvxj2ZkdPGKunEvRUuyzJH9cgl7zp
	 vCT/X19Bp/lytQEhwbdZR+kjXD/rR382EgXQWfq+MDyLkoELA8BaX9r55LrrOznIDcsqU
	 XFT+VyEWh1thwX+Rk7y/8LUFmod90LQd/X0bkmSSFGNeSZn/mI83J5LUCE65zIBEkKj4e
	 4iF57Ws4vve1MU0Lib6khh5yajaBGxhqcww0iQCTyJK1SGdLNoZ2XStq0/hw1SWEl/okj
	 LQH+3w1Pf8saGdVVft281pDafH5a8XH9Bt1ZmCwmIo75dBFQWn5LbGi1j41GHQfEbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TN3qlJBm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F1606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TN3qlJBm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9B51F000C4;
	Thu, 26 Nov 2026 00:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795652840;
	bh=rWV49O+hgV8HyYRF6sT+mj/CtiBnUdkiag8WoNO2YbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TN3qlJBmxpRGFpEUlIqCFnNBL/hMmJmzBoW9lg39WXmhjyFbYwem4KRj+sju2gsdh
	 fruS+fhU133MRsfYfOHvEVsfIqMYuFQaDoXhQP5wSWyhvzTk4OOgTHswVwkANm9kVI
	 GP/H3RBhpZqQheVCPn2Ijq0HlsKDNqchmanLmuvW2GXvzW6ZYvsbO9u27HddmnaGWk
	 fuLRK9bINIls4hdaW1yAZIRQqTVfnc3ro3Z2DTcdOopHsBVmdfzaqV6shszIvdB9Kn
	 GSWAusJBUJRZEv/ZM9jwaDH93FCpyU8/iZG9G1RAPUE0ZuQB0klSzu31CtIKREhX83
	 45Q+nJjH6yQdA==
Message-ID: <sashiko-outbox-234475@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] usb: xhci-pci: resume Lunar Lake xHC before system
 suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Kim" <dialogbox@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126002006.25823-1-dialogbox@gmail.com>
References: <CANb8v8EGmQf90hRvr8cE3vTKOOY8b6LTxki1uORW_TJ9HadrZw@mail.gmail.com>
 <20261126002006.25823-1-dialogbox@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:27:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On a ThinkPad T14s Gen 6 (Lunar Lake), suspend-to-idle often fails to
> reach S0ix when the PCH xHC (8086:a87d) is runtime-suspended when the
> system suspend starts. The Intel PMT counters show the PCH blocking
> package C6 (PREVENT_PKGC6_CHIPSET_1/2) for the whole sleep period, and
> the package stays in PC2. No LPS0 constraint is reported as unmet.
>=20
> A runtime-suspended PCI host controller is runtime-resumed by
> pci_pm_suspend() and then suspended again, so it goes through a
> D3hot -> D0 -> D3hot cycle in the middle of the system suspend
> transition. If the controller is kept active until the transition
> starts (power/control set to "on"), S0ix is reached reliably.
>=20
> Add an HCD flag that makes hcd_pci_prepare() runtime-resume the
> controller before any device is suspended, and set it for the Lunar
> Lake xHC through a new quirk. The PM core holds a runtime PM reference
> [ ... ]
> the tests above on my machine.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222281
> Link: https://lore.kernel.org/linux-usb/CANb8v8EGmQf90hRvr8cE3vTKOOY8b6LT=
xki1uORW_TJ9HadrZw@mail.gmail.com/
> Signed-off-by: Jason Kim <dialogbox@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126002006.2582=
3-1-dialogbox@gmail.com?part=3D1
