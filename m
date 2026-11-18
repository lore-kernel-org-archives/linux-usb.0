Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005906;
	b=BxLfCysSt1MZvv8uK5PnPLZ5Fzv2yn7bmm7XCiSq29dF17eg/Whd/ecs4C2w4PYjjDoJ
	 LnURFfCsYOzgxLAQBWFSAw8tpTz4M1HsjTwztRT8Z+cRp4FV3KlBnSyjuPNjuUfF8JtGT
	 qNp2dO4goleXIjVc1uocNy4lB23aAkaKI/BdFj+uY0iThBK5eC8PLnrZyF+GB5VtnQzPx
	 Hmq9fOktmQBh7MIk4cAVeXg894rsM+p81iJ6Yw4sxSHBGG42l5EHZdydyliraZAO3nRWg
	 3Zqfy+7wDDbd25CdJEDB/RNPc0HSPD/2T7qhhY0GqgABOGFsx1+ei3oGjHUVAGmttRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005906;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lqRZBpcG63ILh4Nhy0f8lsiEp1h5i870CL5mIwjf3XU=;
	b=0Z0OcXGBDJ+ciPSiM2NZieDaO9RZyIr/+2CugLp1DBKa07P39Nn8+7kBWokN8rFxurkH
	 WI4HzwRFbbc7GDB3rNN8vm85phpSj04PoJLKXlq7u+VHKk+uTa1NiztsbvjTmYqaNfzvm
	 ofsqkJlH+YB0k3hSgq3fMPoszVBBJeSLHgN1OHbiEWnK6BQpPRDx7iGq2YaexYt3tbk1L
	 gxQRoyRe/obKzDEREfhoB0rzh+5HqyZT0Rv9FKVydkHA63jSZUpnSiyTOzvEcGVmOPANC
	 KkLPQEWJyFnLKzCdCAceK7+JtZTe25qP4SB5MHdMU40NSG7H41t7HCYoNmQ3tOjruEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoI5eDIA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A5606A32A
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoI5eDIA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A282A1F000C4;
	Wed, 18 Nov 2026 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005905;
	bh=lqRZBpcG63ILh4Nhy0f8lsiEp1h5i870CL5mIwjf3XU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XoI5eDIAPK5SSA5jsNKrTNQ5VCyjKpNp4iORijevAXUWaj1EpntmXAN+JIyzACfHO
	 AytJaeCxb1om8U49Q4LfMj1KRkFxdUxpswOiKvfCTDC17GvX9DWaMsXuA9dsF6YB6G
	 l/fQ6CkVVAlf9JucQlWtTNou+PT+Z8tT16HuTb/2cpgXV/WekHC7LEp+hNWIihxdAC
	 twC5gd3Gc+dtU+g6j3uMGS+o+6QocMsJyaQeL3DmxbgeYH4WlU/4Ycd5Xz1HHb/8Xa
	 WSdJHcU1JamuQ6aYtYUUb6whSs2JeuCQtgXLNTjQ3Uvn0+uU2aiR2Et8oeBByKUrcK
	 GHQxG4vwj3NoA==
Message-ID: <sashiko-outbox-220936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: f_tcm: zero the CBW buffer the
 status path sends
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
 <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:45:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> bot_prepare_reqs() allocates fu->cmd[0].buf with kmalloc(), one endpoint
> maxpacket in size, and the only thing ever written into it is the 31-byte
> CBW the host sends.  The rest is never initialised.
>=20
> When a command is rejected before its data stage, bot_send_bad_status()
> points the status request at that same buffer and queues it to the IN
> endpoint for a read, and bot_err_compl() re-queues it until the length the
> host declared in the CBW is satisfied.  So the host gets the buffer's
> contents back, a maxpacket at a time, for as long a transfer as it asked
> for, and whatever lies past the CBW it never wrote.
>=20
> Allocate it with kzalloc().
>=20
> On a dummy_hcd gadget with a 512-byte bulk maxpacket, a rejected IN
> command declaring 4096 bytes returns 4096 bytes to the host, of which 72
> are non-zero and begin with the previous CBW's "USBC" signature.  The
> part no CBW ever writes read back as zero there, both before and after
> this patch, so what that buffer held beforehand was not observed; what
> the test does show is that the host is handed a buffer it only ever
> wrote 31 bytes of.
>=20
> Hui Peng's multi-driver fix of 2026-09-19 zeroed this buffer too; the
> reviewer asked for it to be split per driver and it was not applied.
>=20
> Link: https://lore.kernel.org/all/20260919223521.3890508-1-benquike@gmail=
.com/
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118124005.2428=
068-1-yhlee@isslab.korea.ac.kr?part=3D2

