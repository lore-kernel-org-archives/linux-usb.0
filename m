Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1EC4CE672
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052440; cv=none; b=GMpiPPLyn/M/agNfCe/LbffAPpnbm76jQVm1zDwG8WC3W0hMLBAEYzIrLptySIUV29wRgfnYsqBObyoXOCnXdPRXtuW3bTC/JJ6mmHCs6o+oola5aewXGJgpO5N2HDePCXW7bCGz82galSsb3d8cVlIegny5T6rYJ3J2BEmdz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052440; c=relaxed/simple;
	bh=iiJlKl0BV+FvVDrFJdZeR9l623Tz54AffTcjwFPilzk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=K7Tr8fvExh/c9Z6GkeHN8xFpxJj1RBhVGS6RPIeas4+TtAthIwQQsa4e5T8z2M0yCQ58EaAJCi4D1Rku7MJs7jXMxOsCUzmW3M9qrP4d4BlVTWWHzKOKEFUDrHrcWFLmUQFA1z+OCqiH0Jq0KxcNKH/5GHSt50KQgA//nuZD7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gviUadJa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gviUadJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D71F000C8;
	Thu, 15 Oct 2026 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052437;
	bh=Vj47aobbG6Eo9hy9iKdjz+0t8DbkmzNlCCYXYUi0cLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gviUadJaA1XA1blKyG3dHvAg7fw/WHUrC811eh0BkQAj280xZ5fovCseTKcFLhr8C
	 ghM/LMqrAPkdYN666nYLw07g7ZIVAA9BDRBQQd2nz219MrhrDt85KjiPTUbCOuw22a
	 F8Bxbu15pbjcyOcYrCCdmJzJqTVzJydNolvI8zPbHNQeBzMamnD6XqTmSPgev/trcS
	 4ZNVWILrdtT3Vug8twNqTsKBFAWrI0F70ojbFU9cH5SHK8zKGsznH+sUStGp+u+iBg
	 D0kqv6u7QeG6B02dSKVFcNbaECoEoYOb+Y0dSbulfSemRf3y+BkM+/tjfmnoXPX9vF
	 6EHVL2byzs8gQ==
Message-ID: <sashiko-outbox-172466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 08/10] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-9-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-9-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: mii: corrupted PHY write-backs on negative error codes
--

commit 2f3d9bfec100e921469b287bd26fd9b2d7f8a3db
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>
Subject: r8152: add TGPHY register access for RTL8157 and RTL8159

This commit adds TGPHY register access for the RTL8157 and RTL8159 chips.
It changes the r8152_mdio_read function to return an int so that TGPHY=20
hardware timeouts can return negative error codes.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 558ccb4682c27..7c0de56266963 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -1664,16 +1675,33 @@ static void ocp_reg_write(struct r8152 *tp, u16 a=
ddr, u16 data)
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

[Severity: High]
Does this code inadvertently corrupt PHY settings during a read timeout?

The commit message notes that the MII library callbacks still ignore the=20
status and need care, but propagating these negative error codes introduces=
=20
an immediate regression.=20

When r8157_phy_read() times out, r8152_mdio_read() returns -110=20
(-ETIMEDOUT). This negative value propagates through read_mii_word() to=20
the standard MII library without being sanitized.

For example, it can happen in mii_nway_restart():

drivers/net/mii.c:mii_nway_restart() {
    ...
    bmcr =3D mii->mdio_read(mii->dev, mii->phy_id, MII_BMCR);

    if (bmcr & BMCR_ANENABLE) {
        bmcr |=3D BMCR_ANRESTART;
        mii->mdio_write(mii->dev, mii->phy_id, MII_BMCR, bmcr);
    ...
}

Because -110 is 0xFFFFFF92 in two's complement, the bitwise check=20
bmcr & BMCR_ANENABLE evaluates to true (0xFFFFFF92 has the 12th bit, 0x1000,
set).=20

The callback then incorrectly ORs BMCR_ANRESTART (0x0200) and writes the=20
corrupted value (0xFF92) back to the MII_BMCR PHY register. This=20
inadvertently triggers the Reset (0x8000), Loopback (0x4000), and Power=20
Down (0x0800) bits, turning a transient timeout into a persistent link=20
failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D8
