Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562606;
	b=nU35kC4PH/wQrbGpZFzlSm0eo56+g55Xu2CiqUjWXEt36iNoXBeS5a3dRKkuMfHBhuu8
	 FGKM9MyGDSMeM1FsZx8rma01VlXo95C9nSqmF68NuFYT66wQV3zyB6kJU7LAx5R/z3L6k
	 JFAlDtN65D652XRQu039HD4F5mDpy75fpQwFpH7uPAbTdcVWHsVsv2LIX/76TWz4JgPas
	 sae5tWqvCCrjZUhDKBBwYI7QrkyG6k7L8AVioyKOgJcVdCh5jMrzBRDMVurSOD8h6HvnZ
	 EZDlqJt1o3+hYVRrx/t0RTLOpaqQ+e/I+AzcYVI3owbhTx9I3gWEL0Ifc0cM145BeOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/6YqcQt44Py/FasYsJhMneYdiv4WQJsxhKQjwiKKoH0=;
	b=MWA7B3wdYCkDzSfZaoT+f1PURXIMryZr/io2a+WYK+6s4xwsQcidWADaAW47grEUzbDv
	 CcVR39lvqBa1PGMz1vOkB4xs6lM1QgU2rYTrT9E2mkA10Hz8/C0SCYVeWMK24Jfb/ZCJV
	 m2hga3SoRpG/8+7BCnCEhLP/N5efBYOOs2D45R8Bny/3xHeoG6oMWjjpv1pu6A4OYxfmx
	 yz23llzjwOjUGGAsFxX5oiftcnlG4G+8KkEAGCgJBFmGHUWDZjaX1/wAa/WrkvNy8fdSl
	 Nm+L4psD7HDJ4iBPfl58ai1zA4HLbZcBWkZtDDsBTyai6rxEtCoH6QzMLrihgP9VlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PJ/kvP6q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A79760A2618
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJ/kvP6q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA82E1F000CB;
	Fri, 13 Nov 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562605;
	bh=/6YqcQt44Py/FasYsJhMneYdiv4WQJsxhKQjwiKKoH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJ/kvP6quhaBTNUglqV0CDNYyrQh5+swNAYzkZNbceRUTSmqDtVFMgpuYcPcrAg6e
	 txCjsyNl5MbZGyIHr3dVFbFB0tAO03MPV84kvM4sMGmKUffmaTUpYL6epbrMy74TBS
	 KE7JVdNnJE1KJHSLymbYukkeOjLFAuIGoromtMhOUCoHV6KR5yhz6yr1w+zWN2AyMi
	 twKaFZUpD8Jk69aiqiV+qz3mJTsWMiT4X9uPX73WasvMPnqrLFaE7Zo9UtaBRgt/YQ
	 iK6OorLT4VEQ9bYMbPca8c4P6nvImFhTRBvIt++Fal+rF9fgOKVNHM4/lIopvEi4gk
	 EFCVOaN0KlaqA==
Message-ID: <sashiko-outbox-212558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:36:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A gadget driver deactivates the gadget through usb_gadget_deactivate()
> until its functions are ready, so the deactivation means nothing to the
> next driver. Yet the UDC core keeps gadget->deactivated set across
> unbind. Only configfs resets it, from its own unbind callback and
> without connect_lock, so a legacy gadget driver that unbinds while
> deactivated leaves the next driver unable to connect.
>=20
> Clear the flag under connect_lock once the driver has unbound, including
> when the bind fails after the driver has deactivated the gadget.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-udc-connec=
t-v2-0-f51b11f07eb8@flipper.net?part=3D2

