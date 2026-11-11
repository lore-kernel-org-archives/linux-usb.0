Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367519;
	b=aosiZ3hCA3RpgKWx0K52mKnWmkqHSnyYHWbgyPAEqSWlrY9J4F99PEUBko58RAo+BZGI
	 OAJAcbVHASNKo85QXI9K6hq3kiGDGcLro7A1MglUuoF9TepJBTCwFE6ziD++Kwpphxi4W
	 vlN7hsON9dgWJABfW/gCRrxhkVYwefJR2QZ6evJL5Bk336XqoopK6qzD7fmM6bLMOTTV9
	 +nYkCjMvBNP+fOgyLuNn7dyIcHHq/Hd2f+1pf/gs3H38GntkEfbqO4X9kBYa+8KQ/4jVq
	 trO8r3IvIQ3+Zq31PUirqWqI1e30NFJN3xBtp03HVP6rvkrzUtw5zPtm+E5xSFAmUzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=55qZ96zW1ghShQzNxvblT6n7sbaS8mfCedieZ2qeiik=;
	b=OgAJVjWeu5RN4qkQt0DYY8q+MP9CFCgDyj3MgF7MD3WQxHjTR75w36aUCVna0R9tqXuZ
	 7PqPVUP3Ajhgx8aZmYMTi7FyAxwAXBEUYGKrXB0QXK0NoAqaD++ndETKfsOilvaRaJhGY
	 yshDu5Eqi7k4WipRpZVorNN5dbMlOtdfVtwO6fIxNRAZx2NPizaMZQ3fW9JDfQsDfb+U6
	 yf9NBKIdta6yN5+WzrI0qQmyHyfHbSquv3QFUSwiVV+cJO06MamXoyp7VGl32fjjZ1COH
	 jJ2gNqmP1PFhGXwDHzPbY2Eo/VYXJ/T11UsLJqvLEPBJHvPJNJTbbWhgsp2J4TORxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktoEzwNV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57760A2611
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktoEzwNV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA491F0089F;
	Wed, 11 Nov 2026 03:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367519;
	bh=55qZ96zW1ghShQzNxvblT6n7sbaS8mfCedieZ2qeiik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ktoEzwNVRwXAj/7j0m6oSpKEg7ar1uvlifTjK+wZz1DGOatWL8pQBlwYLWwFZtUnf
	 5gI047O5pnJBThSyWtG6UdVaBJE1++l0JRfbzoLIHII/9RM2sn7KbRDGwXUXWXm17b
	 K0N6oWYehvWHddoJLE7ehWDitscceX3VuQFCw01x8ehI1jsXWV0R7k1nP8tu/ia85c
	 /paaORHDhxmasF7sF++9ysK+AMA6P/pbgrtt4aNWtKY1NqT217zW0l6uBIIq7Kzfqi
	 e9E47nZABLUpaBqL3StDVnQIO/i+EsbJMw7k+I3w6X8vYiqzQl3nYwBkTA9vLGy4fn
	 u3x5zyWOIAHpw==
Message-ID: <sashiko-outbox-208191@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-11-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-11-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] r8152: unchecked negative error from r8152_mdio_read() in
  set_carrier()
- [Medium] r8152: negative errnos returned by read_mii_word() to MII
  library
--

commit 1177dcaa1f0b492777f7f7b3e3e9ddb3fee5ac11
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: add TGPHY register access for RTL8157 and RTL8159

This commit adds TGPHY register access hooks for RTL8157 and RTL8159 and
updates PHY register accessors and their callers to return and handle negat=
ive
error codes on failure.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index fad4473caf2a4..703ec5483778b 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -1669,16 +1680,33 @@ static void ocp_reg_write(struct r8152 *tp, u16 a=
ddr, u16 data)
> =20
>  	ocp_index =3D (addr & 0x0fff) | 0xb000;
>  	ocp_write_word(tp, MCU_TYPE_PLA, ocp_index, data);
> +
> +	return 0;
> +}
> +
> +static int ocp_reg_read(struct r8152 *tp, u16 addr, u16 *data)
> +{
> +	return tp->rtl_ops.phy_read(tp, addr, data);
> +}
> +
> +static int ocp_reg_write(struct r8152 *tp, u16 addr, u16 data)
> +{
> +	return tp->rtl_ops.phy_write(tp, addr, data);
>  }
> =20
> -static inline void r8152_mdio_write(struct r8152 *tp, u32 reg_addr, u32 =
value)
> +static inline int r8152_mdio_write(struct r8152 *tp, u32 reg_addr, u32 v=
alue)
>  {
> -	ocp_reg_write(tp, OCP_BASE_MII + reg_addr * 2, value);
> +	return ocp_reg_write(tp, OCP_BASE_MII + reg_addr * 2, value);
>  }
> =20
> -static inline int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
> +static int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
>  {
> -	return ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2);
> +	u16 data;
> +	int ret;
> +
> +	ret =3D ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2, &data);
> +
> +	return ret < 0 ? ret : data;
>  }

[Severity: Medium]
Does set_carrier() also need to check for a negative return value from
r8152_mdio_read()?

drivers/net/usb/r8152.c:set_carrier() {
	...
	if (r8152_mdio_read(tp, MII_BMSR) & BMSR_LSTATUS) {
		if (!netif_carrier_ok(netdev)) {
			tp->rtl_ops.enable(tp);
			netif_stop_queue(netdev);
			napi_disable(napi);
			netif_carrier_on(netdev);
	...
}

When a TGPHY read of MII_BMSR fails on RTL8157 or RTL8159,
r8152_mdio_read() returns -ENODEV (-19, 0xffffffed) or -ETIMEDOUT (-110,
0xffffff92 on x86).  Because -ENODEV has BMSR_LSTATUS (0x0004) set,
set_carrier() treats an inaccessible device as having link up and calls
tp->rtl_ops.enable() and netif_carrier_on(), whereas a transient
-ETIMEDOUT with BMSR_LSTATUS clear tears down an active link.

[ ... ]

> @@ -1822,7 +1866,10 @@ static int read_mii_word(struct net_device *netdev=
, int phy_id, int reg)
> =20
>  	ret =3D r8152_mdio_read(tp, reg);
> =20
> -	return ret;
> +	/* The MII library takes the return value for register content,
> +	 * so a failed read must not be passed on as an errno.
> +	 */
> +	return ret < 0 ? 0 : ret;
>  }

[Severity: Medium]
As reported by Jakub Kicinski on v7 [1], can read_mii_word() still return
negative errnos to the MII library through its early checks?

drivers/net/usb/r8152.c:read_mii_word() {
	struct r8152 *tp =3D netdev_priv(netdev);
	int ret;

	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
		return -ENODEV;

	if (phy_id !=3D R8152_PHY_ID)
		return -EINVAL;
	...
}

If the first MII_BMCR read in mii_ethtool_get_link_ksettings() fails a
control transfer and latches RTL8152_INACCESSIBLE, read_mii_word() returns
0 for MII_BMCR, but the subsequent MII_BMSR, MII_CTRL1000, MII_STAT1000
and MII_ADVERTISE reads hit the early check and return -ENODEV (0xffffffed),
which the MII library decodes as register bits with link and advertising
flags set.  Likewise, calling mii_nway_restart() while RTL8152_INACCESSIBLE
is set sees BMCR_ANENABLE (0x1000) set in -ENODEV and returns 0 instead of
-EINVAL.

[1] https://lore.kernel.org/r/20261021005213.1255035-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D10
