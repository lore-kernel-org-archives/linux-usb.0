Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843325;
	b=MiHg6eQfrSdhzHpKKpVBS6NUmueNCMAHVjNIwTpNIEpQJIFtDawkCCw9DD3yb1QqzOrv
	 vK++HBJrbYBzpaUDvDv5VzzGmrDD02ydEW4TON5fXrwHbpq4oZ5pwhQyhecIcXTDAwcwq
	 JCIsMLeV1+h8eTkMZ/dUM7FaBQGA16YimLD0vZNWQwsk7aOBWxa2uQ2KGTGvTFxo59/Ds
	 84GvepyM5tM2i37KDmdUMpHimguousNlixoAi9MqClGX2cE0vakct0tzujYRuIiwR/HO/
	 7ggu2g2judRvV4nYb2UhP3Wabh67fxal2r4yzLUQysxsENUMnARt5OnWCeFhYZZupew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3/oUKlprOAOBvZ1qxd7AKB86UrDoLdbBlcvJvrEcsZE=;
	b=fB+UpiZqAvxd7ARupiA8UEx1E0ccqwESHpJOU+sNrZOylmIFDPgdih9OyIK8vaYXDgy1
	 KmCEJLceiiRe1x3UrloOnejRnfmZcqfZKh5R4qQMo/mWoD/tJom/JkS4VrpKYydtRaJ1X
	 9MC3ziLV15Ewgr//51J3m5xejnT6VjIwFYtX12Y5hQTzDogXn+QT/etn0+ZHgemIvU1Tc
	 0EO7c7QwKRcJVdrNtd0SkMk19k5u1KpZyy/qXlp+Lsb7YnPd7qzhMl4JfVTJpy+ZvRqET
	 i671yk8n14cHTmhPKekREp+SCgaz/cmx7vbtyzfi6Xe9bWgbttzblZmT5i+Nyn6Pwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cULD5KK0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B04606A32C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cULD5KK0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1971F000C6;
	Mon, 16 Nov 2026 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843325;
	bh=3/oUKlprOAOBvZ1qxd7AKB86UrDoLdbBlcvJvrEcsZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cULD5KK0Dq9eASakp7sa0XFNjlEKdNV1WALUNLQan1snaVwhFk117q7P/bojyChtJ
	 24Gs5aNiSoEjwJUwVHaJxkvYf6PMS2AYuSYfgvlfGQs5RDhtQTvXx00ShotGtFOIJv
	 OiRb1EGXrI7IIZoUJcAx3v0PS9QS30hXSLucYvqJq+ZirP5fawyGcDJst2iVebB0RJ
	 42z1EoOCOt0rjlHZIl4DH5jl7UyW0G/KkQ8bC/FT9o1U7eztuFG5GGeCw7Dz/kJrEJ
	 /oI428AHypNEjr39uMwT7r/vb30NQla/2v5O0JUqtQzh3JD3k23gKePKF4vsKIMRSy
	 geMsNlNPvfM5Q==
Message-ID: <sashiko-outbox-217296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] usb: gadget: tegra-xudc: Add support for
 Tegra264
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-12-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-12-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:35:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for the Tegra264 XUDC by adding the device-tree compatible
> string, SoC data and additional registers that need to be configured for
> Tegra264. The LMP ITP timer mask in the SSPX_CORE_CNT30 register is
> different for Tegra264 and so move the mask into the SoC data.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D12

