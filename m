Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592293;
	b=4jRQfqe9WSygEkMIzOjXP1KpK2Vh5Gq7kTy9Zk+dTLirvTxpKPf2Gqk0WbyOxZxw37v3
	 q/Jx1IBZ7T2O0DpZSFqQCWq68SUwt1uB18cD8CQsCYShfo5sF+0Jl/VgjtgoEYJ0OyY3+
	 TdXP3+rZwQCyH+vJdaj++J9kfrxukq+oxzNzDAf7GD6Lqdws+KMWjYUgtfhpvu8fPIN14
	 w3kR/00+PGuDRlitc/+Wti1MVjp2i7JhGrtrUXWYvFh6fcz3WdAfXraRrxDaeNR7Gn7P+
	 7B2gkb6MhDyDlaaIcKFQCueJKsT6Ap9odEZLCeRcBKqcJM/Aq7vo4f0bbTWgzV23DpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=evWnccBXOuV3kX30/MPEgEkNgDZA3VhIdQ3kPw1k/Vg=;
	b=0/Jd0oodSSzr9qJm9DIje110+TJayiAFORgI/WeSOxPKFthHDzHDdSBt7zwbLTXYaZEf
	 AapjI3jTnoB/Bf+cd42ziNSstE/SZEES304KovqeMLHxsrWb+GxnxYj4u9Px2d/iwXlBa
	 DwFtExbGU6XKjFsAazlJGRcWM219zxtMlFbE2MCaPhNzAooftSblW4vb2FiG76B+yZrMT
	 EJgF9empMQYk+o0xlUNJ//IcrMfu6aAhUqvfxN8Wzr16S2UqghjxrUOFz7tqWzU2AVLWQ
	 JLh/loGxTIXD3erxcCQHGzMyPWKL/U1e7PI5gqvHzLxdibiEgfpxOkHfEwY4DM7uYuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXoj+duF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A9606D498
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXoj+duF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FE31F000C5;
	Fri, 13 Nov 2026 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592293;
	bh=evWnccBXOuV3kX30/MPEgEkNgDZA3VhIdQ3kPw1k/Vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aXoj+duFLW+RJc+U1p+/7KDhe3eqUO6g8XQyeQ8sTIXPFmzQic++mJnPNQJi3a6Of
	 PyVC7telTT+izauPegoP4xd2FFg/ISmjgaf3aplwDUuuKH3njl4WEPoA8+NzQ7CFDq
	 OQSvyE0BcUMBqPjdwEtPppwdKWQ/CamNFIUWm0paqDnXVqyQLqordXrP3PFmMv8Gdi
	 F8FkDp0xnwG5dEEP8q0HrJ9PEs9afozkOwLVAFCNzjzwK0NBBSFZvfG1L00HVWw9OE
	 Ypgcsfu81cGgkos8VNqnF1gSmp4gpl0N/Qkkd+fv8vOCDJlwCbfDMX2GaEBoHWBl4X
	 J+IAnB56svatQ==
Message-ID: <sashiko-outbox-213366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] usb: typec: fusb302: drop custom gpio interrupt
 logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-8-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-8-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:51:32 +0000
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
- [Medium] usb: typec: fusb302: void stub for fusb302_debugfs_init()
  breaks !CONFIG_DEBUG_FS build
--

commit 68b5d98996b526119f13f5957d4fd6cf07fb01e3
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: typec: fusb302: drop custom gpio interrupt logic

This commit removes the undocumented "fcs,int_n" GPIO fallback from the
fusb302 driver and requires client->irq to be populated.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 6105f09f96aad..c392134cdc0c5 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c

[ ... ]

> @@ -1751,13 +1733,10 @@ static int fusb302_probe(struct i2c_client *clien=
t)
>  	if (ret < 0)
>  		return ret;

[Severity: Medium]
Does fusb302_probe() fail to build when CONFIG_DEBUG_FS is disabled?

Earlier in this series, commit "usb: typec: fusb302: Switch to device
managed resources" changed fusb302_debugfs_init() to return int and
assigned its return value to ret right above this check, but the
!CONFIG_DEBUG_FS stub still returns void:

drivers/usb/typec/tcpm/fusb302.c:
#ifdef CONFIG_DEBUG_FS
...
static int fusb302_debugfs_init(struct fusb302_chip *chip)
...
#else
...
static void fusb302_debugfs_init(const struct fusb302_chip *chip) { }

#endif

Returning 0 from the !CONFIG_DEBUG_FS stub of fusb302_debugfs_init()
avoids the build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D8
