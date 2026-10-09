Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D0478E38;
	Fri,  9 Oct 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531383; cv=none; b=rAkSxRKViksJVX1kfHgBD0SPis5URi3V213sr1KbHJpeG2CnRkeoanOllgLGOq3606V40lS39deyNXinvwMsrAfPL3Goam1aAVJKR/VAvTHhrnAq9WaDghMohbQEFBJaaO7u+rB16ZGf7Hak/Tjjv89C+ykdGwMkeWZgLp8j4gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531383; c=relaxed/simple;
	bh=Y5GqP6sq+0qwv5rhOAYO0yKLRsgBzFuyw72QgvQ79RM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kbmEZATskpP+cjYgJ7WNpfvNufPyg07rlhlDWMypvQ9P3gGSl3NJ578XU8bSZ8lIGfyb1x1GA9JYJxdgfXnySD/Y6zLLVNKG5d4PNLEIxX3fpKMV1s/r7YcXqfnlLsbW55W7UZrR68m9z+rBy01inOY6QfvRV4nhnEeY/iShZL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abQHJh6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abQHJh6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA691F000FF;
	Fri,  9 Oct 2026 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531382;
	bh=Kw8bznOlpVSvSsHbjC8DY/6stkYjOzrWxWMBKXU/JiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=abQHJh6YvjHHXnKNu6MMmSPRz7lEHqcipOqvqpmb0q0JHeRka+zjH8BJAtN/xWIrE
	 qLCkUsh2OTQHmNNSmQzPNAINhOeNldaP8ZKlWa3AODaNSyBqPFJzkoJza+INYTXKWl
	 XUjZhwZXqkZYxftU1x/wIJw761LK/PNuVpcZq4WGuDhM0ZSWyZluBcOkqA6Fh80H2h
	 Y+wKrNqGUB7+uFuQlubqTUEgTp7vblkZCOCl9wtwMjZTwPLiclKpONku5zI119FNsl
	 2FFP2pEJxsXqXW3JP9Gh6Cr01zThWE1N1YoC+UwwtcLEs4oUVw1rd5ksAJjt3bCGop
	 hQvP2CsQVlqOw==
Message-ID: <sashiko-outbox-165013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-2-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-2-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:36:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: chipidea: redundant struct and memory allocation for ci_hdrc_u=
sb2_priv
--

commit a1804027a297ffe7216fa43c74cdb463efa0f512
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

usb: chipidea: usb2: use devm_clk_get_optional_enabled()

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index 8ffa1e95d8e86..9cef902f36b37 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -20,7 +20,6 @@
> =20
>  struct ci_hdrc_usb2_priv {
>  	struct platform_device	*ci_pdev;
> -	struct clk		*clk;
>  };

[Severity: Low]
Does this code still need a wrapper struct now that it only contains a
single pointer?

[ ... ]

> @@ -70,15 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device =
*pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	priv->clk =3D devm_clk_get_optional(dev, NULL);
> -	if (IS_ERR(priv->clk))
> -		return PTR_ERR(priv->clk);
> -
> -	ret =3D clk_prepare_enable(priv->clk);
> -	if (ret) {
> -		dev_err(dev, "failed to enable the clock: %d\n", ret);
> -		return ret;
> -	}
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get or enable the clock\n");

[Severity: Low]
Could this devm_kzalloc() for the priv struct be eliminated? Since the clk
pointer was removed from ci_hdrc_usb2_priv, the single ci_pdev pointer
could be stored directly using platform_set_drvdata() in
ci_hdrc_usb2_probe(), avoiding the unnecessary heap allocation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D2
