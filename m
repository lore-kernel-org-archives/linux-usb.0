Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C41A680B;
	Thu,  6 Aug 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025277; cv=none; b=Vyo5EbL2w5WB1P34GlY2dfv/uKnbpNTi45kY38I2w8GpobYIMJC7zHq0VwdasAJI8Sc8itujBdXmgDAT3Srwc8ihr10dt0YNShfsvW7Z4/rzHSpZkLLPa5pVjvtNx2lfOGb0Ae+L+DccIOfIwZhkNE3HlCqqRTxIumVo4CmqRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025277; c=relaxed/simple;
	bh=rFPSR9lT/tRkEsWOCTa2OQaWqHPZV6COdnL7u0/EjhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzXWnxAgHiDAsUgNEUKKkeTRWNbfrnkMeZWuxN1boy4msmfua7PazJfnkHwCE/hLRnoJo7mmEasIq7o5XUcFXJD34VfjV4fqmx3CeFBsouEDQpPPVps3maRTVMVZlHIDNbzqq/h6hXqJA7a6N01oHTE4y2Sa1vWykzRECGrB+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=UcGyCcuT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gb1wh/7O; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="UcGyCcuT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gb1wh/7O"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 5B7A5EC010B;
	Thu,  6 Aug 2026 10:07:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 06 Aug 2026 10:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1786025274;
	 x=1786111674; bh=8Fp+ftXmlYOv9Lcg2RGl/ZE1LbR7FAv1qreoyYeaksc=; b=
	UcGyCcuT0gYC5EqmOHIbhPl+bfKde852z60uuNDdI+MPvjlO2vOqAtG6DkVsXgGi
	XjEWwa5E8Qg2pEf3zBiICfBS+aN+gzbjIAsfFbsU3XdFCaQnAYgVhVaTeN2+zA9S
	fj6tP1yQL3uHhd7TlC5LJpq1pV5W8vCZnri6iT7lJI6FFE2ir2oo3l99FRAnG0mP
	Kc/qKALwjf/Fgo4PqcJ8aMjUGZjKP6IqXcYtOyatHSA8i/2P4GQtJR+RXpWPmcSP
	0n7+mZG3GsjXEDSzAXgcJYoRTzvwNFP7DprP5HSSuyw0+b3qL+xCwziMWokHzLQl
	85rTyjbmbxfnzgpbwbvKFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786025274; x=
	1786111674; bh=8Fp+ftXmlYOv9Lcg2RGl/ZE1LbR7FAv1qreoyYeaksc=; b=g
	b1wh/7OQoUoT9hBR0Pm8541aMh2qNPqDca/cmJ2l4bM91dDCbSgqtqn/Qp4ZzvLP
	AOZok7ZU2afUNlLK58uQPzq+9Yn+peooHFq6w0OLRDdFXYtG45fEvnYDYdPt6PyW
	n/6zJTL1IVyDAldosNBKu6zTyiSfyFbg17UR4+O9fWDgVF4OJHi7HFzlgoSsuGPf
	FC4SYS60Ux2BruDSfOVb50ZR6CmRr/r53OAe3NYOvsKby3TzhNJmsCzZy6/fOoc6
	uGiksX5Hxadozu8xGMbCFInJb09mV1AubSaOcEFE3a68LL8rcXV3VursXJ6KZ3uv
	k4yARI5Y+0X3w87Q8ittA==
X-ME-Sender: <xms:OpV0arMv30C6XqvZe3NgQDx0IGRhDh4KwDGo3HcTZufJThBURwJPgQ>
    <xme:OpV0aogBmokiVngGl7tUClW2oEAGaW03jfqwqqN65SvOcLVoOsOK0diFSTtbZTLHT
    0HnpBmUa-oiVGOz3x7dGf5gGhsaMZyZhiMJSRYcjze5GBHqZjo>
X-ME-Received: <xmr:OpV0at6rcNSDkujaTwC4XRoe6Mgwx3ZwxWUpNycUJANmoWrYjiW7JQIafzFLkIXZDh4--CX6shzT3p5P0KuurqwLkJnAEi79pdW2uebTZrAlBIGf9cQ>
X-ME-Proxy-Cause: dmFkZTEKdexUtFNdrOImzzNGSMNny+MDyxpcO3YT58dqvseGGd4aH7ksa6rX7+eXMMnA2u
    g9bIXS2Q8Os3F7b/bz0R5dDu2wjH+RhuV6W/AhpqPPFrTD5QAcSBViyRI1vDNClguuNw1G
    YrcOgb6nqqXxbBeXENmEgp4m07UtTY9g1GkOHDSrLZyBH1BYvoiHM7aDnG/sfNfb2batdX
    zJb0sxhcXcxoG3fb9vL05C8jT+ZVg5M1ofGjiKbYSvETzvkBYf0+AREmRwxVnfmdpxGNaS
    171wBVf+dPn5J8bNRpHhqF3ZFmu4QzxQCVlFzaMmvFRHePjkKWCAb/Moschya08JpJBLtE
    fxzlL8C8TyoDz2Iqi0mu/xjphtj6/XUdRM8Yhmu24QXR8Yg3frN6Dl1cy7nXXc5ZxWcsD4
    eHlvHee2XDYIrQfmKHW9kJbO1bpQhC5vlwAKsyIYkLmATjbHNJYLbeX6Xu8+ELWRcBR7Rp
    TLxFi6jtsygFWI4s/P59ux2r7dg7ZlCwKb2hq6hbaKVcdzH0hJHsNuCOW9paX9TW/c7PRF
    wrJlIAlDZepl+azdXmCqML0Yn5+bclxWYn13Z5MPLQ5FYxQw7ltvyoTfKm04GqEEwK8pOY
    ARaAIKwy4lDSazJueBF6M6KtQhl1fopl6Wdry6QW8ENIde29HuW0i7ACoFOQ
X-ME-Proxy: <xmx:OpV0av1Wl7DsdeykGhhm5aQ9BY-uFBcACrWAq-v2RP8GfTLmCmyHQw>
    <xmx:OpV0aouHU0HznOI3HwCCp5QJwJQ2IR0xnOFXN2dOt4aAZH_ZjyykiQ>
    <xmx:OpV0al5OHWwFUWv4Inx6yC0HxYhqLm8epQwkYuFS_-3TpZLkZZBdew>
    <xmx:OpV0akfOkej4w5eabXQizSLH1a3bNze7ilwQsHEbobwxGsLWtctvGg>
    <xmx:OpV0asFnIOTrqlmEHS5pMV4fx0FARV8vm7u38_aoMXgfEGTG_vOGeKeM>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 10:07:52 -0400 (EDT)
Message-ID: <f6b42163-9559-41fb-b0df-b085626143db@kroah.com>
Date: Thu, 6 Aug 2026 16:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: usbio: fix bulk receive overread
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Hans de Goede <hansg@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260806-usb_drivers_usbio-v1-1-04879d13b46e@kroah.com>
 <5c4f8b7a-4047-4c15-ae13-3844790317ef@rowland.harvard.edu>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <5c4f8b7a-4047-4c15-ae13-3844790317ef@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/6/26 4:03 PM, Alan Stern wrote:
> On Thu, Aug 06, 2026 at 03:43:11PM +0200, Griffin Kroah-Hartman wrote:
>> Add a check for bpkt_len being more than what was actually sent from the
>> device in usbio_bulk_msg().
>>
>> A malicious device could use this vulnerability to claim that more data
>> was sent, when in reality it was not, leading to an OOB read later on
>> with the memcpy at the end of the function.
>>
>> Cc: stable@kernel.org
>> Assisted-by: gkh_clanker_t1000
>> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
>> ---
>>   drivers/usb/misc/usbio.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
>> index 3c2474dca810..794322ff09fd 100644
>> --- a/drivers/usb/misc/usbio.c
>> +++ b/drivers/usb/misc/usbio.c
>> @@ -341,6 +341,9 @@ int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
>>   	if (bpkt->header.flags & USBIO_PKTFLAG_ERR)
>>   		return -EREMOTEIO;
>>   
>> +	if (bpkt_len > act - sizeof(*bpkt))
>> +		return -EPROTO;
>> +
> Isn't this just a repeat of the code sitting 4 lines below?
oops, sorry I was working off of Linus's Tree, not linux-next :(

Griffin
