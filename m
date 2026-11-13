Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590487;
	b=1mvDkGsCEOfE3jL1BeIJEfYRMZLPZQgNFmc0jJODFkr+h9hkZWg3YlqtX8pDAGsycUXu
	 GwrvxwwimbCgR/2MmyFUXG2iczi9GR9qPKxwkosXM27lKA9EQGIvuigM1m95hEDNmyY+v
	 b+MqNnyJ/chHJdEwkM9otNHSf14F+uSWutJlbXG8Ncntd2lAhywdHH1YXoFFD3g9ZWqSD
	 sWWhh5p86XoX6WgP0iVA/qY3yR6NJght3CzEJR3vXP+kLfJ6J0KxqI+cVtJD+pyF6/05R
	 mQBsiW7yiRusbAksqybxn/Y/0ezMzG/JEriL/8UwZF6CiZuHb1Ba+XG9FgvWZyij29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kNXcOTK7vV4V3lfGJ1GhT/FmTOotCY/24yTZ6RLFQtU=;
	b=VllF1Nrq//UgeUG9aYX424DcvtGbVuGPjzi6gmbUzvz+EMaa3ArLULVjaMvV4rTdbdGo
	 BDWRE2ufvWw+xOo55lpOMEmJ+V34Fh1JaPhkT9yThz2+UM4Q3SXa9FjV+fqEVqwk+BUHD
	 t027vnJY34CDw5GDDtcSDDOGMFUF1/qyIEFWFtnqSUBRuGcui4SakY/j5zsW4IVFe3ID+
	 NOkxHCAYYEES2RANLK7FyAnBNQtgZA4y/rZEnbhV7q2u/RY3UxF8Fvshwms8h9C6m7SIW
	 7TEmVd1MfCzQNrbBCQiIJWYHodA8S5oy2zpAetv45uotll9nGfieaDeLLZO1+u9pBQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHTB4KvY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E6606A8A8
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHTB4KvY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1961F000C7;
	Fri, 13 Nov 2026 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590486;
	bh=kNXcOTK7vV4V3lfGJ1GhT/FmTOotCY/24yTZ6RLFQtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JHTB4KvYWHp0QxoZH4NDKYMA0Smc70JOeX4JdzKJG/WsAkAN8H9d8uYo14Z6+5I1H
	 JZbn6H8/c6gUHqXf0lj7CZ48/0F22pEHdsfyCxtTQ3aynHSfeILGk9NWHS5n8EiunY
	 mAow2jhbeL9EUaQTLsOSKxLwEJDyETrXtXIALCqfENeR+4cchul24gF6rK+FOTtOsY
	 3v+c581R0BMKaHyUkZwx01Xza1MajTxPSDmHH6+M+hkO5nNgwUgEb1PDIL/T2wwIda
	 203FAZB8BZlgdIqZBK+6pu9Gv3Dt2KM2IWBivWZsgzh9ThJW1ox8krpJoW19XtIxRq
	 hpHJ/23wFGorA==
Message-ID: <sashiko-outbox-213293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] usb: typec: fusb302: Switch to device managed
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-3-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-3-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:21:26 +0000
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
- [High] usb: typec: fusb302: build failure when CONFIG_DEBUG_FS is
  disabled
--

commit a5e9f3a79e68305810f439c482d64544f3449258
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: typec: fusb302: Switch to device managed resources

This commit converts fusb302_probe() and fusb302_remove() to use
device-managed resources for mutexes, workqueues, debugfs, fwnode, TCPM
port registration, work items, and interrupts.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 83bd287dadc7e..a7a1dce6cf86a 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
[ ... ]
> @@ -210,20 +211,28 @@ static int fusb302_debug_show(struct seq_file *s, v=
oid *v)
>  }
>  DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
> =20
> -static void fusb302_debugfs_init(struct fusb302_chip *chip)
> +static void fusb302_debugfs_exit(void *data)
> +{
> +	struct fusb302_chip *chip =3D data;
> +
> +	debugfs_remove(chip->dentry);
> +}
> +
> +static int fusb302_debugfs_init(struct fusb302_chip *chip)
>  {
>  	char name[NAME_MAX];
> +	int ret;
> +
> +	ret =3D devm_mutex_init(chip->dev, &chip->logbuffer_lock);
> +	if (ret < 0)
> +		return ret;
> =20
> -	mutex_init(&chip->logbuffer_lock);
>  	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
>  	chip->dentry =3D debugfs_create_dir(name, usb_debug_root);
>  	debugfs_create_file("log", S_IFREG | 0444, chip->dentry, chip,
>  			    &fusb302_debug_fops);
> -}
> =20
> -static void fusb302_debugfs_exit(struct fusb302_chip *chip)
> -{
> -	debugfs_remove(chip->dentry);
> +	return devm_add_action_or_reset(chip->dev, fusb302_debugfs_exit, chip);
>  }
> =20
>  #else
> =20
>  static void fusb302_log(const struct fusb302_chip *chip,
>  			const char *fmt, ...) { }
>  static void fusb302_debugfs_init(const struct fusb302_chip *chip) { }
> -static void fusb302_debugfs_exit(const struct fusb302_chip *chip) { }
> =20
>  #endif

[Severity: High]
Does the !CONFIG_DEBUG_FS stub for fusb302_debugfs_init() also need to
return int (0)?  fusb302_probe() now assigns its return value to ret,
which fails to build when CONFIG_DEBUG_FS is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D3
