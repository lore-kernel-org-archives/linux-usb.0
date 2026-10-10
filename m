Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706DE26FD97
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607907; cv=none; b=orEK+pPqbz81VTEnOYgWxKeNWkqu7nJGqhj2oWOlLpVxdPzIZAW6vzfQUIL4irz/AzmRYStsbjFz2LpMTQid3O0tKrxpV3FNqZilHvVY23lPiM9dZs1OEuivHRe0jG7Mg6OanJkfiHajUnTs43l8APE4+rEAP42jhOzvf9hid3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607907; c=relaxed/simple;
	bh=I9D2o5/J8f5MiuN1yuwZK48q24OAo6Xsh6dLIFRJL94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEh4QeuL20oKC9M8nPKpaGxsyZlyLX+qvsyPkWDuDE+OgeP8/dKVZrytY61jbUtkM1pzLzCUNHhw1/RV9d6scY0/0RnqefK1Uk6p66xjynxmNZGuO1faH9JPTe9cjdPdZYSnxhy7NvjK1a32V1OZcOK9mzX87dkR4N405qpGsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Ap+uzJBv; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Ap+uzJBv; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Ap+uzJBv";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Ap+uzJBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607904;
	bh=I9D2o5/J8f5MiuN1yuwZK48q24OAo6Xsh6dLIFRJL94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ap+uzJBvHLbZJdUWj5+yhoOoVFVjRLGjhlKwl+7zxswd+LeYJ5s64YwFGzI0qYPYG
	 yuWBWRhoeZA5aB9uYUKdTLZ7N6syVM9QzjUFB7qiVPZsDuXyR+mnKRiLgB6m3/rxLA
	 dnHuwTctmeUw6Uym3CjxehOsP7TTZOPrJYeGe3O/XxkXdEpM3+G5/uBiD5IOyomf+L
	 QbWkCBYOB0vRzB3H1pYjz90vMokn0Fc59kV/YzUmMbZ7KPM2fxYy0ERQaR/Rn2MmdQ
	 P7Vgqz7ntOA/y7O0v+KSgUlx4l+BFaFyrqavS/geQKdBADZcNs3BFZinbYSLjyMuXr
	 Gy9FlDj7J+WtQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id A7C114752E; Sat, 10 Oct 2026 04:51:44 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607904;
	bh=I9D2o5/J8f5MiuN1yuwZK48q24OAo6Xsh6dLIFRJL94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ap+uzJBvHLbZJdUWj5+yhoOoVFVjRLGjhlKwl+7zxswd+LeYJ5s64YwFGzI0qYPYG
	 yuWBWRhoeZA5aB9uYUKdTLZ7N6syVM9QzjUFB7qiVPZsDuXyR+mnKRiLgB6m3/rxLA
	 dnHuwTctmeUw6Uym3CjxehOsP7TTZOPrJYeGe3O/XxkXdEpM3+G5/uBiD5IOyomf+L
	 QbWkCBYOB0vRzB3H1pYjz90vMokn0Fc59kV/YzUmMbZ7KPM2fxYy0ERQaR/Rn2MmdQ
	 P7Vgqz7ntOA/y7O0v+KSgUlx4l+BFaFyrqavS/geQKdBADZcNs3BFZinbYSLjyMuXr
	 Gy9FlDj7J+WtQ==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 0C14C4751E;
	Sat, 10 Oct 2026 04:51:44 +0000 (UTC)
Message-ID: <75ff0737-bab7-4f59-87a1-515c246c9d6f@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-9-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164800@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164800@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] net: ax88179a_reset() clobbers user-configured MAC address during resume
> - [Medium] net: ax88179a_resume() skips phylink_resume() on hardware read error
> - [Medium] ax88179_178a: ignores usbnet_suspend() return value in suspend
> --
> 
> commit d715e3f0710659f4025065a805e16bf7832459fd
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88179_178a: Add Suspend/resume support for AX88179A/772D/279
> 
> The suspend and resume functions are called via the usb_driver structure,
> for which the driver has only a single instance. Add wrapper functions
> for the different implementations for the AX88179 and AX179A architecutres
> in ax88179_lib which calls the 2 implementations in ax88179_178a and
> ax88179a_devices, respectively.
> 
>> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
>> index 071b03b4f145c..ef0856627d08b 100644
>> --- a/drivers/net/usb/ax88179_178a.c
>> +++ b/drivers/net/usb/ax88179_178a.c
> [ ... ]
>> @@ -1356,9 +1359,9 @@ static struct usb_driver ax88179_178a_driver = {
>>   	.name =		"ax88179_178a",
>>   	.id_table =	products,
>>   	.probe =	usbnet_probe,
>> -	.suspend =	ax88179_suspend,
>> -	.resume =	ax88179_resume,
>> -	.reset_resume =	ax88179_resume,
>> +	.suspend =	ax88179_suspend_wrapper,
> 
> [Severity: Medium]
> If usbnet_suspend() aborts an autosuspend (e.g. because of an active TX
> queue, returning -EBUSY), ax88179_suspend() ignores the error and continues
> to force the MAC and PHY into low-power mode (AX_MEDIUM_RECEIVE_EN disabled,
> AX_RX_CTL_STOP, etc.).
> 
> This stalls the active network stack because the hardware is stopped but the
> USB core reports success to the PM core. The patch refactors this into
> ax88179_suspend_wrapper without fixing the underlying bug.
> 
> Does this need to be fixed to properly handle usbnet_suspend() return values
> in ax88179_suspend() to avoid hardware stalling?
> 

ax88179_suspend() is pre-existing code that is merely wrapped. Will not 
fix and anyway could not test because of lack of relevant AX88179-based HW.


>> +	.resume =	ax88179_resume_wrapper,
>> +	.reset_resume =	ax88179_resume_wrapper,
>>   	.disconnect =	ax88179_disconnect,
>>   	.supports_autosuspend = 1,
>>   	.disable_hub_initiated_lpm = 1,
> [ ... ]
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
>> index e86cbe3e4400f..e9913a7c70390 100644
>> --- a/drivers/net/usb/ax88179a_devices.c
>> +++ b/drivers/net/usb/ax88179a_devices.c
> [ ... ]
>> @@ -135,6 +194,47 @@ static int ax88179a_auto_detach(struct usbnet *dev)
>>   	return 0;
>>   }
>>   
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
>> +	if (ret < 0)
>> +		goto err_out;
> 
> [Severity: Medium]
> In ax88179a_resume(), if reading the PHY power state fails (ret < 0),
> execution jumps directly to the err_out label.
> 
> This bypasses the if (netif_running(dev->net)) { phylink_resume(...) } block.
> 
> Because phylink_suspend() was previously called during ax88179a_suspend(),
> bypassing the resume call leaves the phylink state machine permanently
> suspended. Even if the hardware error was transient, link state updates will
> no longer be processed, resulting in a dead network interface that cannot
> recover.
> 
> Can this be modified so phylink_resume() runs even on hardware error, or is
> there another way to prevent the state from becoming stuck?
Will modify to include phylink_resume() in error-exit path.

> 
>> +
>> +	if (!(reg8 & AX_PHY_POWER)) {
>> +		reg8 = AX_PHY_POWER;
>> +		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
>> +		msleep(250);
>> +	}
>> +	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
>> +
>> +	/* Now, that AX_FW_MODE_179A is enabled, the PHY needs a power-cycle.
>> +	 * PHY-power is re-enabled in ax88179a_reset()
>> +	 */
>> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
>> +	msleep(250);
>> +
>> +	ax88179a_reset(dev);
> 
> [Severity: High]
> Does this clobber a user-configured MAC address?
> 
> During resume, ax88179a_resume() unconditionally calls ax88179a_reset().
> ax88179a_reset() calls ax88179_get_mac_addr(dev), which reads the default MAC
> address from the hardware EEPROM or DTB and writes it into dev->net->dev_addr.
> It then copies this value into dev->net->perm_addr.
> 
> If the user had previously configured a custom MAC address, this custom
> address is permanently overwritten by the hardware default on every
> suspend/resume cycle. Furthermore, modifying perm_addr outside of device
> probe violates the invariant that it holds the permanent unalterable
> hardware address.
> 
> Should the resume path instead restore the existing dev_addr to the device
> registers without calling ax88179_get_mac_addr()?
> 

Will fix by excluding setting MAC-address in resume path in
ax88179a_reset(). I have verified that the mac configuration in the 
device is not cleared when doing suspend-resume.

>> +
>> +	if (netif_running(dev->net)) {
>> +		rtnl_lock();
>> +		phylink_resume(ax179_data->phylink);
>> +		rtnl_unlock();
>> +	}
>> +
>> +err_out:
>> +	ax88179_set_pm_mode(dev, false);
>> +
>> +	return usbnet_resume(intf);
>> +}
> 

Birger

