Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964969;
	b=SiYJ+rH/fJypMDjg7Sx+YHL0fiOqwUVOWyQ8E5oB7rHOnr/nAaHdag6nUC5+o7bPf4gh
	 FaelWjYsjqX6wnnR3rWCJAQGDpXdsE8Ks6VOaHVmF3ca9USWKJLADBsknSH7Dw53CdhWY
	 TQBsDS+N2H4vUx9TZ/Gq3IeMmO1JS0QCZXIb9W4RZgo2fOjHSy7GmuEf+xXjjUXkTBZBs
	 SzJ4NKlENXhaNYjEa3IZ4OfKRNL7nnJDq53+PspDtoy8Ah68edE1DJDJqtzDpkZDwtCao
	 2Qwt6DaUhbypuNeLcQN8gEC4WWQrDSM3NqfXkPCB+0/XE/KVXpcJRg+nCzZfbiFctkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MxrX/3YFwvUn5AWi3UIy5vUn8XO00+EiZlHIlqf6qwE=;
	b=KhhsoAFEM07l2QxvKsbM5zJwLOAZ/672npnsF8U+6QQ+uogSTRFts+QBwDWRey68urov
	 D3dijYs54QS8VgUrCfXe6uitCCvDiXX9i/IpLtblp1oZPyMxxiPNWJPVlfqrrPssaT6Ul
	 8iHPsSaXUiltOPKKbvOIvBGL0uqjDrGWj3fJspaMPwuB4RS3z2YBOQaxtEdqh450S2ZrO
	 gP8y1rjzqJDY/GJax96DXuCqWW5bpkpd01UC1Kzo2OSWDSI+gTJveoGsTMbXpwbGC5tjO
	 S+KSC/jehVtTlQ5lrY5cNzSX2J0d4AqvGLZWsScVWKxp5ZHiB/lDidTHcAHbJ6/B8Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHVVQ7I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2084606BD4C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHVVQ7I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3602C1F008A1;
	Fri,  6 Nov 2026 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793964968;
	bh=MxrX/3YFwvUn5AWi3UIy5vUn8XO00+EiZlHIlqf6qwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lRHVVQ7IDTx3LFFiXi+r7jkZfuykXihwLnQQxZs7V18HqURAsS/oSQe7EoMMI04yh
	 NTwgYK/F/nzstlxz6LqSc+Rnz7alY2TUWFkRsEnU5V54aBasCUg1i9a9CppCh1qwPL
	 BIi1ekHrZqqFAGwwzP/iopYrTTZGx6AwBEp9VkH6L+6N+fhqpx2eZyuxwKk6vZn3XC
	 9xcWPxGWnOGC82WN6qe+X9cv/7FO1JIeSAxAmiIm2PJ6241XE3lp2zvBBi+DQRUsPH
	 gi4Eq8EduKvDIDx/nXBXiQU1ejqYPTi34MoU4pOjoAdck+Bvy/lud0dG1E4SmNwEfg
	 QN/V9VxX6FcgQ==
Message-ID: <sashiko-outbox-201322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: wait for the port to leave RxDetect
 before xHCI reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
 <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:36:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Yang <xu.yang_2@nxp.com>
>=20
> When the host controller loses power during system suspend, the port
> state is not retained. After power is restored, the port starts in the
> Disconnected (RxDetect) state instead of its previous Enabled (U3)
> state.
>=20
> After the controller is switched back to host mode, testing on an i.MX8/9
> SoC shows that it takes about 2 ms for the port to leave RxDetect and
> enter Polling. If xHCI is reset while the port is still in RxDetect, the
> port does not issue a Warm Reset.
>=20
> This prevents the link from recovering because the USB3 device may
> still be in U3. Once the port enters Polling, it sends LFPS.Polling, but
> the device does not respond as expected. After three Polling attempts,
> each taking about 360 ms (tPollingLFPSTimeout), the controller reports
> the device as disconnected.
>=20
> If xHCI is reset after the port has entered Polling, the port issues a
> Warm Reset and the link recovers quickly after the device responds.
>=20
> Add a 2 ms delay through the xHCI resume quirk before resetting xHCI.
> This allows the port to leave RxDetect so that a Warm Reset can be
> issued, avoiding an unnecessary device disconnect during system
> resume.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106111943.2868=
733-1-xu.yang_2@oss.nxp.com?part=3D1

