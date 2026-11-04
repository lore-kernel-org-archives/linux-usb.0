Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763282;
	b=uQ56wLlaRQG+/Zri2JdN+iQwBuo+RB0UxVG97M71EqVcZJolgNIeEhu0197UdMAM0pag
	 j4zWChtm9mKg1F/slwosT8wpr/c3Cu8GV64CsNLTK8SY1BmLdpP4qb2aNLFISXr/xa64U
	 U6XhCDlTkXF5ep+WoI9QMG7LlD/OpuLiStXol6L6CMUS23XzmEMBfOvFK+EvC9J84a21P
	 hvqGn13sPcSTWR5JV5RS/VKHx6ZfCK2NNzmTEhaU0WbRfcuswCiRBH+MYJrlvaAjp5hKp
	 PUNzFazfqvfeVhhT6TVnE6R22NyjP2XhL3qNUp3XukI3lKtTgvLp7W3l1LSAzME98wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763282;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fJYvpOxHE9X5aCVaLWrrnftvppokGFIQS9DiTD/UoxY=;
	b=pC0tgvwKNpbRoOihAFQQztNC1WgdQF+BDak5CcOLapa+nzPEUx80U1Pp8pwiS2AKD7zt
	 M2eW1/BHX7/Ehk/t4GT3U7MLtdTJnhwduX10Xe3HoD6iwz1Sqrl3Sqykb+S84i6lSQCmo
	 e7PXjCofDTaHmeugBLTewZYhqMvJueq+ZszYtRWErqYmW6s3v40zhEom64masy7jjU/Zu
	 9lsW5C66AUr9wUk+K7E9Xqv82MATphQG1LTRAdJptaHTxODqTjd27NnVer6wncgTdbf/T
	 QARiBe47uE/F7Qd2C4jtZwiUNUaNHrWYYMu50pW9L2tD3+JHtzaUKwJya5Of8Rq4sFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k2yuuM17;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E667606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k2yuuM17
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12DB1F000C1;
	Wed,  4 Nov 2026 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763282;
	bh=fJYvpOxHE9X5aCVaLWrrnftvppokGFIQS9DiTD/UoxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k2yuuM17cnpVXcKbMlymiyTbevASkzVyBqygKeeadoYldfEEKclUGxqCqoiIlIgJy
	 8OGI15bTg8iyhoFvk3YwX4zzXzQR28SM06zysAIVl+HfABNSX3avUQBGt3GybPQ8Ty
	 BK5Gd+T9v0YYEn49ferGJ//tdxzhQ4PADTv9FjhPPZRPcFsXDRpf9rj7G4eGRj49Tb
	 /kru7oH1ip7QQQAtINXcv0RZX62Afac+ST25xPAkm9StkxhmP+69DblEU2PZg04oJO
	 wI3K/gnaW14WNSb6fH40yjbyBAgFwZhY4ELfvXDelVIRWzOFkzgHFXw9BxXKc3UGiV
	 CxhMSBKdNTWUQ==
Message-ID: <sashiko-outbox-196610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: roles: look up role switches attached to a
 graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104032706.210042-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032706.210042-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:34:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
> on the caller's parent device node or through device_connection.  That do=
es
> not work when one controller exposes a role switch per connector endpoint:
> the switch is registered against the remote graph endpoint and the
> consumer, the connector, has no phandle to it.
>=20
> Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
> endpoints and matches a switch registered on the remote endpoint, and try
> it after the existing parent lookup.  A switch that is described by the
> graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
> the role-switch API does, so the caller retries instead of concluding that
> the connector has no role switch at all.  There is no behaviour change for
> existing users: if nothing is registered against an endpoint the lookup
> falls through to the previous paths.
>=20
> This is needed by DWC3 designs where two Type-C receptacles share one High
> Speed data bus.
>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032706.2100=
42-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2

