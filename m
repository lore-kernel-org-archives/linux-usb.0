Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311744;
	b=Q9rv0s2t3ph5zdXOHWdth7mQaJGzqxlqxCRDnIYifX3Np5ReBzn5l6SO0EfTI5NBNFvn
	 /wywKLWvj6rTIlQSYxYgYKJCc9dDSW6d0qJ7f5SWIcKVWSUgtC0xB3isaXB0y8AAkzgKZ
	 hC1FYM8X81cYlANINkA8ySJ370+6cLAoVEQaLNeJkgos3WUkrqBNGvpvk3YoJnJ8yZNlO
	 tdgL42uzNvBuu2B9R7evFDhKmL1CXKcmz/ndag5prihmbX+EYc0ilpGSWFnuOmllMjOQV
	 wS7kEu/Ln9Fta2mhhzrKfVCTSKJEkS/2BSbxVQtPK6VtSrNvkpfev3r/3svPRt9QjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311744;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FHB0g5jMVhUBvgOAs+Q99czstYkxTzv34Xz9nyqTM0U=;
	b=v40MLW/5oH43qLBndZZrh3roZS3Q5KdIR95V653nIV53YfPvqOhzZBnVLHXOeca7VBlp
	 EPkmfkxf+WXguCH/ucsxEMOnpsWd0cxICCYWANtTiqWHPK6Xv5m7W7bR2mKJ4nO0avDVX
	 p0kTJd6doH5PscxGl53++tNVAynYVin1GhWSgX2qGSNb5vsemEPGEEsnObtvyYaTv7s6A
	 4uoJcIGwfrBq4U80idjq9hWVgNMzH96/RBbfZiqV6Oa4gmVNfEkIgTTXGP3OxdgpSH25S
	 q/krbyEEQ26YDYYB0tMMJrtU0er4apY/0aZp9GmVNN3OPi8jvxiRbd7BzWH5vD7TrTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J3//HlDW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB6606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3//HlDW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE161F0089F;
	Tue, 10 Nov 2026 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311743;
	bh=FHB0g5jMVhUBvgOAs+Q99czstYkxTzv34Xz9nyqTM0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3//HlDWCKSvOhcxQ4kSQQCBVmx75uDU/1cyaf1v8RVdbtBPdHQYk+Oohwq1P1p2g
	 8CiICtFfGlyrOWSn5Yv3Uvil9HYmZ15j9cUM1bbvqwXrLYFGFqTrPH8/NyCRcbZ6Mz
	 c6oI0SILwBDWnTjaPQyE/gVZh+OwFuF2uQW/27DMDVx3iG1WvA/pCdDdt1EAL/LRT9
	 GwG0P1fBa2Ve12M4x2BNbrQF8s15QkbFHhZemGNi01ur11HROTpqIt2iUSKWRdCCha
	 YUMKorDk8GovW+KAG5nXxW5qMyZZBRF5EZmLKpK+GzHqUgirrtnXJg6cdxDTJrFTkT
	 cGVECnAfDkgxg==
Message-ID: <sashiko-outbox-206964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-6-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-6-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:55:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] thunderbolt: stale timeout in tb_wait_for_port() Return
  kernel-doc
--

commit 129c5b50481921f9094356b0de883693a15e937e
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: increase the lane adapter link-up timeout value

This commit increases the retry count in tb_wait_for_port() from 10 to 20,
extending the timeout for a port to reach TB_PORT_UP from 1 second to
2 seconds.

> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 7ff3da79da763..7daee83c7ed80 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
>   * @port: Port to wait
>   * @wait_if_unplugged: Wait also when port is unplugged
>   *
> - * Wait up to 1 second for a port to reach state TB_PORT_UP. If
> + * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered a=
fter
>   * switch resume). Otherwise we only wait if a device is registered but =
the link
> @@ -500,7 +500,7 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries =3D 10;
> +	int retries =3D 20;
>  	int state;
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");

[Severity: Low]
Should the Return section of the tb_wait_for_port() kernel-doc comment also
be updated from "within one second" to two seconds?

drivers/thunderbolt/switch.c:
 * Return:
 * * %0 - If the port is not connected or failed to reach
 *   state %TB_PORT_UP within one second.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D5
