Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957577;
	b=daz8A/9bDa/re+cId2AQ2pI0rSJaKoEtygFVdFdBVZz+zLRRPEpEBc0rYobTG50rtx5E
	 WSocp7QTtAV8HU3WLvv9L+m0Q+luUhj8mgBxHzmpx2+xI9uSNta5g0s3qe32dCk+ixuGC
	 zejIBlfARTpFWORJkSJn+DO9pbXFLa6JTFKfVekS4TYUk+BrRd/L0NRqMupuGop5KS4oU
	 Oju089hkgovWBo6teQbrmi1ejHsuBsSgbNDIElDN3+OvIU15m2HywVFYUo4u8pKRaASsK
	 kR7XifyYx/50ByDGmMYLZQIKC5zsJe7/F7bAXGeYeiLeRgaVHfFTxSlDuRFhm0QxMKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kgcd1AVU3iEDZrhKiymFS2bUKcvF0N/9gj2/J+XB3MI=;
	b=JLbbyIwFWeDu0txZh5hsMgxCWMGiMbGVP00ndJsRWcWoFyWhNG/6k12L87ircFcEQ4MF
	 xrida5w4o+sec5SFIxDVzca8Av2j23IhuRILYoErt00hl9QRQsuVYdu57nogIBusEDbbT
	 gbWICSAuTYNZpqBcCcBfsc1S61A2g0m0qZIutt28HkAe8kwFBG+EmaFT9FIIf/39fuqji
	 how4jYg6oKvjw2mf4t1JH9KhMEnEEdmY5jeOcusr3/YWvuRHpBQidD3s8gPnAzmeT6MRP
	 FSglC+4OkYQUcE89yV/AKqmNhELnoU4IlKWMBvt0DLtUVDZBbF+t+uigP8xVRxeJCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dOhDBbwG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4952606D832
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dOhDBbwG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6EE1F0089F;
	Fri,  6 Nov 2026 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957576;
	bh=kgcd1AVU3iEDZrhKiymFS2bUKcvF0N/9gj2/J+XB3MI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dOhDBbwG9mbhB5oegTNr7cvDy+vIIGyIOrb3NFuQKspHimVz0OH5gewEASv4DquXc
	 H4+ujp1YLKoKWLd5ITCIyBaWWJazluzUUqeY+yfpJvaNuioZzIAzgDYZMspf0K2CdR
	 KbFkQRq26cZR7/ME3rnxYs4Ku75QjcFRFH4wlG/25aWAKkHWia0Bk/68Dbhpuet6xs
	 F2NzLNGogGMQ7VKKn6A0cuL1HsqqPQFDPMYrZOphLkzRj7TheWbPOItupMmR4Y1rcF
	 tYI/JERny7zJRaE8N0J8KH1J43fED0tF+FVZglj9OdqeexbuSFb2pAC8YDS5Y2L5E3
	 JcDssVekKb0/g==
Message-ID: <sashiko-outbox-201113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: usbfs: Require claiming a hub interface for hub
 class requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
References: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
 <20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:32:56 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106091048.4056=
-1-25031212351@stu.xidian.edu.cn?part=3D1

