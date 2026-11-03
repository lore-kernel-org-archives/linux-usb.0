Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750316;
	b=pbv33I8WSMXqYEF0LgXIfFmvEMI1yHqNJtK1RYtC9+Sggk4RJ+3PPU8dIEMjLoED+Czu
	 YfJw/Qdt8hp6kt8EQeetgbFCE97fhb586W8NHOrHwlXZhYPYsm8YRiBRmYQQ/vSUl9RDt
	 jc6GDrgqQkJ+YHzTtd7Cge0EVJjke1nZ/MEC7g+3A47b9IfJaGDJ1G+8MzoWY+x+oHk8s
	 NTxBWoxNQgIyl2aywWaFGeFGioAQ+hKZGmJ6BNPzivoooIqTFvy5NcReRNeKWRDA28ePY
	 fQZVSLOxSA15fBE9JcBI0ptoyv0wWdQz+RqOZ/Ag27keQD07+SFkWzr2JmUWGcEbb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750316;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u3x4IJwmEfZdo/VWYf44cZw5SkMmRBiP/g0e8LHxDSk=;
	b=MJybRSljNcEdIhXIbRwmIv+/7kNzTzfcEuXsP/kpA4alo6/E5gCG6MYrlXBwUE7teiqQ
	 CphMW7utB+12xVCF3irFQkke+rDc4rma9s0smXHk72BcTH0KGQ79RlHgsXhRfdV44yNQs
	 xDRVqC6uI04LCa77YHobCcw+UZfCXhkQ0dLZXj1fYOc5GRQ3cOkAlY8fXOulyDsz6dXUF
	 COtJGczY562++X9ljCPiIJMTfJTFPlQnLUOquutpClXs284UgNEH2F+LmfOjGcCni4OYZ
	 zMxL9t0lsFdXOXvzoNysQ9+9cE5p4qXr+VJStvLI97dspkm4LwxJPrlF4xxVKP1ICTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOHCouIK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1667606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOHCouIK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDCA1F00919;
	Tue,  3 Nov 2026 23:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750315;
	bh=u3x4IJwmEfZdo/VWYf44cZw5SkMmRBiP/g0e8LHxDSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fOHCouIK4Bd5j3aZWN+HEqFBJLjyYFeRtzFL2l0qOneRMxLBj4oLs5Rzx6DwXA/Dz
	 6MzWLM+CZQD/RNKQS4W/xXqiBFefPIZadE130XfBLr8ClcQ51tTU3BOmQi3efdqE9I
	 uL91G5EKewXoaTzUw9uB+HewkrdSCBs1+ANlCmud5DCbSOn2U4j0MRmKhzvlnGZHtw
	 lFjVzD634Uqyl3voqVOcWW/ml35sloZ5wmtfPbEei9eGCRM4PsXJY/BNoOK5XHc2rv
	 8q8s/6YykNlMJyuJbln50NOUbUN7yMmplruMWIniDYEONBc9/79sHzSxOhvsQg35pM
	 ArvkzeUfDmGNg==
Message-ID: <sashiko-outbox-196262@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE when usb_reset_device()
 succeeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabien Sanglard" <sanglardf@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103235115.3991801-1-sanglardf@google.com>
References: <20261103235115.3991801-1-sanglardf@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 23:58:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When usb_reset_device() succeeds without re-enumerating the device,
> userspace receives no device-level uevent indicating that the reset has
> completed. For usbfs clients such as adb, usb_forced_unbind_intf()
> unbinds the interface before the port reset, and device_attach() leaves
> it unbound afterward because no kernel driver matches.
>=20
> Since usbfs suppresses uevents on interface claim/release, userspace
> receives UNBIND(intf) before the reset and no event when the device is
> ready to be re-claimed, forcing it to fall back to polling /dev/bus/usb.
>=20
> Emit KOBJ_CHANGE on &udev->dev.kobj in usb_reset_device() when the reset
> succeeds, after usb_unbind_and_rebind_marked_interfaces(udev), so
> userspace is notified (with DEVNAME) once the reset and all kernel
> interface rebinding are complete.
>=20
> Suggested-by: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Fabien Sanglard <sanglardf@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103235115.3991=
801-1-sanglardf@google.com?part=3D1

