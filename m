Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB8364028
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606991; cv=none; b=uJN5V7ASSFSvgcz3JDYoD6TYH4WAu7rSb6k/5Bw714QteT65Bcdo6KEKEPrD14p+oKXD3XcpTC+bUbx9Hbm122TxEjWUpo/3DNqQJzN5u6k/8DzzbYm1k4w0DOd9/3T/BFeu0cSLu8zYa/mHn9rgjddh2bZPTRbtOURTWGRTy1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606991; c=relaxed/simple;
	bh=uPTuv58kUUPD2uL+ApKNDjNFkH/cAmlvKv4BExCbVnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEMJcNXu2GNRfqffFq2IFj7YaWW8c/wW3gwoJqfTVXgfiK/LhhkE0dL1bmtthi+hp8lEtNM5RJ5eao4h305fhZNdMp4eiqBMF2XOTPUWx0TOJvvCinNoVMfNj14ozPWvPhc9jzp4qQAP+cqli21hoj+xVu4P+6iN99WboNM8xwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=y2e9jnoU; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=M8LsYNRO; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="y2e9jnoU";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="M8LsYNRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791606988;
	bh=uPTuv58kUUPD2uL+ApKNDjNFkH/cAmlvKv4BExCbVnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=y2e9jnoUFCUqGS4r9XPNDUUwMqlBgJ2/LiyFPOiTWgcgENFrqeClVSVcsq5a7jbBm
	 i+zbpioy+0GYtJ8vPDFKZcAvxPWZf+AIRRIa3kNm1Q7jfsofN6fqEvdByvFLxqvxmO
	 I5xcnXZF2ee5j2vIjA+2iCySfdmQ59HKPrCMd/6hsKC1lspZFuMeCcO8dRJXBmFzz7
	 qhvZXHCitBytQOLF8bpyCVhGKgkOB6GEFM+WVIFxzGF5Utu/m6o1E6NB5jeodQRGWM
	 zzasya5RaiKXz5hiu7Y+gYZBKBcTk6uTkYX5YbU5O8FatkuZ5tICbY4n+FoTb1S2sa
	 /0+rfISb+/vOg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C15BA47535; Sat, 10 Oct 2026 04:36:28 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791606987;
	bh=uPTuv58kUUPD2uL+ApKNDjNFkH/cAmlvKv4BExCbVnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M8LsYNROyPd4DHf91yIgtR6u52MCAsDMuBpkSX2DmYw33c6BiQ6hGIssrwVRH3oJT
	 TyrAlm/uvJSATqIefnt8XOGwiqFF7Awulp53RzVEV+hdNP6om59Ls6++ot9daB2qHS
	 E1LQrSZuCvLFOXghuFjA4V+kz0otwzd4c2lKl2Ln4HRORhnSm3JHG1GKNokfjw8ouS
	 kQN17uuXSg1aWAf5eB3Q5HO7qNVfP2o0IHdLeBI1HYQe8mGiWhqGczneajruabv3dK
	 FHJCuy/2RQ6xLQYT0uRzTji2V2adlTT5cwEV03HfZLFQeNF4d6oORVxVVpi3ZU7NKX
	 wMSzT8c/asRNA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id A6B2F4751E;
	Sat, 10 Oct 2026 04:36:27 +0000 (UTC)
Message-ID: <07630308-2a3b-4167-a411-bd6e03ce9d59@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:36:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 03/13] ax88179_178a: Split driver into
 library and device specific code
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-3-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164792@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164792@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] net: incomplete locking of AX_MEDIUM_STATUS_MODE using medium_status_mutex
> - [Medium] net: logic error evaluating old MTU value for jumbo frame config
> - [Medium] net: ax88179: data race on rxctl between set_multicast and link_reset
> --
> 
> commit c3c28c1c33511966acdb47b60e1d21464314591e
> Author: Birger Koblitz <mail@birger-koblitz.de>
> Subject: ax88179_178a: Split driver into library and device specific code
> 
> This commit splits the ax88179_178a module code into a common library for the
> AX88179/178a/179a and 279 controllers, and device-specific code. The module
> is renamed to ax88179 to reflect the broader scope.
> 
>> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
>> --- /dev/null
>> +++ b/drivers/net/usb/ax88179_lib.c
> 
> [ ... ]
> 
>> +void ax88179_set_multicast(struct net_device *net)
>> +{
>> +	struct usbnet *dev = netdev_priv(net);
>> +	struct ax88179_data *data = dev->driver_priv;
> 
> [ ... ]
> 
>> +	if (net->flags & IFF_PROMISC) {
>> +		data->rxctl |= AX_RX_CTL_PRO;
>> +	} else if (net->flags & IFF_ALLMULTI ||
> 
> [ ... ]
> 
>> +		data->rxctl |= AX_RX_CTL_AM;
>> +	}
>> +
>> +	ax88179_write_cmd_async(dev, AX_ACCESS_MAC, AX_RX_CTL,
>> +				2, 2, &data->rxctl);
>> +}
> 
> [Severity: Medium]
> Can a data race occur on rxctl between this asynchronous write and the
> synchronous write in ax88179_link_reset()?
> 
> The ax88179_link_reset() function runs in a workqueue and reads
> ax179_data->rxctl to write it synchronously to the hardware. Since
> ax88179_set_multicast() runs in softirq context, it can preempt
> ax88179_link_reset().
> 
> If ax88179_set_multicast() interrupts ax88179_link_reset() after the
> latter has read ax179_data->rxctl but before its synchronous USB
> control message is submitted:
> 
> 1. ax88179_set_multicast() updates ax179_data->rxctl and enqueues an
> asynchronous write URB.
> 2. ax88179_link_reset() resumes and submits a synchronous write URB
> with the old rxctl value.
> 
> The host controller will execute the async URB first and the sync URB
> second. Could this revert the hardware to the old multicast configuration
> while the driver state retains the new configuration, potentially causing
> dropped multicast packets until the configuration is changed again?
> 
> [ ... ]
> 
>> +int ax88179_change_mtu(struct net_device *net, int new_mtu)
>> +{
>> +	struct usbnet *dev = netdev_priv(net);
>> +	struct ax88179_data *data;
>> +	u16 tmp16;
>> +	int err;
>> +
>> +	data = dev->driver_priv;
>> +	mutex_lock(&data->medium_status_mutex);
> 

This code is merely moved. Whatever the problem actually exists, it is 
pre-existing, and in any case I do not have the hardware to improve and 
then test the code.


> [Severity: High]
> Is this mutex fully protecting the AX_MEDIUM_STATUS_MODE register?
> 
> This newly added medium_status_mutex correctly serializes accesses to
> the AX_MEDIUM_STATUS_MODE register in ax88179_change_mtu(). However,
> other functions like ax88179_link_reset(), ax88179_net_reset(), and
> ax88179_stop() perform read-modify-write operations on the exact same
> register without acquiring this mutex.
> 
> Since ax88179_link_reset() is executed asynchronously from the
> usbnet_deferred_kevent workqueue, could it overlap with
> ax88179_change_mtu() and cause concurrent lockless modifications
> to clobber the MTU or link duplex settings in the hardware?
> 
>> +	if (net->mtu > 1500) {
> 

The lock was introduced to protect the AX88179A-code-paths from races on
modifying AX_MEDIUM_STATUS_MODE, especially, because phylink is now used.
The AI here refers to existing code for the AX88179-chips where the 
access to AX_MEDIUM_STATUS_MODE was never sychnchonized but seems to 
have worked for >10 years.
The condition is pre-existing and will not be fixed, also because it
is not possible to test.


> [Severity: Medium]
> Does this check the old MTU value instead of the new one?
> 
> Because WRITE_ONCE(net->mtu, new_mtu) was moved to the end of
> ax88179_change_mtu(), this condition evaluates the old net->mtu value.
> 
> If the MTU is being increased from 1500 to 9000, jumbo frames would
> be incorrectly left disabled in hardware. Conversely, if it is being
> decreased from 9000 to 1500, they would be incorrectly left enabled.

Will fix by moving WRITE_ONCE(net->mtu, new_mtu); before the code 
changing the jumbo-frame settings.

> 
>> +		err = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
>> +				       2, 2, &tmp16);
> 
> [ ... ]
> 
>> +		tmp16 &= ~AX_MEDIUM_JUMBO_EN;
>> +		err = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
>> +					2, 2, &tmp16);
>> +		if (err < 0)
>> +			goto err_out;
>> +	}
>> +	WRITE_ONCE(net->mtu, new_mtu);
>> +	dev->hard_mtu = net->mtu + net->hard_header_len;
>> +	mutex_unlock(&data->medium_status_mutex);
>> +
>> +	/* max qlen depend on hard_mtu and rx_urb_size */
>> +	usbnet_update_max_qlen(dev);
>> +
>> +	return 0;
> 

Birger
