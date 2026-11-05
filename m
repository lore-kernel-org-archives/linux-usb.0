Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900497;
	b=Ub7xncu+8MgmJy+u0HWcEYdA7g4UODRUrz04pKmND+XKfsRGTrAzOiOo9nwF8kn1vERA
	 vJXCL8fUmUTPkmGFgR9D7P7UwrYXMhGOXmwfBbnL1fH3IQN/v+jds9IyMp9EzObuvMbt3
	 5MjDRWUad8NDMSI78vSIhuCpvhAOBDOugToRY+CigcODWaH3S1YXQ1jPgNSXTwGHI+Gvr
	 aRrIHLz+NzEeVJmlm9NlBIyR8jwPyeYtkdeLJrU0v0+dSYnLYTAttmKTmWtVLgO14aCrb
	 BWpJ0Q64Hpmoz1T1vr037ugRYPBgF1F1daWJOLRqqAPEgZNmhKCqclzgI678m6YB0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900497;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I1nPEKv/AY/pBIZ08sN4hZakyIgkgfaODIzxYTOPL4k=;
	b=fg6V0wyocDsj8nOKvy7SCgSNa3k+DG5bl4X862LC4EpDHzXa2E0tFSgogpjXr9KWgfs7
	 zVB/KvajEbDYGstMa/txZIn9XRVdRXDVmW2+7DX78Ge7FAA7y+48oQgdbIriK4tk7XiX2
	 NbmZ7p7HJqEzivAB6Z3LOT8HhO/BeKgmybEvXbgBWphLG4M0v/x4qkwd6jY9yrba8crPr
	 HSuft5RIqPYNPIUr4NQgFGEEeIIQz5xPsf1OTIS195mZH3x6kM+aYWqllx+RXweCrD8UR
	 F9/NQ65P+p2/oAwM5pd5Iuv4XYOkcts2LdAOzYHwG+pegijQKQxmv9tiXdi2xQ253Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z/UImBZp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C5606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z/UImBZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBEA1F000C1;
	Thu,  5 Nov 2026 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793900497;
	bh=I1nPEKv/AY/pBIZ08sN4hZakyIgkgfaODIzxYTOPL4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/UImBZpkKWHCs9rhAeBjbHdIzrfDFaUe9EdyklntJgwts1SM/gbzO0LKwjU3asgs
	 u3ZqJLrYhuHz+uFb7vNj7qifHGO72L3GgIkDFmJe5KwH/hOOe6E8KwDJ/ek6XH7pUD
	 mO005ZvMdWtuomU4Ss/eBm4ttw7qUB6Ra8Ye+LYrybaKinYC8hk7QQHcbtgzNSz9EE
	 UJlzlkU1mFq1TWNMXriZXQeCDzeMMNysrgy5XHq3VZ8dAKPWU363G7lXPerwOZgm5E
	 SPYTUxujF5f7kVNqRe+IrK6LDGRIngYIx4M/f3bDtQBIweDDVd42USL0PFTN9Y55HK
	 8xQDXkAZPayHQ==
Message-ID: <sashiko-outbox-199650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: usbfs: Require claiming a hub interface for hub
 class requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>
References: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
 <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:41:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> check_ctrlrecip() requires the matching interface to be claimed for
> requests addressed to an interface or an endpoint, but requests
> addressed to the device or to a port are passed through without any
> check.  For a hub that means userspace can send hub class requests
> through usbfs without claiming the hub interface, while the hub driver
> owns the ports.  Port requests use USB_RT_PORT, whose recipient is
> USB_RECIP_OTHER, and SetPortFeature(PORT_SUSPEND) is one of them.
>=20
> That is more than a policy question.  The request goes to the HCD, and
> it can run concurrently with userspace releasing the hub interface
> through USBDEVFS_DISCONNECT_CLAIM, which unbinds the hub driver and
> disconnects the devices behind it.  xhci_hcd tracks the device behind
> each port and issues stop endpoint commands for it in its port suspend
> path, and it ended up reading a freed xhci_virt_device.
>=20
> Require interface 0 to be claimed for every non-GET request to a hub.
> The hub driver matches devices by device class or by interface class,
> but a hub has a single interface either way, and that is the one the
> driver holds.
>=20
> Userspace can no longer change port settings while the hub driver is
> bound.  USBDEVFS_CLAIM_PORT hands over the device behind a port, not the
> port itself, so a request that pokes port state is not safe for a
> claimed port either.  Programs that used to do this have to unbind the
> hub driver first.
>=20
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105172336.2630=
7-1-25031212351@stu.xidian.edu.cn?part=3D1

