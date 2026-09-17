Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8D4AD7DD
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646897; cv=none; b=YfCaGWbCXm4+D8P0TnkUETdamUd+gXBtSaVUM/Z3w8y0bGAQni52QuCbp0d9N5voKSVw82bIVCQ153vz3oeDOBQgqF8VCuUM+Ch3HbvJuIf6065CkT9VTztrn6pFNUTmmIzlSMqpO0LzI9Imv31CUCEwe74AkaTe1Zbzw+wTmzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646897; c=relaxed/simple;
	bh=qGEEwGPLJZyTx9/fJ99JJxZZqNqLvVtpP+tTRW/DsX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDTvCnWNQidTqPmZyYhDWHZNxliRHO4skSXiZMikSmP8IM/i/AWGAElSlZerO7lEcu33L2i2WhRwfsZAwSsu9mKsmEH1DlhudDDcJNgntXBlOMKSEaawZeCrRn0K8thh+xLbB5zZLAA8wFv23QkG5N5XwIO8a+9rxOT3iaadHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EauUUTBn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhs37S5a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EauUUTBn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhs37S5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789646880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
	b=EauUUTBn44hNi/LHdWhLjOc7PaT46V7F5pCAhfBNgwmw/IJm04YVELJ0jOfgelkWaiUMw+
	O1roEtigdDDBmW4NeV8OPBAo2vg2ELGkXufO7U4Ck7wcG+BxeVlSouITiaiuSBeaseNrzK
	ZdSEY4SQggVtSBnmqCmrGQVA4Bof5iU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Qc9SdNI3MEy-YggEjRCKGA-1; Thu, 17 Sep 2026 08:07:58 -0400
X-MC-Unique: Qc9SdNI3MEy-YggEjRCKGA-1
X-Mimecast-MFC-AGG-ID: Qc9SdNI3MEy-YggEjRCKGA_1789646878
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6862e924so5861825e9.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789646877; x=1790251677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
        b=fhs37S5aPuo03UyR6v+GwUEL88PSosYsQcb5PjG+ZZ7MZNty9VppKIBBwXfdHvbGNe
         xHgou+TWE0ltEjDGMfSc2E6PSOmUiyjD0lTWoKvxstWPiVa/pdYDre7sPq4hR3vW56o2
         lzUxcx3aHaypkwxG8B7rJSBleyMYMTpu7hclF8hTyTyzXlsI9guPIBwO7N6z5D0UD0sK
         m9/HQqDmb28Cikc/hLzfE6Q3T3gDpsZ+jvxyw1FxET1pu+N8ZETZ9renLCwsTTMz4DaT
         bFU4XyABbTQeNRPHjAw6Q7PmshOJ1tgNMaQMS9GabkbKxWU8kb6NFN7oJ4X3XxAIEZIi
         S6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646877; x=1790251677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
        b=rdK2Dh97r+sNrsawY7gc2e3OBoi6pYK14oZgMD5OC5GQr8FWA9gYnjfMrc9roOym8H
         sH2ji7Wup6ImKigcTvhYkg1KMur1KzMu6hWy4S2qfq9CAIxmjRGLPb1Kxs4E3X+urJMx
         k53drTIfQ2Xai+K/TiVCQrzjqJ35BJpGLmTYsvsNFYiN1QMx7uFYxdRvcTb5rvetT2Bz
         Jk9/B9aZeCAN1gTd9DeRMQt9uiBsLXTyuI9LQ9WhismeVouCdPgPBVftLqMz3XEy/mlW
         cJNPm2F98T0+5ifQW+lNuT2/r5JogQGGnlDa9Yyb1WtBsOjrG1DBVk+cV3Js5HCCUgwT
         zY9g==
X-Forwarded-Encrypted: i=1; AKwUvBwvJhj57phSEBxFtbO6AztB7YZiDVkhaQvCyvY2w4FcOOHKOB8XrgKOiGLmJEIH++1oM+7EBQz7hD0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFUpZ0DAhuGGLJKuPN9wmwT3uUXCor91hN6P9nHtTkQZ4q669K
	vvA3oS/Y+xoWtP4yoszV2cP5K+ezVVIuYqPTtIEpg3okFaropxT6J5DyoWBm+zZjEIdhTrsDjlI
	icmR/or4zN8fCjkjRuByidTA3tt4+HJgbtvomq2dS2nVeVGYFC6UQrt9iEBWwUA==
X-Gm-Gg: AYBFou2rp0Ex2TZejSNN9raDXoEaCbPrdcMaX6eVfupXUwOX/q7LxpmMyyrtdX5a/QW
	O4irkzbuGgh5RoRf/poV+TCVVSOm4sb9p2GcjnfqJUEnOiML6Iq57F+NuAA6wfAsF1foy3aIWAG
	HNQKoWP1uJ8EOn8mr1E8+aMhNqmllCHx2Le4ChfrCpjhe0kaUt3fmxV0SH157XSbluHhYs/VBxP
	MApoa0Bhc3b21TO+daRHTccFDNE7wjdMFhAIgDisZxaqx8Q3AdMMBEnMK8hWjHEJOaFQ8eiPmWH
	fWqyYmCxl8CXMXv7QQ3rOU9q9ftKQVB2vo2H+w1OwdeJG3uj9uwrVjNpl1kEdqShaQPjP5bKKuw
	wsUQKZN4ORBiP+AotvQaILYyRKhSFRDmvu6YoBGMu5JqJfbHohZpW7TP6DYzutvrJj4JaumXj3Q
	==
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr79199945e9.25.1789646877643;
        Thu, 17 Sep 2026 05:07:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr79199445e9.25.1789646877231;
        Thu, 17 Sep 2026 05:07:57 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm71394955e9.1.2026.09.17.05.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:07:56 -0700 (PDT)
Message-ID: <c308f5b2-05bd-470e-bc60-bdf7038b8b65@redhat.com>
Date: Thu, 17 Sep 2026 14:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ch9200: return error on failed register writes in
 ch9200_bind()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org
References: <20260914202503.52920-1-s.shtylyov@auroraos.dev>
 <178951445003.22033.8083675025384414442@kernel.org>
 <9fad10fc-dcd9-437e-b422-018638524632@auroraos.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <9fad10fc-dcd9-437e-b422-018638524632@auroraos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/26 18:58, Sergey Shtylyov wrote:
> On 9/16/26 2:20 AM, netdev-bot+sashiko@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider:
>>
>> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>>
>> - [High] Ineffective fix: the six newly added `if (retval < 0) return
>>    retval;` checks in ch9200_bind() (drivers/net/usb/ch9200.c) cannot…
>>
>> --
>>
>> ch9200: return error on failed register writes in ch9200_bind()
>>
>> The patch adds error checks after the six control_write() calls in
>> ch9200_bind() so that a failed vendor register write aborts the bind
>> instead of being ignored.  It carries a Fixes tag for the original driver
>> commit 4a476bd6d1d9.
>>
>>> diff --git a/drivers/net/usb/ch9200.c b/drivers/net/usb/ch9200.c
>>> index a206ffa76f1b9..ab3cd3902ed72 100644
>>> --- a/drivers/net/usb/ch9200.c
>>> +++ b/drivers/net/usb/ch9200.c
>>> @@ -360,32 +360,44 @@ static int ch9200_bind(struct usbnet *dev, struct usb_interface *intf)
>>>        data[1] = 0x0F;
>>>        retval = control_write(dev, REQUEST_WRITE, 0, MAC_REG_THRESHOLD, data,
>>>                               0x02, CONTROL_TIMEOUT_MS);
>>> +     if (retval < 0)
>>> +             return retval;
>>
>> [Severity: High]
> 
>     But why? 8-)
> 
>> Can these new checks ever observe a failed register write?  control_write()
>> in the same file discards the USB transfer status on its normal path:
> 
>     By "failed register write" I meant any error in control_write(), including
> kmemdup() failure (which precludes the USB request from being sent at all)...
> 
>> drivers/net/usb/ch9200.c:control_write() {
>>          ...
>>          err = usb_control_msg(dev->udev,
>>                                usb_sndctrlpipe(dev->udev, 0),
>>                                request, request_type, value, index, buf, size,
>>                                timeout);
>>          if (err >= 0 && err < size)
>>                  err = -EINVAL;
>>          kfree(buf);
>>
>>          return 0;
>>
>> err_out:
>>          return err;
>> }
>>
>> The only return err; is at err_out:, which is reached solely from the
>> kmemdup() -ENOMEM branch.  All six patched call sites pass a non-NULL
>> 2-byte data buffer, so the only negative value the new checks can see is
>> -ENOMEM from that allocation.
> 
>     I kinda noticed. :-)
> 
> [...]
> 
>> The sibling helper control_read() already returns err on its normal path,
>> and ch9200_mdio_read() checks it with if (ret < 0), so the convention
>> control_write() is expected to follow already exists in this file.
> 
>     And I'm extending it to control_write(), but in another patch...
> 
>> Would it make more sense to change control_write() to return err after
>> kfree(buf) instead of (or in addition to) adding the caller-side checks?
>> As it stands the commit message claim that this makes the driver "bail out
>> of ch9200_bind() on failed writes" does not seem to hold for actual
>> transfer failures.
> 
>     I'm getting bored...
>     If any *human* maintainer insists that I merge the 2 patches, I surely
> will... Or maybe I should resubmit both against net.git (net-next.git?) as
> a series?
IMHO the patches are so strictly interconnected that should land into 
the same (net-next) series. No fixes tags in net-next patches.

Thanks,

Paolo

