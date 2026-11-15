Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794719412;
	b=syZEZr+GZn5OyBvaeYMUcAvLiJWnuQkafPh1McS+E/mJoCQ+hQANUy0QR3RcFC5qUP3o
	 S98qYyxFi4UaxQn6L9f3qa4ec7fFKkDZhIJ4+A2YNks6C+UwgQv4TekLfxRgWV2mgDmjO
	 jkQlA2nWfEKOgrezwBi2yIyoO9rekwoKKggFXypSL4coISn1ph5kDQOQBGzxIXGft2Tes
	 apU1E8l7BU5Nr6X4xkSTSNTplssv2R9KTjLBCcKWxp+Ue6Klqad0X0U1ssYbk8us1bcqh
	 MZpxHPOqhMlLTIa9nY89/9GBwNkwivPjyyXY84C16Vd6qtqkAxojNMK4dsU6F4GKJGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794719412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+eO3bCKFuQt12W21iEE0yig9iRXVvKnboLbDJuv6gQs=;
	b=xwKvMtV3nvRY74W7h8INSgZefll8g8WXuBNaS4q5YOaKQxxQVajFfl+1h/clL+pREd4W
	 w4FEfuANLFZtX6ThPtjw0mcKOUeCx6G/QMAdNwE9OwTypVrdqu8WBc+UCvnNkHdMc02MV
	 rKmEQ8g0+9ab2CbFQBCWpTR1gJmeeV1+hv+7ZNcAxF1O2upG8SFjuDk+Szymc9Jkz8lA6
	 LLJGO5VWjSID3ZVfq7kNCmL1D83izQeOUfb5C1/ohndNe7Brx4caAcS34qDP+/Qkjd4f0
	 m61g0LW+e4U9g5cyHuHIm3D3z0KAE9LckSC6bfjND0htLEcXCtpbAYrjQ2KLbFN3cNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDxvrIRH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AAD606A323
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDxvrIRH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949611F000C4;
	Sun, 15 Nov 2026 05:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794719411;
	bh=+eO3bCKFuQt12W21iEE0yig9iRXVvKnboLbDJuv6gQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDxvrIRHPZ1qw0GKyYt+vaq+cehkUrbm/+L3aftojo5alvBebL2FcDN+/wO22DFVr
	 wPLWmn/1SoFcXiqDfWqGBBcpDEB/ganVp+ZmHz0gow00s+bFzIKe3nrI9d7dCTayGS
	 ewY+4SbUjKNSwHGq6RWhHc8k1jg8y3xRy8An0FXXGgHFWGCPXmB3QNnvML4sXwBang
	 AGwTr4psZ8hHaQ4bWTGG28Ky3IXbQ2sk/fVm19aq+No9tHOlCN0h4D5rhrH/Y9qWwf
	 OaJ74A3RMSKolJ2S3AgqjOyLxUqehtphfiWH1a2Veyne7m1FKc9wqEyr59ekU/XDoi
	 5MCPMbjlu2xIw==
Message-ID: <sashiko-outbox-215232@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114050954.275495-2-artem122novak@gmail.com>
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-2-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 05:10:11 +0000
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
- [High] net: usb: smsc95xx: smsc95xx_mdiobus_reset() returns 4 on
  success
--

commit 2539b52a07146a1a92198f65c494924038af75bf
Author: Artem Novak <artem122novak@gmail.com>

net: usb: smsc95xx: propagate MDIO reset errors

This commit changes smsc95xx_mdiobus_reset() to return ret instead of 0
so that register access errors during external PHY reset are propagated
to callers.

> diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
> index 130a460c1f546..f85ee5f8a5394 100644
> --- a/drivers/net/usb/smsc95xx.c
> +++ b/drivers/net/usb/smsc95xx.c
> @@ -291,7 +291,7 @@ static int smsc95xx_mdiobus_reset(struct mii_bus *bus)
>  reset_out:
>  	mutex_unlock(&dev->phy_mutex);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int smsc95xx_mdiobus_read(struct mii_bus *bus, int phy_id, int id=
x)

[Severity: High]
Does smsc95xx_mdiobus_reset() now return 4 on success for devices with an
external PHY?

smsc95xx_write_reg() returns the number of bytes written (4) on success,
and ret is not reset to 0 before reaching reset_out.  __mdiobus_register()
treats any non-zero return from bus->reset() as an error and returns 4 to
smsc95xx_bind(), which unwinds and frees pdata (leaving dev->driver_priv
dangling) and returns 4 to usbnet_probe().  Because usbnet_probe() only
aborts when status < 0, probe continues and registers the net_device with
a freed dev->driver_priv and a NULL phydev, leading to a use-after-free
in subsequent driver callbacks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114050954.2754=
95-1-artem122novak@gmail.com?part=3D1
