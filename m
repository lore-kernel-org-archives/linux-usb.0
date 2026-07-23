Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF335DA40
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827238; cv=none; b=qxnT5pr+vBTQNrlAyiOjmbJJLJzO9ofxGfMtcOK3a9JsTCDYuH4M0E29Oj6DbRmF9KUQbyGuSTstQrlQPRETIAv8yEDL/RvFABhuP47zilyjyPFJdrCShCKYvO4Ks9/+tTIRrc6gksRBVPBplHVnviRTTlphbWUs1KP0NPn/+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827238; c=relaxed/simple;
	bh=XoQ9SMGHKRlAcWNao7eabHoHNtipIK8O7CpPB+fAowk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rxn+NMWrmKrK2sQFre8i1qVFePaJHYfZleoztC+Ye9QDxaeXPRY2ffaxQu8hvGUx0Or9xNmEAR4dAVGKGlax54FhfUXWFRxhsV1mb396RVYrfrF+opUazyoJiR9ejx/2LTXmf0sPMN1WQW6dOaH27xaj2CZ2MGIy3OEHVR4NdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MASOBPkI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BNV1KtNR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MASOBPkI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BNV1KtNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784827236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pNKM/CFXhzcr03tjBSyarPY9m/3xGjvipxMTkjqn5eU=;
	b=MASOBPkIpDMqwFP8xZ8vsZFi3mqhK3cBGozm0ECvCnWJyDpbalRdYAKU9c3VIZakyU+iOb
	SWZ4rTuquJ681TsHoUyz0bIr0whmFndrvZjZ5bgepzcM/fb5JhNWAdyY5TEZFfBJD+dt4z
	h4m6hh837yM8qBop//CGHt6Oaey/WQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-kUN5FreyO86Enw_kAxRhMg-1; Thu, 23 Jul 2026 13:20:34 -0400
X-MC-Unique: kUN5FreyO86Enw_kAxRhMg-1
X-Mimecast-MFC-AGG-ID: kUN5FreyO86Enw_kAxRhMg_1784827233
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495517d39fbso5189515e9.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784827233; x=1785432033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNKM/CFXhzcr03tjBSyarPY9m/3xGjvipxMTkjqn5eU=;
        b=BNV1KtNRzLeOnUZlNlz8o4uzzwchE03NCAD/qLKl+8mZk4dqdzp36KFivSEz7vgLON
         kMPkTZXFVVOs59aDq4mbjob57PK7ls0gW2S6v2t1xeExJ0y9fmANcGamsTQXOCGBA4RD
         Pnr3b5ijJz7JTsP2Jwev0V38vHOrEqhfKGZPEuVx681ZyMXbpjWYT3FeaYRjT4S52WPr
         yzq5thcDvexgHGN8t3oR6qwnzXCxn19BqjGB5fSJuK5ChJ2zmBrmx3N4DeVQuWcM7N2s
         h8Sty27pj3Cm0Ucy7IFWlFWi6rayYJIlV9pXRGtabB795P3p+ivHswNmvVWhVQo16z97
         Vxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827233; x=1785432033;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNKM/CFXhzcr03tjBSyarPY9m/3xGjvipxMTkjqn5eU=;
        b=UwhADMVqiOhvPrrLPWMvtf5DjIUjM4DVujP3wUPXajOauN0wwasx4ugZ8xecPoGjpZ
         PGJID01KUcUWkgdkjLAluSXZbclQrLeNMmlTDtxYy6KUjX4bpc8ZfeLagM6qGdcuyIOb
         J+XSCF/ccUYfsDHvxl9V8OHChHT50hssAaI5yPw5GYWexptAesxazRjzb4Fv4HSXKdQL
         ebKylPTQvrRiL68LjDCjmo8sY6PKqPHR4HFzOtt34r+omHV9UIgTenSg6l6Q/1dPAOik
         EOEej4RLFJR3XLh2LanuZFZ0vNYg8b0arF5T0YbAe+W6VqIRLh93TCTXugjjhm1hYC79
         Rldg==
X-Forwarded-Encrypted: i=1; AHgh+RqSYQSnjbdgnz54u8wqPadCbXIOU6i32mwehFj8TR9+8wV8paynsaMHWWUsV2KGlvkwMacgmVp6BuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBR2YkJfonmGJSdivB2FFvZF/H4aNrh9oXxY8vF+tOsd1jRU33
	I3w/Xju0cQHbp40oDNhYShchHDUh8lbAhjizEYyvT8Iqde+FX2V6fUwwSfLkM6rcy3aKeUgAFFN
	9qldjf5a4DMGkxJUBKDIIYd18EzKHuvQ9lYOKZLKIFtIlKPfcaQRoXUs4xqQ15Q==
X-Gm-Gg: AR+sD11jWH5GM5bu1ALUq7auFkkYxh4pkLn9ysRAMxzAqU6Yv+AYEgarktcqS+rOWve
	vEk63ZnvBhKzdgzm4gJgjTUGAUsrjkKHxdwWoH0OlRVxYAVCWRiNTqFoi+Q6c22BhiRXUbeeElG
	1vmSK2UhgZ17PzDUTJuxIRhQdubgWfvMXPxbi6eg6mk+n2OosJbyhSM1l2zmgUyY4gIX5OCZo5J
	vkujFGieK3HhXoqqOLCEhHdOkaP22x6n8GbFHeMCxKC3dfi2AMOWRV9AucziDF1T20t1T4cXXpz
	4UvVM6LA0K0ql+8qdwGLXfHRcZGE6Z7L8jKdvduGic7u74RVoLEP7+W/WUH/oImLQWV7G6L/zUt
	bcRM/5IHKCFM13saP5ky9RnSwmrfyt2YNY6EgVsM=
X-Received: by 2002:a05:600c:3b82:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-49573cffad3mr46054595e9.20.1784827232732;
        Thu, 23 Jul 2026 10:20:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3b82:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-49573cffad3mr46054355e9.20.1784827232312;
        Thu, 23 Jul 2026 10:20:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c? ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b846e43sm1635425e9.3.2026.07.23.10.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:20:31 -0700 (PDT)
Message-ID: <ce31de54-d46c-4738-909c-91ef229b7d9e@redhat.com>
Date: Thu, 23 Jul 2026 19:20:30 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] usbnet: cap max_mtu for drivers without bind callback
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Stefano Brivio <sbrivio@redhat.com>,
 Oliver Neukum <oneukum@suse.com>, stable@vger.kernel.org
References: <20260717151626.2913171-1-lvivier@redhat.com>
 <20260723084319.40fee97f@kernel.org>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20260723084319.40fee97f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 17:43, Jakub Kicinski wrote:
> On Fri, 17 Jul 2026 17:16:26 +0200 Laurent Vivier wrote:
>> Commit c7159e960f14 ("usbnet: limit max_mtu based on device's hard_mtu")
>> caps max_mtu inside the if (info->bind) block in usbnet_probe().
> 
> Okay... but before that commit the logic was also missing,
> and that commit only refines the condition. I don't think
> that's the right commit for Fixes.

So it's:

Fixes: f77f0aee4da4 ("net: use core MTU range checking in USB NIC drivers")
Cc: jarod@redhat.com

> 
>> Drivers without a bind callback never enter this block, so max_mtu
>> stays at ETH_MAX_MTU.
>>
>> QEMU's usb-net device (0x0525/0xa4a2) is claimed by the cdc_subset
>> driver which has no bind callback. The guest accepts any MTU from DHCP
>> (e.g. 65520 from passt), leading to TCP segments that exceed the
>> device's 2048-byte receive buffer and are silently dropped.
>>
>> Move the max_mtu capping after the if/else block so it applies to all
>> usbnet drivers.
> 
> A short explanation here why the changes was made under the bind would
> be quite useful (presumably it was done there because that's where the
> existing MTU check was, and the existing MTU check only mattered if the
> device specific callback could modify the state etc.)

Yes, I put max_mtu here because the existing mtu check was here.

> 
> It feels like we should update the max_mtu instead of capping it later
> for devices without bind (note that only a device with bind sets
> NOMAXMTU, too)

What do you think of:

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 25518635b7b7..9ec038a1b6f5 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1794,7 +1794,7 @@ usbnet_probe(struct usb_interface *udev, const struct usb_device_id 
*prod)
  	 */
  	dev->hard_mtu = net->mtu + net->hard_header_len;
  	net->min_mtu = 0;
-	net->max_mtu = ETH_MAX_MTU;
+	net->max_mtu = dev->hard_mtu - net->hard_header_len;

  	net->netdev_ops = &usbnet_netdev_ops;
  	net->watchdog_timeo = TX_TIMEOUT_JIFFIES;
@@ -1825,8 +1825,9 @@ usbnet_probe(struct usb_interface *udev, const struct usb_device_id 
*prod)
  		if ((dev->driver_info->flags & FLAG_NOARP) != 0)
  			net->flags |= IFF_NOARP;

-		if ((dev->driver_info->flags & FLAG_NOMAXMTU) == 0 &&
-		    net->max_mtu > (dev->hard_mtu - net->hard_header_len))
+		if (dev->driver_info->flags & FLAG_NOMAXMTU) == 0)
+			net->max_mtu = ETH_MAX_MTU;
+		else
  			net->max_mtu = dev->hard_mtu - net->hard_header_len;

  		if (net->mtu > (dev->hard_mtu - net->hard_header_len))

Thanks,
Laurent


