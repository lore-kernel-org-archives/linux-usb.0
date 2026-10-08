Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C183AFAFF
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431405; cv=none; b=K23oMsfOwaAIPH6CZ3eCBgWl5M7ahiPQMv1Hy9YE+LQqdq2dqnq3UjqS4g2hKzdVBbpBnB710fPt8JPLJbnfSoXjRXChnKIiwJE9JMSZvEQv5LzkU0AD8U9D+KmcInF00kIXMeJEOiJuppVLDOlPBn+xVK7QzdNZk4qZdnAEF0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431405; c=relaxed/simple;
	bh=sXjhqX4Rq0lbemctj5ReUantxgMqmL3YZoqxhWKW11o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pP/U3oG6oUR4WrwOb8x4ESlFa+yqoKTtadulfZpLVrOxvQgFFITm3Wr9J+k0ux7JBpWHjB/3Jb4jxiHwslUh11EN0HcS9e7M9a8a3RlFYyDRSW4nbVyElKkL78pkijjliYa4Zsc27xe2KOTq+loIxwO78nu6TwZ3oe4nCnSd/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=E3uMWB1f; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=T4ula9/A; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="E3uMWB1f";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="T4ula9/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431402;
	bh=sXjhqX4Rq0lbemctj5ReUantxgMqmL3YZoqxhWKW11o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E3uMWB1fObc7dANKIuUBUCQJVBsACvQBsZCfEfTtjR8Na401VakMdIIy+dIVYQSVM
	 fwPWYGZv1iImfkWfErPGT61sFDJ8XOX6PSBNbrLCektAwqDV1rQWbM2lUfBeaA5Ba8
	 PF6FoFZmMTmtqnYLSE5Qnurh4JF4zhqEp7bbWl4XZx3h9owJsOWFDAWLSeaIxaas9O
	 A6YMUCKPWfq4hnTa4fu2a52f+lqrBBZTz3eow+qhJcgUnkuY5kqVI4xF6MX2U70Ezb
	 ty3PN/QDr/4jKNthSMwQnbniObxJgMrf9PoYB3CIs+oqdQuwOsbjn9KGV29vLq4VS7
	 3//r3i+2pa+wg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 38247470D0; Thu,  8 Oct 2026 03:50:02 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431401;
	bh=sXjhqX4Rq0lbemctj5ReUantxgMqmL3YZoqxhWKW11o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T4ula9/AcrYWj8ca7sEyzl2j9ThZIkvjp291bU7QmQ72puAGcVjgZf0q8VkL5ihiw
	 qnfUN/XnX49yrZ+W0/bBi8W3qb38sw8yTtDa3HnOKRLIKyX20HNVQAl5eiV9GigMMH
	 zVPmv/VhX9X4c0ef0guC7swbLl8pnuAZaoO6oxxy9/q0NKcpTadc2uSGiimymJ9B1P
	 HqJ995BKbSkH0/oI9zAV0pVxDe7iF5kweymgZJc+P1zjvOx/gMsWkWguIYzbOWY0J6
	 HsM2GyompjPx9k00SVmlv+Db53bTwfENRAaVf4YHqPD8aB1O0Wz9GABcYN8ezyOHyi
	 t+XmmCo4xVhLA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id EBD7D41186;
	Thu,  8 Oct 2026 03:50:00 +0000 (UTC)
Message-ID: <40552310-3cfe-4268-aa3d-d10c24b971d8@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-13-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162613@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162613@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: phy: ax88796b: missing aneg restart and race in asix_ax88279_config_aneg
> - [Medium] net: phy: ax88796b: incomplete clearance of 1000baseT capabilities for AX88772D
> --
> 
> commit bc582050068fafd1fce54d8108ca8616b6ee048a
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88796b: Add support for AX88772D, AX88179A and AX88279
> 
> This commit adds support for the AX88772D, AX88179A and AX88279 PHYs found
> in ASIX USB-Ethernet controllers. It introduces vendor-specific configuration
> and status reading functions to support 100MBit, 1GBit, and 2.5GBit link modes.
> 
>> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
>> index f20ddf6491499..a427292759a24 100644
>> --- a/drivers/net/phy/ax88796b.c
>> +++ b/drivers/net/phy/ax88796b.c
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
>> +	ret = genphy_config_aneg(phydev);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	adv_2500 = linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->advertising);
>> +	ret = phy_modify(phydev, MII_ADVERTISE, AX_ADVERTISE_2500,
>> +			 adv_2500 ? AX_ADVERTISE_2500 : 0);
>> +
>> +	return ret;
>> +}
> 
> [Severity: High]
> Can this ordering cause autonegotiation to either miss a restart or race
> with the 2.5G advertisement update?
> 
> genphy_config_aneg() evaluates changes and restarts autonegotiation
> immediately if required. Modifying MII_ADVERTISE afterward bypasses the
> change detection for the 2.5G bit and races with the already-started
> autonegotiation.
> 
> Would it be better to check for changes to both standard and custom bits,
> apply all register modifications, and only then restart autonegotiation?
> 
Will fix by inverting the order of bit-setting and autoneg.

> [ ... ]
> 
>> +static int asix_ax88772D_get_features(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
>> +	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
>> +
>> +	ret = genphy_read_abilities(phydev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* AX88772D does not support reported 1000baseT mode */
>> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, phydev->supported);
> 
> [Severity: Medium]
> Does this completely clear the errantly reported gigabit capabilities?
> 
> genphy_read_abilities() reads MII_ESTATUS and can also populate
> ETHTOOL_LINK_MODE_1000baseT_Half_BIT and
> ETHTOOL_LINK_MODE_1000baseX_Full_BIT if they are present.
> 
> Since this is a 100MBit PHY, should all gigabit modes be explicitly cleared
> to prevent broken autonegotiation if the remote link partner attempts to
> negotiate them?
> 
>> +
>> +	return 0;
>> +}
> 
Will fix by additionally clearing the bits for the other 1G modes.

Birger
