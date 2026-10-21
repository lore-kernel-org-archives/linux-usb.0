Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566046;
	b=KyQCp275qWaMksZCxjRZn1MHKw7sJZq1iogq+REv1FNBIm2TPqhw9hPdIJJrM1HpN5zR
	 fuD0CuhDuxNUklKfvgZ6gbUUl+H4NCIreRjW+Cce34CkQezfAX7P2vIneKhrz5MfkSU9f
	 mdSKgO4w+J3N8nLN4g5qkJ+Ag/X65S832+k6eMlt8Byx5NA/vYEtdJKoUbY7vJfXnd7t1
	 LMt12xELhWpaWF2XAAr5yv2yYKuwOaGjWh1I2JY8E6Vt7oSgNWmPq1ObSLnkFhsosd6rK
	 dDwOqSAtSZYRipsBcXrdZ0g7nVuW9/hy1Q25FaTdi1XeEu4bzf4E0MBx3wGhUaJ+L0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 X-Originating-IP:Content-Type:Content-Transfer-Encoding;
	bh=Ile9d/InJV1L4HflIHCvU0WgG1tmkJG0PvPkcs26Swk=;
	b=3TYIKKvNbBZbhm9Atxx91L2FdNBwFts5Je/AQPdub4/9h0616b/FRzaE8F2MRGBCVezB
	 G4Pv0XqyNXDqvhXK7oRJ4B3BVftkRVjqVRR8OpoAK8xAzKorhQ6lu/HTIlugJMr8/CEYs
	 +McNC90ZvIW0WoCfDHl31kwqIFxL5KIJfOb9lP+dQ+qeyzRXYZiFFpFW240f5ipJOB4aG
	 0CI7KI0V9LuQtA2nrs7p3S071bfHSP6xmjoferbco/tXZovPy4Pk9MLJ8kAm0+lFBms2I
	 +/xunbqavgPZSR/Bzm7qWruCosHg7s9KTUB4lFa7Ml8CGRbpN/cgKUzTZMoSBUKfHMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=eK4WxiIR;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F162606A31C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F162606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=eK4WxiIR
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id 94AA2B40243;
	Wed, 21 Oct 2026 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1792566039; bh=Ile9d/InJV1L4HflIHCvU0WgG1tmkJG0PvPkcs26Swk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eK4WxiIRweZJbs3eS8WUkRL0dNJxHkbUEKBNz21lx79d2A/CY6a4CFVDFz7jjhzll
	 u/B3vUxtncww24RErAN90wQk1ss9UcVsEKaSIvg1gqVglnJ8+TntesseYN5EBw1alB
	 ldnNnUC1oK9JV8VTy05H+x14HTcIhCL83wN7VaCf5+08y+4olw34YG+u83Aikfpm5L
	 8HyOY2Tr8u/u54+AYs5tPq01rEDXG4HE894B/o99256/fkc3+Dg2RFVuMZniRAN5Jj
	 qci7ZCnWDMmn4xv9eIU3NcJsJIfQ5KjNly9nLGIRwmZxas5OtW/qRca2QIo+0Sgfp2
	 ult4PSNqGaj1g==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Wed, 21 Oct 2026 00:00:37 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 00:00:37 -0700
From: kaf@nwlink.com
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2 RESEND] usb: gadget: f_uac2: allow explicit channel
 count independent of channel mask
In-Reply-To: <sashiko-outbox-174688@kernel.org>
References: <20261016162534.384844-1-kaf@nwlink.com>
 <20261016162534.384844-3-kaf@nwlink.com> <sashiko-outbox-174688@kernel.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <2b4a7d4250ac526ce3e205eeded981e2@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-16 10:07, sashiko-bot@kernel.org wrote:
>> diff --git a/drivers/usb/gadget/function/f_uac2.c 
>> b/drivers/usb/gadget/function/f_uac2.c
>> index 46255ad0a9cfa..c7801bb8765e6 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
> [ ... ]
>> @@ -689,11 +699,11 @@ static int get_max_bw_for_bint(const struct 
>> f_uac2_opts *uac2_opts,
>>  		// Win10 requires max packet size + 1 frame
>>  		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>>  		// updated srate is always bigger, therefore DIV_ROUND_UP always 
>> yields +1
>> -		max_size_bw = num_channels(chmask) * ssize *
>> +		max_size_bw = channels * ssize *
>>  			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))));
>>  	} else {
>>  		// adding 1 frame provision for Win10
>> -		max_size_bw = num_channels(chmask) * ssize *
>> +		max_size_bw = channels * ssize *
>>  			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))) + 1);
>>  	}
>>  	return max_size_bw;
> 
> [Severity: High]
> Can this overflow the 16-bit capacity of max_size_bw?
> 
> With channel counts up to 255 independent of the channel mask, this 
> calculation
> can exceed 65535, causing the required bandwidth to be silently 
> truncated.

The max_size_bw truncation is a valid issue: expanded channel counts can
overflow the 16-bit calculation.  I plan to widen the bandwidth 
calculation
and comparison types in v3.  The existing warning-and-clamp behavior 
will be
preserved.



> [Severity: High]
> Does dynamically allocating memory and assigning it to the shared 
> static global
> out_feature_unit_desc overwrite prior instance allocations if multiple 
> UAC2
> instances are bound to a composite gadget via configfs, leaking memory?
> 
> [ ... ]
> [Severity: High]
> Does modifying static descriptor templates like usb_out_it_desc 
> directly
> during bind cause data races and corrupted descriptor fields if 
> concurrent
> bindings occur?

The two shared-global issues predate this series.  Regarding this patch
series, the changes do not alter descriptor ownership, lifetime, or
synchronization.  This series does not introduce or change any shared
descriptor state when constructing the descriptors.  The overall concern 
is
valid and separate from the explicit channel-count series presented 
here.


> [Severity: Critical]
> With the channel count expanded to 255, could this cause a heap buffer 
> overflow
> downstream in drivers/usb/gadget/function/u_audio.c?
> 
> When uac->p_framesize is dramatically increased by the larger channel 
> counts,
> and residue accumulation triggers in u_audio_iso_complete():
> 
> drivers/usb/gadget/function/u_audio.c:u_audio_iso_complete() {
>     ...
>     if ((unsigned int) div_result >= uac->p_framesize) {
>         req->length += uac->p_framesize;
>         uac->p_residue_mil -= uac->p_framesize * p_interval_mil;
>     ...
>     if (unlikely(pending < req->actual)) {
>         memcpy(req->buf, runtime->dma_area + hw_ptr, pending);
>         memcpy(req->buf + pending, runtime->dma_area, req->actual - 
> pending);
>     ...
> }
> 
> Will this memcpy overflow req->buf by up to p_framesize because 
> req->length
> was increased without verifying it stays within ep->maxpacket?
> 
> Request buffers are tightly packed at intervals of ep->maxpacket:
> 
> drivers/usb/gadget/function/u_audio.c:u_audio_start_playback() {
>     ...
>     req->buf = prm->rbuf + i * ep->maxpacket;
>     ...
> }
> 
> This means any overflow immediately corrupts the next request's active 
> DMA
> memory.

The overflow in u_audio_iso_complete(): this is very interesting.  I'm 
able
to achieve an oversized request using existing channel mask 
configuration
(27 channels, 4 bytes/sample, 19200 Hz sampling rate, p_hs_bint=3).  The
endpoint bandwidth calculation reported a required packet size of 1080
bytes, exceeding the 1024-byte high-speed endpoint limit.

I instrumented the driver to detect oversized requests and clamp the 
request
length before the memcpy. The warning confirmed that req->length 
exceeded
ep->maxpacket by 56 bytes, although the test requires a bandwidth-
insufficient endpoint configuration.

This demonstrates that the underlying bounds issue is reachable without 
the
new channel-count attributes. Looks like this will expand to a 4-patch 
series.
The u_audio_iso_complete() patch may need to stand on its own ahead of 
the other
patches.

Thanks,
Kyle
