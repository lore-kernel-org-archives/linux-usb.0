Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C181DA57
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431249; cv=none; b=Ef8msiWKTMXcdqniScyBFigQncOT4B9QVNigsaFv+TWBs93Zr/TmkfKWwX68tRh33Y4goo9rCVDDg/G0T0+J0wyTOTep0/e+aBh+PsEkaKQM4joCdlH5EYO3vi+3e8XDE/iPxtcfiltInPKsCbUuDCcy+jhVGnCsCmm4MG57BP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431249; c=relaxed/simple;
	bh=3PSji3JCCnhCool2UC7PT7zw3ghOKbKZboHEaIZ8iGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odIn1DQdb05pla/M8mK9V2LTcjLD2qN8edOQV7O2wLGcVPZjHNpLYvRVekV0DJw3mnqclgHCxBUbnTr73hNZu50wzmePAXhCyUnDcYtxcq/GgP74xeHxXU+wLkBW3qnTNx+4yh69j7lbxNj+WWFrHn+eZVy/FlVxorRsDDa3eAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Pto7q2Ae; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=m58L0raR; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Pto7q2Ae";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="m58L0raR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431246;
	bh=3PSji3JCCnhCool2UC7PT7zw3ghOKbKZboHEaIZ8iGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pto7q2AehZHNbwz66FbKElkzGrCuQCRGtPQpHdp63sZfdqqaENOYYoZUGCPEI11k2
	 xgW8ziMGXRlcL+cuh7PA1dqK29rWf1aSGbFborMhWiqqTqPe/AJBgzRTAMCOlJkYVX
	 tGioV3rIdUp9KuGWHCYGBUqJqCEgYVHyMdYhpg2htV7eozRa10+xM3tXDjRPgDT0h5
	 c1hKt2IRSADP0WnUhWG3UsjKBXVNhNc3tC2ApUC8To/TQmAr2a+SF+P6ymac/iiPA0
	 lCpa66cLlxU1WAQRcujA1RVO68yJSYbycOLUSmwk7qdVWanMeeI68gZ5re5/lQPW5x
	 g0a3j4u9z8AYQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 499E5470CF; Thu,  8 Oct 2026 03:47:26 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431245;
	bh=3PSji3JCCnhCool2UC7PT7zw3ghOKbKZboHEaIZ8iGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m58L0raRnyB74CpFfBttlZsS/MfmTP+lVqzVlPYvNgZohGxsH4ypBvcaGg6M5V50Y
	 0SnR0xcjXEgKl5ADSNwPIMd1FCmklQ2KTKmRsVxC2hUrgXmPvuvEr7GwbxGRAFAPcB
	 VGQotQahPqOjQS1C5HXVlIvlqd2+V82e2M6RyUddFVFzXFaeIhbU7/NmEECMEEWQER
	 DxAbn2jW0snm5xlSjQaL/mlAA6RVCyNatv6Xmn3GJmVNIFClWe0IFQx2eO317foxAI
	 wsANQXJfz1Q3qfFHYmu4zMUiqyu1m6IVQ6iaEwnFP+SyzElFk8w664/nnGegWTGaMh
	 JxZkxp27kt7IQ==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 9854541186;
	Thu,  8 Oct 2026 03:47:25 +0000 (UTC)
Message-ID: <98fa576f-d72d-41ea-9762-85f33cd241bf@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:47:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-9-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162606@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162606@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] pm: pm_runtime_get_noresume usage count leak on unbind
> - [High] net: ax88179a: in_pm state leak prevents PHY recovery on suspend error
> - [Medium] net: ax88179a: unbalanced phylink_resume on suspend error path
> - [Medium] net: ax88179a: missing usbnet_resume on resume error path
> --
> 
> commit a41c6d9493f6bfa6db95add83f5f79963fe546ba
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88179_178a: Add Suspend/resume support for AX88179A/772D/279
> 
> This commit adds suspend and resume functionality for the AX88179A, AX88772D,
> and AX88279 architectures. It implements wrapper functions in the shared
> library to call the specific suspend and resume implementations.
> 
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
>> index e592382692c74..aa5f2d6e42e76 100644
>> --- a/drivers/net/usb/ax88179a_devices.c
>> +++ b/drivers/net/usb/ax88179a_devices.c
> [ ... ]
>> @@ -126,6 +128,62 @@ static void ax88179a_status(struct usbnet *dev, struct urb *urb)
>>   	phylink_mac_interrupt(data->phylink);
>>   }
>>   
>> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t message)
>> +{
>> +	struct usbnet *dev = usb_get_intfdata(intf);
>> +	struct ax88179_data *priv;
>> +	u8 tmp8 = 0;
>> +	u16 tmp16;
>> +	int ret;
>> +
>> +	priv = dev->driver_priv;
>> +	ax88179_set_pm_mode(dev, true);
>> +
>> +	if (netif_running(dev->net)) {
>> +		rtnl_lock();
>> +		phylink_suspend(priv->phylink, !!priv->wolopts);
>> +		rtnl_unlock();
>> +	}
>> +
>> +	ret = usbnet_suspend(intf, message);
>> +	if (ret) {
>> +		rtnl_lock();
>> +		phylink_resume(priv->phylink);
> 
> [Severity: Medium]
> Could this unconditionally start the phylink state machine on an interface
> that is administratively down?
> 
> In ax88179a_suspend(), phylink_suspend() is only called if netif_running()
> is true, but if usbnet_suspend() subsequently fails, the error recovery path
> here calls phylink_resume() regardless.
> 
Will fix by also checking for netif_running(dev->net) before
resuming phylink.

> [Severity: High]
> Does this error path leak the in_pm state?
> 
> During ax88179a_suspend(), in_pm is set to true. If usbnet_suspend() returns
> an error, the function returns early without resetting in_pm to false via
> ax88179_set_pm_mode(). If an autosuspend or system suspend is aborted due to
> this error, subsequent calls to ax88179a_reset() will permanently skip
> phylink_start() because in_pm is incorrectly left as true.
> 
Will fix by also resetting in_pm to false.

>> +		rtnl_unlock();
>> +		return ret;
>> +	}
>> +
>> +	/* Enable WoL */
> [ ... ]
>> +static int ax88179a_resume(struct usb_interface *intf)
>> +{
>> +	struct usbnet *dev = usb_get_intfdata(intf);
>> +	struct ax88179_data *ax179_data;
>> +	u8 reg8 = 0;
>> +	int ret;
>> +
>> +	ax179_data = dev->driver_priv;
>> +	ax88179_set_pm_mode(dev, true);
>> +
>> +	ret = ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
>> +	if (ret < 0) {
>> +		ax88179_set_pm_mode(dev, false);
>> +		return ret;
> 
> [Severity: Medium]
> If ax88179_read_cmd() fails, does returning early here leave the
> dev->suspend_count permanently unbalanced?
> 
> The usbnet_suspend() function increments dev->suspend_count and stops the
> queues. Because this error path bypasses usbnet_resume(), the count is never
> decremented.
> 
>> +	}
>> +	if (!(reg8 & AX_PHY_POWER)) {
> [ ... ]
>> @@ -784,6 +886,13 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
>>   	if (ret)
>>   		goto initphy_err;
>>   
>> +	/* Keep this interface runtime-PM active by taking a usage ref.
>> +	 * Prevents runtime suspend while bound and avoids resume paths
>> +	 * that could deadlock (autoresume under RTNL while USB PM lock
>> +	 * is held, phylink/MDIO wants RTNL).
>> +	 */
>> +	pm_runtime_get_noresume(&intf->dev);
> 
Will fix by also calling usbnet_resume() on error.

> [Severity: High]
> Does this leak the PM usage counter?
> 
> The usage reference is acquired here to prevent runtime autosuspend, but the
> unbind path (ax88179a_unbind()) does not seem to drop this reference via
> pm_runtime_put_noidle(). Rebinding the driver or initiating a software
> unbind/bind cycle could repeatedly leak the PM reference, permanently
> preventing the device and its parent USB hubs from entering runtime suspend.
> 
>> +
>>   	return 0;
>>   
>>   initphy_err:
> 
Will fix by adding pm_runtime_put_noidle() to unbind().

Birger

