Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461F2FD69E
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606810; cv=none; b=OC5tZQle167CRpdvJnzxR0jlKZXM1TRDYDwvk0xlIEMRkwHD0pEi1b9eNLY9gAAFwugLGQyQ7HJERMPlvddkU4nt3gPlS2fcCXQFf7de7lMG09x0CkyvriIp8Lvst6iI9R3A4gWNnX55IhtFDn61kp+8GlLAXndwWUY0QLC7X1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606810; c=relaxed/simple;
	bh=8DE4c964Q/7pyRF8bk5kdr3ZmTa3IhcODEm0cD+S6dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7hCnVy1Xdjl60O0crmZW/+qIgIIwcvPUFOWJka4WPG/oIDDN0DxK2iIklyi4Q54WdyUIs2GFNozxauUzS17oCv6YgzeQx/gbLsCg77gSDJoAR6doKHXaTURCLtVxoij0bvn0F//cNK9hdYzzlJuwmgsAGynrTNYm5s+MP1kKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=mtOUCc5j; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=S+TM6lvn; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="mtOUCc5j";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="S+TM6lvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791606800;
	bh=8DE4c964Q/7pyRF8bk5kdr3ZmTa3IhcODEm0cD+S6dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mtOUCc5jp14zUX01kR/0nN65fX0YUU51EtYXbWVhkNWqz8e0O0mVX6L/xjWxlqJRi
	 NZbuJ61RfqYXMxcFDRITynhuf9V3Non5/iK4OlLZM6XuMFpAlBVvfga3V+r7lnkjom
	 C/+gMaYIAxZX/H7L6k/JWkSPTc8LyraxFqDUPNpr3qrl6UYLVnonzLWlFRaG8w5HVr
	 NKYRmhk2hJkmH/wv18uOe58jgG//ykcbJXIv2LRnPh/pTEltZQPRjbjxyexiIhLi0L
	 2m8zuBzzsDFBPzlYJgnEwwP65kH2dsCbVPN6c61JHXYd7s7tBO/WynbTIGApXDSAAZ
	 G72mAUEePKjbQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id DD82047535; Sat, 10 Oct 2026 04:33:20 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791606798;
	bh=8DE4c964Q/7pyRF8bk5kdr3ZmTa3IhcODEm0cD+S6dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+TM6lvnHsFD8vQ6lqWoDo9WEgrKnZ2oaFLF69wbR2VCQ+j/1Z6E9PSw6BSMB+1G2
	 X62WZHjE69IPCPixNWdLEhXGv2QNaycz2HQP6nGUpscn0sGNgwr6Z57TECuBP+0lzX
	 7qfUJanRL4ju246f5exoz1FnmE8gq4E09AbA6sCu8k7voe1SwzIbLH/coh1bU9s0ry
	 ULy7iNT/WP6h3CkG3bIEXi0wKTi3uvaPWu9Tm5Xhor4PFNGsaMV7arsj0yXw5NGXE5
	 EEksbIGeDIyahQb6NFk7gdZ+KnLqmvpq46AaUj0ORLNoYPNsVk1fMQbuaJ4VBjlwgk
	 rGun76iZ/uK/g==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 7744B4751E;
	Sat, 10 Oct 2026 04:33:18 +0000 (UTC)
Message-ID: <2b916dbb-ac97-4267-95d3-a74085576a0a@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 02/13] phylib: Add support for PHYs with
 broken forced mode
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-2-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164798@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164798@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] phy: TOCTOU race allowing NULL pointer dereference in phy_mii_ioctl and phy_ethtool_ksettings_set
> - [Medium] net: phy: data race modifying bitfields in phy_mii_ioctl
> - [Medium] net: phy: SIOCSMIIREG C45 writes misinterpret MMDs as C22 registers
> --
> 
> commit 38a1dbebb552f1b80a0aa4bb3db03459a68b3811
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> phylib: Add support for PHYs with broken forced mode
> 
> This adds support for PHYs which only support auto-negotiated speed modes,
> preventing a kernel warning and stack-trace when PHYs return -EOPNOTSUPP
> from config_aneg() for forced modes.
> 
>> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
>> index fce9bc7be3304..079c53516f424 100644
>> --- a/drivers/net/phy/phy.c
>> +++ b/drivers/net/phy/phy.c
>> @@ -354,6 +354,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
>>   			switch (devad) {
>>   			case MII_BMCR:
> 
> [Severity: Medium]
> Does this switch statement evaluate Clause 45 MMDs against Clause 22
> register macros?
> 
> In phy_mii_ioctl(), devad contains the MMD for C45 writes:
> 
> 	case SIOCSMIIREG:
> 		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
> 			prtad = mdio_phy_id_prtad(mii_data->phy_id);
> 			devad = mdio_phy_id_devad(mii_data->phy_id);
> 
> If a user issues an SIOCSMIIREG ioctl targeting a Clause 45 PHY and
> writes to MMD 4 (PHY XS), devad will be 4. Doesn't this hit the
> MII_ADVERTISE case below, incorrectly corrupting phydev->advertising?
> 
> Additionally, will the newly added logic here improperly intercept C45 writes
> to MMD 0?
> 
>>   				if ((val & (BMCR_RESET | BMCR_ANENABLE)) == 0) {
>> +					if (phydev->drv &&
>> +					    (phydev->drv->flags & PHY_BROKEN_FORCED))
> 
This is pre-existing: Will not fix.

> [Severity: High]
> Can the compiler double-fetch phydev->drv here without locks, risking a NULL
> pointer dereference?
> 
> If an asynchronous driver unbind occurs via sysfs:
> 
> echo <phy_id> > /sys/bus/mdio_bus/drivers/<drv>/unbind
> 
> This calls phy_remove(), which clears phydev->drv to NULL without acquiring
> phydev->lock. Could the second fetch of phydev->drv in the condition above
> yield NULL, leading to a kernel panic when dereferencing flags?
> 
>> +						return -EOPNOTSUPP;
>>   					if (phydev->autoneg == AUTONEG_ENABLE)
>>   						change_autoneg = true;
>>   					phydev->autoneg = AUTONEG_DISABLE;
> 

The code pattern with if (phydev->drv && phydev->drv->something)
is found at least 2 dozen times in this file: the window for something 
bad to happen is impossibly small and very likely non-existent because 
the processor fetches the pointer and then just uses it, independent of 
it being cleared elsewhere.
Will not fix.


> [Severity: Medium]
> Is it safe to modify phydev->autoneg and phydev->duplex locklessly here?
> 
> These fields are part of a bitfield block in struct phy_device:
> 
> 	unsigned autoneg:1;
> 	unsigned link:1;
> 	unsigned autoneg_complete:1;
> 
> phy_state_machine() modifies adjacent bitfields (like link and
> autoneg_complete) asynchronously while holding phydev->lock. Because they
> share the same memory word, could this lockless assignment in phy_mii_ioctl()
> cause a read-modify-write race that silently overwrites the state machine's
> updates?
> 
> [ ... ]
>> @@ -1190,6 +1193,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
>>   	      duplex != DUPLEX_FULL)))
>>   		return -EINVAL;
>>   
>> +	if (autoneg == AUTONEG_DISABLE && phydev->drv &&
>> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))
> 

This is pre-existing: Will not fix.

> [Severity: High]
> Similar to the check in phy_mii_ioctl(), can the compiler double-fetch
> phydev->drv here before phydev->lock is taken?
> 
> If phy_remove() clears phydev->drv concurrently, could the second load yield
> NULL and cause a dereference crash?
> 
>> +		return -EOPNOTSUPP;
>> +
>>   	mutex_lock(&phydev->lock);
>>   	phydev->autoneg = autoneg;
> 

Pre-existing: will not fix.

Birger

