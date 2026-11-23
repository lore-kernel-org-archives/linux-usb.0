Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420490;
	b=4MrLk6dDRnaxNwdzmu/LSLRtyVwoBtXuwXD0it2imqaA3ZVCq9RW7Kv/tsJz1B3p2REX
	 uk7dvkH+QwNXVOPiLTMFpoYbWbHPOdZr/4d/eiM5CQzjY7IELa6oPoA6POiHpKZUdlD5z
	 pExBFG1V/IoSKKL5ldn8TYZvUU/FC1N29rGzqm+A8TrhQ9WUNdO1DQ8G/Leq9d6UoYb7C
	 TOpuT+7QRWaKSIxWlJEkMqd/Y0Dl3UPS0/7XEHwItjb8gZzLhA8gGAcDQID6oSmbHho24
	 h9nH/di4gIr4rktlPgZqTUr6iIeJP6EuUlLexBo1duc9ch/S8yuc/RqJk3YkvRL1aFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420490;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QhRg86/BYQeopwGUG/E/2ypygP7V7G+mD2EKP9h8Vp0=;
	b=Ef48l8PcBEnkbJiYF2zZfBwCv0MbLgHzxusO887FEYJE3UoW5/EgD1Ab5Df4l/arNG6g
	 narzliqd+GrXbZkuUTs1pxv9RVct3k5hT2Pl2r8d+jY4MH5jZJlajgMZuMS3xhTB0t5aa
	 EDDNP/IqwwyO5zxE+HKuNP2H5o3OxpIuU8lVm6iylSlRHpq8dA4z53go1hF51mdO2ZSrW
	 9Io4whgycKtnyboLJyeFwvnbHIkD4Ilnkt5vD+d3Df+WGI4azKle9JnKrsPETJCXDMDRc
	 PCiPmqwrOcrUhY9fGKka9+Cw74WW1W0QPcvG9NPBX+jBE1GKUPfRaj0ZdbWLLpDPxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiJdUuV0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418DA606A327
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiJdUuV0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CB51F000C4;
	Mon, 23 Nov 2026 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420489;
	bh=QhRg86/BYQeopwGUG/E/2ypygP7V7G+mD2EKP9h8Vp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LiJdUuV0nWDLM2trRZPIWjcjsA7ABI6G5GCYfCTadIFuhNiN6i165lTeXcNCXKYTe
	 r1SmKGltEE0NWZ7hTN/Q1fkPyMineejoFXUj7aSys8daRF2wtUJ/iKv8/tXGKu2rOm
	 nB9DoRn5mRVWWnvoNTLwBWSpD03FEXyyqnX4ZWY2fVbXCx5VeXHUD9E/VD40FxYNYd
	 eH1jGvD3hXsLwAeS4Nohb0h9QLB4Dl6iiAU3dgm72jYln28BpzaDShWPEof/WiN1Y0
	 MIStyTTokY3D3zjPhgwW4JNpFXIxAWJ1UB7MwNfyS3Iux/HujxcpNn8dZYIufxzd7w
	 90O6ic3zsxdbA==
Message-ID: <sashiko-outbox-228846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: pd: mark usb_power_delivery sysfs
 devices as PM not required
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123075258.651291-1-xu.yang_2@oss.nxp.com>
References: <20261123075258.651291-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:54:49 +0000
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
> The usb_power_delivery device tree (pd, capabilities, and pdo objects
> created by usb_power_delivery_register()/_capabilities(), and add_pdo())
> is a pure sysfs representation with no PM callbacks of its own.
>=20
> TCPM's state machine runs in its own kthread and is not synchronized with
> the system PM core's suspend/resume sequencing. A Type-C wakeup interrupt
> can resume the system and let TCPM register a partner's source/sink
> capabilities (and their PDOs) before the parent device's device_complete()
> has cleared its power.is_prepared flag. When this happens, device_pm_add()
> observes the parent's stale is_prepared state and prints a spurious:
>=20
>   source-capabilities: PM: parent pd1 should not be sleeping
>=20
> This is harmless but confusing. Mark all three device (pd, cap and pdo)
> types with device_set_pm_not_required() so PM core will skip dpm_list
> tracking for them entirely.
>=20
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075258.6512=
91-1-xu.yang_2@oss.nxp.com?part=3D1
