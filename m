Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810832;
	b=0w+SSBnfdb2FS8DyjTG9vqYaF67gbkiLVArmgkrVUB/1AmwAdTDNZQSpG/vUnkeB7WON
	 2Y2zEZ5nqcqoLRF9uYZArAFBBosOKb82+ojGCTGhZpmxh2gP2OXURbhqgDyKR/ui9Tnh2
	 UM/p9/ivUJznCsXutYHWLrGJ2fiRSXDdLcgM3O398Bljp9iDYkdEF6Q0PPD0Y4z3JyW6Z
	 9C/tjSJqh0glXl4+G/amz0xkgcJB4Reo1wU29Dhp7nv7LwjYP6o7qEuME8Gxi6Z/rpKet
	 elT/OXi+azYdem8jrfMiwXNB4+4xk5nQ55ei3O6+sz6Kp1qLkGmY2a3/QXe5/7HFGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kko9Pzuz6unJzUhwvoxAH1mE+aV07/udm8dB7UOjMOc=;
	b=zzM033T/TDlqew51FOPwPDBORpT+DuY8VFlvsUq2L9tTGg7yZ780U1Yav73/NeAiiu4V
	 4khZtRXm2DgC16pofVdm4qqZZxtRFfrMgXmloV2AwltvGQw0pGMwdVtDrdt28BjC2S1gU
	 EBCeyZy+p2Pbibd++/QfGg6is6JdJVwJ1+SFNnVu8ienjRKGMjpkk0oqDe+KfBWvTRlHt
	 lS6aPPxJiPqOlp7JOcJtkhk+UktV10fUfSZOFWbjHo/PGYNK51Pk6VO+d/yN+PDOhbFFH
	 dVnMo95O+ia39yO8+o+7wnwfIfJIWbRwcCb1zO6U3YcjG61moVkEWmc8+v5Wvfq/EMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1LA+TEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FF4606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1LA+TEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7FD1F000C4;
	Mon, 16 Nov 2026 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794810832;
	bh=Kko9Pzuz6unJzUhwvoxAH1mE+aV07/udm8dB7UOjMOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1LA+TEwqem4BXtyjVYZ41e3ZPLycJNO1MDNDb0axpDwUw3+Ccj8rEu4jME83zoGt
	 As+ddxITWCOULxcTaLtIvtme/Mmn8cTszKbNeG3KzTHm/AYxpjtMPo1VmVcAaw2Xuy
	 KeT1xzxYxqK32Ny3PS/z/0muyqzb3ueMCNRcO8WrKoVzX99B+Ak6kiXZlQ+c8C5ojR
	 1TGAjRNe150mSB9A1C+8jzaTJLSlKA2WB8obcKVBcEexCW2HP4v1/6McYORqu7LRVN
	 Ymwmi3auOBR/FAU7J5RG0EUU0MqLMvunPqYB59lBl4/ZBh08CMZ1+U98g0hsVQXM2P
	 yCwbSPYIV1wjA==
Message-ID: <sashiko-outbox-216281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbfs: reject SETINTERFACE while suspend is
 allowed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116060549.370140-1-teel4res@gmail.com>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:33:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
>=20
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
>=20
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116060549.3701=
40-1-teel4res@gmail.com?part=3D1

