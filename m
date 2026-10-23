Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763053;
	b=M95xN8hZIP7nIxfejHHzfelCtDO1p8XKEz4loi3tITZNRrGT9Q4/fvSEL9eVciob0RlP
	 mZ/PfseKEnb7hewW76RlGlGirXkkp6/DGU5UHQ/3yv5q05APxNXLZq/lJYGGxs0YERW6e
	 HuOg9alJMMuNM5rvYdqujeJRCqWGpT1y5jzl6Gt/3KX7eUQPWYQs4qFruKfUax9UEZMOH
	 1vDILcvLjg89dlj8LMSdIXwxdqGWrTDraY+MqmUIVNhZLhGeyimegXcZ2aAMxgdYa8gJZ
	 fMkTZ9YMXQNNacdZc09ApqnbiEzUFbcDTiwlFQVZjpYJdEpOwsHEhI7yLcQpBExQbvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763053;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VKidSWMFfOgmHePmKJPQj6QtP/RZIbDEZBDknVHqvHg=;
	b=SMCX8jo4fDlYrarea8k6t7FPQiKkttc3noDM9IMAZkeu99hoLuYln1mhzlVlobjPtRDo
	 k/c3MkHjfUSYAsebxh7exDFI3tY4+99hEE/zUisV06j9mMWhLh/3kALI7y+SIUFL0jq7K
	 9FuDJ1DMSSiru+p896ieNXk20MJBIMNeJGWkIwewlMTYD2duPWAfl3Uh3l0oA56FT+FFu
	 czJEXjBPTpHR0ZgDkkbcc6EzNBn+WUiNzQHWggOD4vMGz3k1UjQ8LwGpOaISSlnBa/FL9
	 CRmTPOin4KoFZzLnNeMcg/7IU6CL3UG6sSjQwaydio17EFgRw/75PmUxIlYPbp937PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAMUObIF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA0606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAMUObIF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944D91F01825;
	Fri, 23 Oct 2026 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763052;
	bh=VKidSWMFfOgmHePmKJPQj6QtP/RZIbDEZBDknVHqvHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RAMUObIF5tMfyKll65SctlrfGM5HzXVLmDRRmCStBes5jn54qFgYx/58fzmfxz4Kt
	 iTgpx7mN74/F6IMS/ffgTGsX7UQZ3GTwlC7uPdQQvs3V/rISFzD8V/POeEIMGDG+/S
	 hJRUcoUljoSOtsGjTBCY5LL0kEtsjI6N+R4He59ndaDInvdbjDdVYVZWCrYuoargUq
	 Z+V3bGrXA/qn8qiWtBQFjEU+TVwY1xs9pWAk8M3DF8PI6sEKjEEv/UsNCbk5Xc04zN
	 iDhjyTL5RenPIZijWKxRzeybZhcjvA97iJj0Ss4ICIQ+xcsFAxSwVvYvYbfcwQMhr1
	 laWZAJXpprSJg==
Message-ID: <sashiko-outbox-182842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-hpd-irq-events-v7-5-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-5-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:44:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> events to the DisplayPort drivers.
>=20
> The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> preventing extra cross-tree merges. It will be removed once all
> drivers are converted. The drm_bridge_hpd_notify() function is kept for
> the drivers which only care about the connector status and will always
> pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D5

