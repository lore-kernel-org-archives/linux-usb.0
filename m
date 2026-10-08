Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034021FF23
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430620; cv=none; b=cSAmnGtwkpQJLawTLpDbHeffsyvK/L+yy2tq5wZHJ0LK9XF9gVJxbrH0kdmIhVnR4a3RucnTRnI21HX/8zfyp405niYNFHATHh+lQsG7saa/21CkRjLUPVRTU0b4WvnbRfENZcxJIr2zyYZDBIJXs3zWLFF7cmgJ2iwjsjEmMRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430620; c=relaxed/simple;
	bh=Bu17OUBPm+ubQGdXqLA8OX3TRoauzbCDXFnc0a0nkRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7E1UOpxkqsxXTm2y57zVDnP9NxDRjX9vayWoLzrcngi8tTwusXNIIHQdTVDW3cMdy8DdrdseJttBvK0QJVWrMQVhzWyyG7yc2Y5hSAnlm++e0L3jF46CwbJjr2fvxFa0b9eH2mIXmFH7RDxXsFi5+aZq5oZkO8lpYns7d0jRNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=CK+Mw5yy; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=oxrv9/yZ; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="CK+Mw5yy";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="oxrv9/yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430618;
	bh=Bu17OUBPm+ubQGdXqLA8OX3TRoauzbCDXFnc0a0nkRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CK+Mw5yyS9ux2S6X5eROq45h13N0OqthQTijbDwp9Ro72fAoRXNI73kHK4j0nw1Ma
	 mLMm8z7q0UN7DFGiTaP19PJTdDQkxdKg1uvlv5n73clJMMz8bF8J4DESnK9N8fqJeR
	 LvbZOwzF5FomUijgvQqQnnCLbx9Ul8Zt9TjoGlYgcg7oIXmZZa3om+0s/SnmYvCjj5
	 Agfngclx5gY7rJKRdOcS/hvTCk3JiLdOzSfg3P+DxjGkVuXGm7sg5GJOtLyB1TBlQX
	 YgnfSaMYAyoYtsBkB1fGOrMEhBdJJc1tEhReG5Rg/Px3yCCWTop4C7FW7S6T3R+kEO
	 +QkDgEcCT4Whw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 0E7D4470D0; Thu,  8 Oct 2026 03:36:58 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430617;
	bh=Bu17OUBPm+ubQGdXqLA8OX3TRoauzbCDXFnc0a0nkRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oxrv9/yZ5oMaXhuYLJnwU9KEw66ouB/dta5vJSBcch4gZs+e5MDDX/BJnb21R05bt
	 fn9+y73/e7GToIOqxzd3uTGbIbNx0qxptegoqQx1pTZDVx9CLntJt2NP8+BiQHavyt
	 3wen7W57m227YZb9eKnO77BLPd9gxn2t69WI/hf6ogiEDsN/eCjiczYj+OURiFi7AU
	 opMVGsviOHTZC9Hj20n2YDq4nNEChn1+eJQt41ZogrO+BN85yhbhtXAUOZANSDOz4C
	 VOck5/blhknNxuISUUPZWFmNsWhrlnisAlsCU7tC2pwC0p0vmjX52TNbIGy1B6mIkO
	 dodNdBiXqWQnw==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 53CAB41186;
	Thu,  8 Oct 2026 03:36:57 +0000 (UTC)
Message-ID: <ddda58cb-f91d-4faa-b4c9-bb59e83256a6@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 02/13] phylib: Add support for PHYs with
 broken forced mode
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-2-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162611@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] phylib: NULL pointer dereference in phy_ethtool_ksettings_set()
> - [Medium] phylib: Userspace can bypass PHY_BROKEN_FORCED via SIOCSMIIREG
> --
> 
> commit ba73f96bed1d2e99a191c06a9e1fb6f1fd49beef
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
>      phylib: Add support for PHYs with broken forced mode
>      
>      Add support for PHYs which only supported auto-negotiated
>      speed modes. This prevents a kernel warning and stack-trace within the
>      phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
>      because they do not support forced modes.
> 
>> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
>> index fce9bc7be3304..b83f938fe7c3b 100644
>> --- a/drivers/net/phy/phy.c
>> +++ b/drivers/net/phy/phy.c
>> @@ -1190,6 +1190,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
>>   	      duplex != DUPLEX_FULL)))
>>   		return -EINVAL;
>>   
>> +	if (autoneg == AUTONEG_DISABLE &&
>> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))
>> +		return -EOPNOTSUPP;
>> +
> 
> [Severity: High]
> Can this unconditionally dereference phydev->drv when it might be NULL?
> 
> If a PHY driver is unbound (e.g., via sysfs), phy_remove() sets
> phydev->drv = NULL but does not detach the PHY from the net_device. A
> subsequent call to ethtool -s ethX autoneg off reaches
> phy_ethtool_ksettings_set(). The newly added check accesses phydev->drv
> without verifying it is non-NULL, which can cause a kernel oops, allowing
> a privileged user to crash the system instead of receiving a graceful error.
> 
> Later in the same function, _phy_start_aneg() correctly checks for
> !phydev->drv.

Will fix and change to
         if (autoneg == AUTONEG_DISABLE && phydev->drv &&
             (phydev->drv->flags & PHY_BROKEN_FORCED))
                 return -EOPNOTSUPP;


> 
> [Severity: Medium]
> Does this fix fully prevent userspace from bypassing the check?
> 
> While this patch aims to prevent a WARN(1) and stack trace in
> phy_state_machine() by blocking AUTONEG_DISABLE via ethtool for PHYs with
> PHY_BROKEN_FORCED, userspace can still bypass this via the SIOCSMIIREG
> ioctl.
> 
> By writing to MII_BMCR and clearing the BMCR_ANENABLE bit, phy_mii_ioctl()
> intercepts it to unconditionally set phydev->autoneg = AUTONEG_DISABLE
> without checking the new PHY_BROKEN_FORCED flag:
> 
> drivers/net/phy/phy.c:phy_mii_ioctl() {
>      ...
> 					phydev->autoneg = AUTONEG_DISABLE;
> 					if (val & BMCR_FULLDPLX)
>      ...
> }
> 
> When phy_state_machine() subsequently runs and calls _phy_start_aneg(), the
> driver will return -EOPNOTSUPP, and phy_error_precise() will trigger the
> exact same WARN(1) the patch intended to fix.
> 
>>   	mutex_lock(&phydev->lock);
>>   	phydev->autoneg = autoneg;
>>
> 
Will fix and add further check in phy_mii_ioctl() for PHY_BROKEN_FORCED:
if ((val & (BMCR_RESET | BMCR_ANENABLE)) == 0) {
         if (phydev->drv &&
             (phydev->drv->flags & PHY_BROKEN_FORCED))
                  return -EOPNOTSUPP;
         if (phydev->autoneg == AUTONEG_ENABLE)
                  change_autoneg = true;

Birger


