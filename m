Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758107;
	b=oaToaf3OM24GYaRPs5dEhzgXNAu293CoAsmJNmLcd0TnoFNejTv2BUx9x+gf7O9BpNaK
	 c3p0QyeyTeup/CGQShkB2LSrDAMsrZpwT+mMBGmYwUM76cbASCjVrxL0Nlgu0aVNyC1GY
	 TOKiSwejyS8VFNwhAiSkHV42COArYeMx9PQHRT2bNWBpeP11G53bufZI3yk+a7hEVEEym
	 n8aECjAFj+F5G6exzwv4EP867EiA2A7rT7nsaB2DZOisysj2IqXKjS7H+IEayKw9sV5vO
	 9vyiHEOxK2LBF235adMZC5chzhrqN+dnK0gEH2Ur73B1Ynn21bF3OM7i1QP9bEtiIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758107;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ciHP8sw8KkJCUfVwwO41L8XxY5GZuIGwR4ead+tdUXA=;
	b=g45Dqu6audPv3kf38cljtYyb3X8hFzaPl1TxRzGRXkBuItZVesao9XEZcZ/f7v5nrB2x
	 3hMRblNQSn8MrEgKvzQygGF9kD/qH81lFST4+piVOToiqTskfMabiSHMZ1ViG5VNVPoYM
	 rIgL4szlGcMrrLs84ZbByg6WmBeF45Ow/Wo+sHiI4IInZ3Z0ImSjpHakVQvWoLB9oF+iy
	 pPAK4aAFMBqTZqlWFDab5CfYXZu3jKYeyQzEC/l6NiLpi7octYmfYgIxL3mAsKsEhBB/Z
	 emCeWBLhP7bWsE9Cu1khxs7rPoTKIpw0ZN0iAND6IG0QbtCyKf4jrm7sd4+FmQ+hkkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhwGm1Bm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED79606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhwGm1Bm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D06A1F01825;
	Fri, 23 Oct 2026 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758107;
	bh=ciHP8sw8KkJCUfVwwO41L8XxY5GZuIGwR4ead+tdUXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhwGm1BmXQfbQM6pbCLhUzMOeRbKMMxawIdyIB4XpcCUsvokkuXvwzrRLg++o+lMN
	 Fso+G2r3hxxVgAvWpaAXyrqS9oQ3vWF2CzxfWGDt7/FBZICh7FAi/6Z7Jc12RnOKJ7
	 HWj3dKFH/9OtFLT8SyqpcPW1bk3RMQjWS+txqqPBATOQ811jl3hOKfdFokrsYBOCrx
	 mQHYVXkiiXJWEUHIMHyOHn52SFSyNEfQsIKf//Rc7bnJ+8mzCCFfaKeukV0wZ91ciW
	 6Mk4Iy98ec3JDDQw6QGXpFJarS2X+WAY6AtZ8u63k6TNbPYG0vmDE+B/WvfebwDwKH
	 ufSkbt69ueK6w==
Message-ID: <sashiko-outbox-182754@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: f_ncm: do not notify from
 ncm_set_alt()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Massimo Toscanelli" <massimo.toscanelli@leica-geosystems.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
 <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:21:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
>=20
> ncm_set_alt() calls ncm_notify() for both altsettings of the data
> interface. So a notification is already queued at SET_CONFIGURATION,
> when altsetting 0 is selected, and it waits until the host reads the
> interrupt endpoint.
>=20
> The USB 2.0 LPM ECN (section 2.2.2) lets a device answer NYET to an LPM
> request when it has data pending for the host, and DWC3 does so. So
> when the host loads no class driver, like the USB-IF test tool, the
> device never enters L1 and the LPM L1 test fails.
>=20
> The CDC NCM spec (version 1.1, section 9.2) [1] asks for the
> notifications only when the host selects altsetting 1. There the call
> is not needed: gether_connect() already calls ncm_open() or
> ncm_close(), and both notify. The extra call only restarts the
> sequence while the first notification is in flight, so the host gets
> two connection notifications before the speed one.
>=20
> The old ether.c also notified only for altsetting 1, until commit
> da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")
> moved the call out of that branch in f_ecm. f_ncm copied that
> pattern.
>=20
> Remove the call.
>=20
> Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
> Link: https://www.usb.org/sites/default/files/NCM11.pdf # [1]
> Signed-off-by: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.co=
m>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-ncm-ecm-lp=
m-v1-0-d01e81fbf460@leica-geosystems.com?part=3D1

