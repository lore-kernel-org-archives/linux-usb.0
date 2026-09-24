Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4D47887F
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245454; cv=none; b=phN7G/c0s4yEqWQpxgel0WulJgEzRHo8260FPc59rfGIrAtF4q7FaPbr0iSpKlrqP4LY+pi3vbNptfMymuZ/5S7F3bQZRntZ3XoVFa1ZosLZdtK7AR6gX4dXAzW3OSdvfBAO9HZP4mTImvPVLaiREteZCdNeNlHSNf8eXDWAnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245454; c=relaxed/simple;
	bh=/I7sMKRC+Fm/RMOumClgldkrmS5D2N3LRxy0pszOg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQnawdEcOv824XtFFM7V5Q2pkkcGBZI2yPkz5qZoZ/pUiXFwiUpxyaDVCOBXVC75oEdK+epnV9qhsy1gOvc9KPH7CePx0K2BQlqYxaSdMq5YcUEEBddgot1NMyFzkpx+d+9Zrb0p2bew4HYFA6VGb1aU+TtflvJyrdnEGEUssrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXIReeRt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jetjw+p0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXIReeRt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jetjw+p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790245450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
	b=hXIReeRtmdztWdNm93WBpP5nhcBdOLR+FevhnF/gt9JaH2QKBflgOorkLHSg5oSQ1eRH2U
	KcO7q4c/i2qArJFvv/dsCfDRV1p+0QjOQbNHgNDlC3EX5dYWmleUzYzzilXIGJXwRtG1WH
	Pzjjsc1MOBbWs1BERyy33e0hxNU4aPo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-hwVKueWFOSudR--R0XTHkw-1; Thu, 24 Sep 2026 06:24:09 -0400
X-MC-Unique: hwVKueWFOSudR--R0XTHkw-1
X-Mimecast-MFC-AGG-ID: hwVKueWFOSudR--R0XTHkw_1790245448
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso16299345e9.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790245448; x=1790850248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
        b=Jetjw+p0l+j2Sxgn8CqbAnf8sEthYJm2QROIeqJNHCOqddxM4t2MUsTeAhf9Lu6Szp
         2PyQ3mMNvp1B1MyikvsoT2ICLqft92Tk1Ce/NVG0nAD1I6yvukwgvoHvoVm2VkuQAVM+
         sv9cOBYRBZkNtxz45f9KxA6V+2pkcU+4AeWGEBd71sKlpww5HdWzw8oRfrA9rrYeBTZ1
         hBzm3qiVZ8rqkUWJ/5zSq8yA8T7aAd7GZHVkBIj5CJKcNMxwR9IcGtqPFai1YQseoAB6
         agHZhGPWSpzndeQwdB6rbbhtGNMAX7SFjbp9pAYP0Aowd0la9jnm1AQ6Gxs32c1XnVIM
         1h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245448; x=1790850248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
        b=gDzcnNw3k6QGN1/e7JVlkE7dfTp81B+iDzWaAtf/T2q+uKXBqNKXqWkviOpBdbSdsz
         JI5kjjDSRCACb8h4/Z5LmAThkbgeYsIoco5aDZ8ddp68oN6VxDd7kR7lLjPeEArgs0cq
         E0aVjrnRbX1YAJDrCiFA8rhwRKPI80a7If56quQpm0A8j8MfWGjJ8DTz6GpvZXnV39Aj
         uEFSiHH8SZ25+h4eZ4f9FIr+qAKVkSIYNgar0ndviHhjaWlkf3cQc6q77YtQqpLO/1+R
         CXIezfrykAzjtgnHSLQP8Qdw2R9jKf1bnu69H+tLEWIdELZFqq44yScTJKk6MJqofn79
         MQOA==
X-Gm-Message-State: AFuF++kvfgn043HI9Dm1GaEY6RL78MJySmHyRjeaxLJoUprOMKyD2cuH
	lSlfYo7ZkShOLKdv+8VNkM1MI+8g6onCAiesgXUgddTi+cFYuvpmphkVkDZlUuAArI4WjXWH+cJ
	UF2ntqYrO4EljdGVHckprVE3tIoSyxArSjuQvnZvIll0akCoREnSnMMCujBchjg==
X-Gm-Gg: AYBFou33pTsnmx+ZdT/JBsPS6Nl+CX/Ig2E+p2SMvi24x0qKqJhHATuJ3TUu/LfbHdp
	pzxMmwDN3uPQ1r6k+tPSXSyDCh1nsBrb28mV+rzq4VLxfn/+u0q1pxwtOh1c/0cJsIoWts/aZAF
	tBRvbXNc95tQ/V2GZhDw2vF3WmcJr+fdGi0gWZSe9ggSVJ/0jz9gWN+i6EV38ZpZeTtqCVyePA/
	hjRyOd4oTgnETPwfTDZupsbNyymqBgCeTcWbOyq0GzWsUu5XQpnO2/dWV9tBMPBa5Zx6+7+9w+2
	02FgoGYkaqXfM2ZpSyVlZz+bJ9ao8R5n75Fbkd90QxC9RPZvZLXfhObw5AKeQhirBav6yRwyH0d
	7JrvSFSOtK0KPrFD+AEfeg+W98Ri7FUtBsfN5fSr5fGxxN77+WJl8i7BmMZ9Oh+d0YX8zB7R93A
	==
X-Received: by 2002:a05:600c:3515:b0:49f:d778:be09 with SMTP id 5b1f17b1804b1-49fe66fcc19mr33137675e9.24.1790245448042;
        Thu, 24 Sep 2026 03:24:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3515:b0:49f:d778:be09 with SMTP id 5b1f17b1804b1-49fe66fcc19mr33137285e9.24.1790245447655;
        Thu, 24 Sep 2026 03:24:07 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c59dsm52797735e9.1.2026.09.24.03.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:24:07 -0700 (PDT)
Message-ID: <4d5e2857-e6eb-43e2-b668-83e779aaa734@redhat.com>
Date: Thu, 24 Sep 2026 12:24:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP
 whitelist
To: Ming Wang <wangming01@loongson.cn>, netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org,
 Oliver Neukum <oliver@neukum.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org
References: <20260920074500.826121-1-wangming01@loongson.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260920074500.826121-1-wangming01@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 09:44, Ming Wang wrote:
> The MeiG Smart SRM821 5G module (0x2dee:0x4d53) crashes and drops off
> the USB bus when it receives a Zero Length Packet (ZLP) after sending
> or receiving an NTB of exactly 16384 bytes (tx_max).
> 
> According to the MBIM specification, devices do not require a ZLP
> if the NTB size is exactly dwNtbOutMaxSize. However, the cdc_mbim
> driver defaults to sending ZLPs for devices not explicitly whitelisted
> to accommodate non-conformant hardware. This default behavior breaks
> the strictly conformant MeiG SRM821 module.
> 
> Add this device to the ZLP conformance whitelist (cdc_mbim_info) so
> the driver will pad the NTB to avoid sending ZLPs, preventing the
> device firmware from crashing.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ming Wang <wangming01@loongson.cn>

Before any other step, please read:

https://elixir.bootlin.com/linux/v7.3-rc3/source/Documentation/process/maintainer-netdev.rst#L454

AFAICS this is actually support for additional H/W, just worded in
very unusual way: please reword the commit message accordingly and
drop stable from CC.

/P

