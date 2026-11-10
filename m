Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293034;
	b=GEHZQ6vRHqL36FoZw9xLmXb2zkmGU5n/HVXzMCLXZxzTD2anwmjqbz1FW3HPQ+WfPra0
	 zobkgjJ2Ib/vgEPy5pZr46zp4iup8LZW9IDTNl7l4rNJTSQHJRSs/aEgI+zBXCbR3mUY0
	 70ulJoOo6krogdgTKAS3nXuF1GzFJDQFBtjTqSYHC7XI9nKlemvIrMzn5UzJpf7uzKHhU
	 GkiI90EXOshQdmbNWXlhSUdiNIcppvxq4soylnebkD//+Is+E57vyJ06MjsPRDvD+Qnio
	 7ESq+SnVhd/3ixX2bSRnG38EJSJeAlmgVe5srkX+vNp7U1z0M78d/PZxCC/KN0271Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293034;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CdMcarJgP5S66e6LZwN+7YHMprFlhJE88GiTwk/NdTs=;
	b=PsduFybE2tQUB5KsnW3ZnJ/ox+Ahm/9AueFjcRPU2c51O/59l+/Fmh64cj1tAjiY7PAf
	 amgyPFsZ9Mo2uI0DJ/AvsRUOsUobdSb4zZX/Meafx2WoPpIHUFlEGgrf1VeeKvbj0K/ih
	 pttmTp2YzZlCdLic/BMI10cefg4WF6/gaw7+SHzTTa0cNUwZ4ZiMEFGTnZjKNG158RvZ2
	 r56CKwHUYNUIfGrphuBQuExM29k29oS+4K6G3nBwU813SC0NaHeFJVhT4Y7NCsRBqT/fu
	 e9OX1n+hTrML8zgb4CvqU4opKRAH9w7a8sNJaMl2O2A09IhNnAfWctLVQ2oRO/aYbSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpbPXICa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03A606B1C0
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpbPXICa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A408A1F0089F;
	Tue, 10 Nov 2026 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293033;
	bh=CdMcarJgP5S66e6LZwN+7YHMprFlhJE88GiTwk/NdTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpbPXICa+s7V4KF+/J8qxhyu/SVV3Bhjjc5hP0MtQvjZF+jVm/FiXMpnJN4xsii1h
	 4l+vH5iTvD2m50j7qGCyuDPfSQ55zf05207lkpzJtsxm1lgxK3y8R8Cy9ptDJvp0Ee
	 5zqCDjqcQ2X0663gig2C1QVgLHDPfk4o3Go7B/I9V/2S2EVqpy7+LCbQwCMckfPM6e
	 WYOU3GbvcFo7aiG87/CP5rjbrcEMbOOLRfbnhPq/wKpAIKRKVXBrF505sMKT2Uh5FR
	 cmq4D4p7orQyOCnWlr0XVUY2W0lpsiY5TMGjJg8O9ZGY5Ddmw1VYubHx/iTxvTj3wV
	 UW9HBGBhMYVcQ==
Message-ID: <sashiko-outbox-206429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/22] usb: atm: fix a few spelling mistakes in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-2-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D1

