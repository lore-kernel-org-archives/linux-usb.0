Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539347;
	b=qIgDdQ5Q3eXMga3qYFCOQNwqb1JNn5y1blShoAWf6DrhI8P+xG6lQ2DNW56mYB7bBAzQ
	 A6JMOkff9aeT2Ic5ljTNLQrm0qhBwsILhOgf2gSrsTbu/JrQ6CX2rzdPLCuv2TqyhgaPL
	 89vLOTHjHteHe9y0lROGOccqZRwmHYJPbNe8D3usItPaJMvco3uJ7lpoEGtN13n8FsQ1q
	 Nos0yQgX/2FD+rBVOsJHMzhbEh97VgWppNm8TpAeFey584JtRveR3ObYYY9kBi2wNhJ5q
	 uBIkr407v/Jw5MHgZ9NJ1+GwWArDhuOvifHRhZAwViYlNRPe5/N2AzpGVGPABos2Sjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aGY/f8H7VUdOPRzVXMKpIHJecqBDb4zvl2LKD8O68Fs=;
	b=0ypwvPNuawRdSqTHGSYbmA09I9Prz84P9pQnmgukKH7+D4DLvI/5BIWN8tXup/wno6nY
	 RTAsn2M3IrQxjbAT7Hqyu9msLW/y8xvwWiSp728Q3Wtoh8QWDdEdgtV1Q3FipQ070uJuo
	 WphQTpWqPCIW/uyj0Te0nYeAvyQR7E4Abpg7kDNjTIFQg1fWsYXGn5nU4pLPBADCmaPha
	 /ac4HrXw1i2Eyki8J4x88R9Cuko/ROHFZHdj1R2mDm/HKumXhkHPfkPl3/iI1JAwLOoaQ
	 qkKApyQcDT4hILfYQ6iSGAVcbUo/bpJFD4r8Nb4kzeB48/TusjRhIqcLrHoaFieqszA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lssd6VzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BC606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 03:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lssd6VzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD71A1F000C4;
	Fri, 13 Nov 2026 03:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794539346;
	bh=aGY/f8H7VUdOPRzVXMKpIHJecqBDb4zvl2LKD8O68Fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lssd6VzRBJyivD/1FN6wgexNPonT4i1Ve32cgV3LzK0mAt0Kv2GJMqaQEiMUao20q
	 Ttnh51gNw16LzjHpsaotoLkGYc2n+4+uWtjniG/lqE0/MdgwTdKO4yPFx63MjrSNW4
	 Fe981NJh+YkH7XSjuAO++S5vSxAA3pdPAUgBhkHBFN8jTT+Dx53YFMSN0V4EIHZOjf
	 RDsRDxQpW6p37lDHIX1AhB5oOPQ21nLmGim6Z/MoDXhGugbvMMzRsTR0F2/GBliK1q
	 0HRfHQdPbPKPyVsseXznNteA09REEByXA0kRGDKnW3dtRNHT13UC1HsmnslUcKRcE9
	 Ib8M1CVSGkdPA==
Message-ID: <sashiko-outbox-212124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: uas: fail command submission on fatal USB
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarthak Kukreti" <sarthakkukreti@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113024922.27977-3-sarthakkukreti@google.com>
References: <20261113024922.27977-1-sarthakkukreti@google.com>
 <20261113024922.27977-3-sarthakkukreti@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 03:09:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> uas_queuecommand_lck() only treats -ENODEV from uas_submit_urbs() as a
> fatal submission error. When a link drops or an endpoint is disabled
> while hub_wq is frozen, usb_submit_urb() can also fail with -ESHUTDOWN,
> -ENOENT, or -EHOSTUNREACH, causing uas_queuecommand_lck() to return
> SCSI_MLQUEUE_DEVICE_BUSY or queue retry work. In addition, if status or
> data URB submission succeeds before a later URB submission fails,
> uas_queuecommand_lck() either leaks unsubmitted URBs and orphans the
> status URB, or leaves SUBMIT_CMD_URB set and COMMAND_INFLIGHT clear so
> the command never completes.
>=20
> Fail commands with DID_NO_CONNECT on -ESHUTDOWN, -ENOENT, and
> -EHOSTUNREACH in uas_queuecommand_lck(), free unsubmitted URBs, and
> unlink any already-submitted status or data URBs outside devinfo->lock.
>=20
> Fixes: 26d56a9fcb20 ("usb: uas: fix urb unmapping issue when the uas devi=
ce is remove during ongoing data transfer")
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024922.2797=
7-1-sarthakkukreti@google.com?part=3D2

