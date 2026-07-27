Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC173405C47
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156852; cv=none; b=AFs7Gnmii5UdWlYcTVOjSWK5E6xGZTSzsEkIe4WVxECHgQhZ2EXuBCrNdwi8cp3ty3q3TXmiObfgQv1H2WbB+xeadyjxjyMITuHOIdOmh2NBy/bCWkf2cImi7/kTPhUSXRGQuG2ATi/6MuLJsOdQoy52ZiM4SXvGZrtyePfVa6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156852; c=relaxed/simple;
	bh=n8zD+KBICI3FYjOsbmH+e8vQyG2dF/F/2s43FdFTwwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2XloHcabkUw+1CdiU1KdFlgLoQ0EO1W1IUW2Ycc+lq2YkKEZUo/8LjPj1bo6EXk2lA/u7hQU8Y1AcCjxxLRoPiZDHY/Ye2NUyDqciw/Tf5KignqeuWHflHdWhf7bIqH/ajEpHTlYU0L3OxFI/Kxl4gU4tJ7aw43SyP61gke8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cIz8mkmq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cIz8mkmq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so842197f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785156848; x=1785761648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zi1T+ervO72hPAhvtSTp+J+71PJ/y6xxamrS360Oo9U=;
        b=cIz8mkmq54fHPH8POCSHiFUm4yXqu3Tq56Fwzugq29s5wKt//qR6/eKV02QQMhfgtQ
         8XsfrNHeLkAe48A0V+4lCgCsIIShsZz2oyFmXZfZObdonaWWOdJITG9D1+hBKS4xxWLd
         wPq9oSIn/klxOd48PcJgdL/msbtRosfqQkgmdqBZpq/s+S1A3j25UUBW9YCaUuqZTPT+
         Tw4ufmsZk8R8RLkSNDqkBLRJsOQOXKS3dpr/THrPIUX+nLh7DEeTUELCGGFimuBsqwPB
         AX6FUJCKCKZe/j6uTIK0sxst69hR8INWLMJSjxBE3ERawVRwOP+/lJOADkFSvgDVZni6
         nskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156848; x=1785761648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zi1T+ervO72hPAhvtSTp+J+71PJ/y6xxamrS360Oo9U=;
        b=rWRE/ldGYsqN27mDFi0sdT4CVnkDs+RtYsyOZ2epnAegiakmi6RbWl0JPiTwO8peCx
         bJ/L96P2nUsBe5fNl+KPM0TMQJBGpaMUdHGRHX14XNZ1MaFSRVyfzv314hgl7CG322NS
         wxxHC4Y1vEkwQpBJ+yeZgaiIeIpYgNpjOYUOn+QD5p3T9spaf3I4wUyqHRzdhk2nWWMF
         g5BQKLWxsgVUD5xEI3lbyq7gzYwmQnwozpGiW3YGEjfkLN1UprwHDVaGJC7ltjhaGTih
         HYwTig2H9EgpUv4ifWM/SUxCsP3wGhHQl1i7+zN20SYdNYUWrs84qmCi+fPVz8inTAGz
         5NzA==
X-Gm-Message-State: AOJu0YyKPbt7wb2jJZ0HdS66Vr4GNtVYSwdj18UNBLe5zJsT7f7zXvp0
	TUinFuP0q1UnzdGf+3k/H8P7Ue1xvnuhUwHQUNU2xMURE1qaDr9Phet5fubZrkracdM=
X-Gm-Gg: AR+sD12GkFN/ldDn5tkxDSA1Olg5izBmjKU4AF2vpUMFW7GdNXubvLxnf0qwUR8zC06
	s2WRNZxgHTHIWelT2IJ8wWDRVr/zk74YUjJ31CA6sa2aHUaJ7MKeRTNR+bjgre2qYB6JqyDelGp
	dXTkj1me5vxE2uLfH+KI/ylcw6Ck5DRMqoBhhk145n0ha2BqmJdXjmuXtOVJgMWUZA1n0dmta0S
	BWvBS9nJTRQy8/fnq9JdyglaMl+qPxS/niiMPGA/tZOVzSdxaHmUbjGz88yjROlN5RLfw68z/M5
	ygwtIzZs8/p1ABKke0uzm9qG8QgHYry9NGyOQ5Jpx2jogzNi7hrKt2xTYGhbZwfsmYyDiZOUc8A
	zC4u/21hmUCgU5adTDT91t/4snz52D2DOXNfloK5Yr2DmxRCY33993uKRRGBeIHB60E8O3TiBgc
	Xfr9xKEVX1dnfzLU/jCFrbg55e6wbQ4arUgxBQz/ESgVUu
X-Received: by 2002:a05:6000:60f:b0:47f:7531:3e6d with SMTP id ffacd0b85a97d-47f9fe9354fmr10353166f8f.38.1785156848207;
        Mon, 27 Jul 2026 05:54:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:1349:a501:c269:d4d5:feb2:1d42? ([2001:a61:1349:a501:c269:d4d5:feb2:1d42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm48979060f8f.8.2026.07.27.05.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:54:07 -0700 (PDT)
Message-ID: <22bdd65d-efbc-4229-a66e-62ecedd6c0f1@suse.com>
Date: Mon, 27 Jul 2026 14:54:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: xhci: Add support for eUSB2v2 1024-byte bulk
 packet size
To: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
 <20260717-eusb2v2-packet-size-v1-1-67c611bd0c5b@cadence.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260717-eusb2v2-packet-size-v1-1-67c611bd0c5b@cadence.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.07.26 12:44, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>

[..]
> index 75e2bfd744a9..3b4f7aedd381 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,65 @@ int usb_set_wireless_status(struct usb_interface *iface,
>   }
>   EXPORT_SYMBOL_GPL(usb_set_wireless_status);
>   
> +/*
> + * eusb_update_max_packet - set or restore max packet size
> + * @udev: target device
> + * @cp: if NULL restore MPS to 512 else set 1024
> + *
> + * This request is specific to eUSB2v2.
> + * An eUSB2v2 peripheral will revert the maximum packet size to 512
> + * for bulk endpoints after bus reset, disconnect and deconfiguration.
> + * This function allows updating the max packet size for BULK endpoints
> + * to 1024 after above events.
> + */
> +static void eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)

This has interesting implications for error handling. The command
has to be redone before reset_resume() and post_reset().
Hence if this fails in these cases you'll change the packet size
behind a driver's back. The same happens if it initially failed
but succeeds before these two operations, only in the other direction.

IMHO if this operation fails before post_reset() or reset_resume(),
the driver will have to be unbound. Likewise if it had failed before
binding a driver, the failure has to be recorded and the command omitted
before post_reset() or reset_resume().

In any case, this function has to return errors.

	Regards
		Oliver


