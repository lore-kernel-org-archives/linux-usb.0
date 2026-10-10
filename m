Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F0340A57
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607990; cv=none; b=fN1uqfGUVSpa1+AZoSMAnl3X311TZbFF42r+QhK5UX2UmYf6t1FwIGbCiuF9Vf2q6Ei1Xu0XnDgOjG6J/XdESmO9ow7qQtSTu4nO82GiaRCcVH/zoIopLhAHlQrLHSLzVubv3zqm6xfRP7atE2wb0CzzTjnMPYvOHwrsJr4cxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607990; c=relaxed/simple;
	bh=o1HyR/qlUL1/GuYR91KepsRgfRHpN4bSVh6aLQP3iYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmBNzxqZeGj81Gd3cgg2HeN3k+vQ0RfBeeCfF81oYvOf5oUC4IhvWVlnRLhLp/V/cFqeqyCp8dwC7PzwS2aLFLz5sqrB+wo3UgVO+lge2FH1wMGT5UT/0mNcMDlKoh81MDEH6aFGLyTfZogNfCjUJN3DEi6lQby3NBCQQD8Pxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Eks2CeTt; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=WHJ3wzfT; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Eks2CeTt";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="WHJ3wzfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607988;
	bh=o1HyR/qlUL1/GuYR91KepsRgfRHpN4bSVh6aLQP3iYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eks2CeTtxaPfpuCMTtdgDj0r7a4dQawKl1qJhrZ6SWoPotf7D2o6NIcuZbaR0rfLE
	 GQ+1AowG5rHNxrwM5ZQmbeSH0qHVqk8Td+xD2WsSqLa/M2fnzNNKKpv/lTsEQogQ67
	 V+7IZDdp0so49uz1TXRGsKM1TW5PQa3O5AxkzqVcmy5enm0W7VstFQTWnY32ltpube
	 XR5rqGxNRbRYy3xX5VaM7XGS9ArSwNZMy1zPMFdt2WqXIw5mvG+Ywo/BmHnMtg5eDu
	 nfGMeXD3E2a1G/yGSMu8pDdVlr75ntCSVEIfZEldjZZed5Y0UBWcZ5Cr/O7Tnirv+6
	 DhNZfmUMTfILg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 2F03A47535; Sat, 10 Oct 2026 04:53:08 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607987;
	bh=o1HyR/qlUL1/GuYR91KepsRgfRHpN4bSVh6aLQP3iYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHJ3wzfTLlzHN9hsf0UZpaD+F1q3HvqorUb5W1e4TTOewbq69Xa+ej1sHoiiZPdzx
	 VDx8b5419F4eWG2aBy60fK/c22ndtjlyCOvlS5p/lM97OQQMMZyjp7Qcu+elX6+Xtl
	 EUjZ1b3L+Be1MidJL+BTURr5ns3wYQdXihvFJmr2BZfsHPoYN4Cpm8UTzEWWzYhb8b
	 Z6mspVV7AEFKt9IL7Z6dEUOhArnJ4eF/rYEQ4UHjECUVNWFxMYDTH5xoToTzDlXcD2
	 oHU1jtebJfOOweaEGgS14uQ16AgIYqEopZQwq/csuCGATmRAK9+bSi14avM8yyB8bV
	 xcm0W2ocilB4w==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 3D7854751E;
	Sat, 10 Oct 2026 04:53:07 +0000 (UTC)
Message-ID: <5c9a28f8-2fc7-4178-bdb2-7322aa89c783@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-13-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164803@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164803@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] net: phy: ax88796b: missing 10M half-duplex cleanup causing mismatch
> - [Medium] net: phy: ax88796b: missing aneg restart when changing only 2.5G advertisement
> - [Low] net: phy: asix: Dead code in asix_ax88772D_get_features()
> --
> 
> commit 86e7d1e2ad82ba6062c7e69eccd21649d9c81f47
> Author: Birger Koblitz <mail@birger-koblitz.de>
> Subject: ax88796b: Add support for AX88772D, AX88179A and AX88279
> 
> This commit adds driver support for 100MBit, 1GBit, and 2.5 GBit PHYs
> found in ASIX USB-Ethernet controllers.
> 
>> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
>> index f20ddf6491499..99abb0af3296d 100644
>> --- a/drivers/net/phy/ax88796b.c
>> +++ b/drivers/net/phy/ax88796b.c
> 
> [ ... ]
> 
>> @@ -83,6 +96,107 @@ static int asix_ax88772a_read_status(struct phy_device *phydev)
>>   	return 0;
>>   }
>>   
>> +static int asix_ax88279_read_status(struct phy_device *phydev)
>> +{
> 
> [ ... ]
> 
>> +static int asix_ax88279_config_aneg(struct phy_device *phydev)
>> +{
>> +	bool adv_2500;
>> +	int ret;
>> +
>> +	if (phydev->autoneg == AUTONEG_DISABLE) {
>> +		phydev_warn(phydev, "Disabling autoneg is not supported\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	adv_2500 = linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->advertising);
>> +	ret = phy_modify(phydev, MII_ADVERTISE, AX_ADVERTISE_2500,
>> +			 adv_2500 ? AX_ADVERTISE_2500 : 0);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return genphy_config_aneg(phydev);
> 
> [Severity: Medium]
> Will this fail to restart auto-negotiation if a user only changes the
> 2.5G advertisement?
> 
> Because phy_modify() returns 0 on success, the changed state of the
> AX_ADVERTISE_2500 bit is lost. When the rest of the configuration is delegated
> to genphy_config_aneg(), it internally evaluates standard advertisement bits
> using a mask that excludes this custom 2.5G bit. If no standard changes are
> detected, genphy_config_aneg() returns without restarting hardware
> auto-negotiation, and the link partner won't be notified of the new 2.5G
> advertisement.
> 
> Could we check if the register was actually modified, perhaps by using
> phy_modify_changed(), and manually trigger a restart or pass the changed state
> to __genphy_config_aneg()?
Thanks for the suggestion! Wil fix as suggested.


> 
>> +}
>> +
>> +static int asix_ax88279_get_features(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
>> +	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
>> +
>> +	linkmode_set_bit_array(phy_basic_ports_array, ARRAY_SIZE(phy_basic_ports_array),
>> +			       phydev->supported);
>> +
>> +	ret = genphy_c45_pma_read_abilities(phydev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* AX88279 does not support reported 100baseT-half duplex mode */
>> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, phydev->supported);
> 
> [Severity: High]
> Does this code also need to clear the 10M half-duplex capability?
> 
> The read status function unconditionally forces phydev->duplex to DUPLEX_FULL,
> indicating the device only supports full duplex. However,
> genphy_c45_pma_read_abilities() populates both 10baseT_Full_BIT and
> 10baseT_Half_BIT. Since the 10M half-duplex bit isn't cleared here along
> with the 100M one, the PHY might still advertise 10M half-duplex capability.
> 
> If it negotiates 10M half-duplex with a link partner, could this lead to a
> duplex mismatch between the MAC (forced to full) and the link partner?
No, because the AX88279 does not support 10M mode. This was already
discussed in previous emails. Will not change.

> 
>> +
>> +	return 0;
>> +}
> 
> [ ... ]
> 
>> +static int asix_ax88772D_get_features(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
>> +	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> 
> [Severity: Low]
> Is the assignment to mmds_present needed here?
> 
> It seems this might be dead code, as genphy_read_abilities() and its helpers
> like genphy_c45_read_eee_abilities() do not appear to check the mmds_present
> mask to determine capabilities.
> 
>> +
>> +	ret = genphy_read_abilities(phydev);
>> +	if (ret < 0)
>> +		return ret;
> 
The code is needed as the mmds previously read are incorrect. This was
tested, and it does not work without.

Birger

