Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637372;
	b=YUp22jEmPnnb2+a3Uh6U5Gh4u4pZyyPUJdnufgkJQXDgxSDTHJBL1cYOx+1wMA4ilWEg
	 XBf3p/G/abAY6+nzvPUAhUroou80D0Hi7Wr4VcwoUfEX55GWQjR2eJZO4ScKNDsY/Az0V
	 PdzzbiSDQp5EAgxlmMhRg6iSabMOdLPNB/r0I5E75xV2gpDnGyTRSPSWHBL1Zg9DNE/a0
	 1idlm2aVu0odzzeXo+KR02wZDddfwAGNWSO38jkFk14ikWKLV7fF401bI4mUgFvOGuBSg
	 0XcwhqsaZKAx+9hACm6Zm47CuYoPpKU6j/+2ILnQYYGM+N9V64R5AemSOiECjSJg5VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637372;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4x9Q59P0oCvcoXH7BhQNo5JwSgc8S5C09y68LeJ7Lm8=;
	b=aK2Q0e52ugWRnsQGBsHFzJQ9FmGZL19WASUgGhzd9Nzjdb7NoctZOX574dq4NJlOU5LQ
	 wwatbxRBkuNEPCY/RYMw+a/XPAakoc8i/xGk2R06Xy+HcHfapc9NnH5F/bmfyqiT9hkl1
	 o720b62P8T5EVA/YWK1QJlebk7FDAnV6c0IgBdi1KcgWNWhJdSVDflIxA85aMOY6jf2Pd
	 C/hC+wVCIdoD/eFPYgc7myOU42NpsNFMAT5UhLAIuBu936dg1OhLUVcDCmmwHGURGDqu8
	 KyGW4/+YwCgxGugJpB7XPm0LFJIHIg52YW5+Klaf+VmAOaetTYy8GNx5tcfOe+Wv2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eauCaObk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6860A0FEF
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eauCaObk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53891F00A16;
	Mon,  2 Nov 2026 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637371;
	bh=4x9Q59P0oCvcoXH7BhQNo5JwSgc8S5C09y68LeJ7Lm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eauCaObkhNumcmG30U6B6dsEYJ5NhmiC9/LXH5QEkNFs34Lz3JFrz4tWFG1FYPCo9
	 xfIE/b7dvx2raCZ0rT1yXWCKb0ZFn499Ub5kW8myS72niOIvRI4OBoIahAuG2F8pMz
	 E3wOoq/Qr4tP2OzogSaZ9T6xgK+u5+Rail77NjcSmHe4NF4zbV629/L+NXnpcYuON6
	 FiiojA6pi5qbONsxqCdQ/GSfDkqa+86Fbf0rr+IsEbf2wSauZ9FH2Dhj1gBNn8RoMA
	 +FXuWz0jk6t3Dezi5rHjorOqXNKwegAzl8hRqtS58WO+y3Gl2rrP1OllAhyNFsa9MV
	 ZbtsI7t4y0tyA==
Message-ID: <sashiko-outbox-193758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode
 after soft disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:36:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
> mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
> but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
> needs it to decide whether to pull up again.
>=20
> wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
> can sleep, and that function tests mtu->softconnect -- the gadget's intent
> rather than the state of the pin. So it answers "pulled up, the IP can
> sleep" for a device that was just disconnected, and the poll for
> SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:
>=20
>   mtu3 11271000.usb: gadget (high-speed) pullup D-
>   mtu3 11271000.usb: ip sleep failed!!!
>   mtu3 11271000.usb: gadget (high-speed) pullup D+
>   mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
> [ ... ]
> is still set and the IP-sleep poll is still performed.
>=20
> Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadge=
t connection")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-rbrue-suez=
-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com?p=
art=3D1

