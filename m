Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076695;
	b=FwzK0EbDTVdk9A3GtXI9GC/5tENVoqPZmkj1OM3hb2Ba34QHuj28ejKgp8nxAS5wQEun
	 6YnZ42THml1FAT7yeM3UHNzqKDDwVzgwiWyQf4pPint4DqDIZHOop4xo9oTLMQ2sT+5AZ
	 o6M6NEfLMfLAkaDplFcMEBjVPu8FCwWxdm1toKz/8STW5aPUKvJK27YNVVL6CHxxh6vZy
	 oreqF5B3q4l+xUaKV6/lckTfa2GnA0FEZ0h2Ea7wp7nxZRMktHXMiQg0ZirrDGbXD2iof
	 E2RJ0HNHZGUHQOCETPKt8o5HF73gnaBeCy409IRHpEAgdFIHENt5sbCEAH991fQuaJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
	b=SEyohIfS3B7GBLICM8pwaNlrTxRyskmiPCchaHSEgg48N/O1SBpTCbAIsSFL+Z6gBhaI
	 h2Rk930QZ1dzudFMmHDiYpT+DGlvQRsg5OQRpFv5Iadjf/nq0KP2Rdk12fvdLAryMKxmO
	 k7v3WlKYdnprTjneW6L8+T6E7xVXq26cRTwR1XOe+efj79dfsEY4GQ11nLCQl29Ph0y3Z
	 Ram05JtKdMCERTGoMqdjKb1wxDbOMfGsWY6JOnGdVLRWqpAkahv2gXElwdjKZ048cEGRt
	 6xdIq3smCN6PaV7dwmv1KQnn3joOlZ19NgfB6PzV1DQsI+7+Xoq2jRpz3IvQ7QX94PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SiWbWZKn;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A62606A331
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A62606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SiWbWZKn
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so18639875e9.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795076693; x=1795681493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
        b=SiWbWZKnjA7Ovs6rPdXzbE3OUrZPjwvDAx0EfukuK5ewVvyVaeOblh8NlKLM1oCSUZ
         JwcCghmFTUD06I+d1fznzYL/gR7Dw74sYHaF7TEmhxIJtmY8lqGy6vOZ+ArbFSCZs3aQ
         +bkyAf/ibqQETB7LlauqcwizfTed66cCoBt2YM0EvWQBbMH7rZ2LNEVwYXKAl2NOhedg
         Uny84avTAI96pmlsPKvMrOCvd3fncfDofKl6G+nTIxx5NXE4jwjfPt9Mo4L2FnEeNAHm
         61BN1ofFzXhygNAuaPzyxjwARN3tyS6WLfzvMz51EVsKtQDFIMGJIX8AtYmMDSBWEnb9
         IkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076693; x=1795681493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
        b=HNCAjhrNemqlMFovRlQJuUooZAuz9pjPJmPgs5R+wfiso/RhthZ9qdZE4P4v6fC3US
         3M+yeTVlqJfpfIzVuvzvB1FahDs1T2UGTBu3ErhkzXn0dhBbrAySho9fZidYhSH2NejS
         e1FQ7SmdCjr6Ok5KtzWjg1wDvMzS392XHzx8VzoDlpwZPH9RTJRI65MiB8lf7H4PEqGY
         xOG3fzvyoD66e/gRVDLjXs0EDp00vh+D1+buFBs1Ho95j8x9lVscYdzPmnk7ewTtM9w0
         HdG65FRs0yUuMo+y7e5IAKEeicMJJU0ltCDoXvHR6/ktk0D7vyREZEjOTZ//jalh+3HN
         e41w==
X-Forwarded-Encrypted: i=1; AL+hErHx4T/chOSCLy/smuxt6MxxQkrh5IrQLsDtvCILbHeSnb7aJwAkFAb+NlZ1zcw9LktGg0XQhHBKDtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lWtUUwRawYbJgtsDCmhOhMrn7QigF7LbB7xUfAzDDiFaEJqLa
	t6RYFNGb+vytVhHEdPEuUDUQ2W/OHoX6w/WZLACinIyt6AvZb0M+H9eQZVgBBHXuNTo=
X-Gm-Gg: AYBFou26bhjo1T2jCCInI2zqZgaecCF4dZThN1WUpgLUgqiex67m8IJ0Foa1kBQUIfN
	mF/xT7nOsQ/ZzWLBrD70d6W7A8HNL3LGDTbMYbTIhe3y7ztg2Tb+UzVzLwILen69F2Po7xQp8D5
	XgEZj6D/7Q7lFwuIUnPaIkvMrcF29OH+2pwxsbENDNHM0ykiHxQt1+ctA8Grt1NwHQiyyqbp9JO
	TDeU2hlAe2UHT6K0XlhIi0KmE11+3xSwk7VHkLRsVIyyJsADTO0M1gaygUpDOxLaOXch4TbkKe3
	Bk26xYcgIri9FOo4CqqADuvO2NBZA6YYgNC8AUTagek9mRvr0QwHUtbht3aNShD1EKtWcblEfMG
	gOuLXPcztkKZ6Kzrwtn9wF80a2UIxM1oml77+2MPARn6jOHWBfupa+9CElGuVXbFdVvOYWsKiEi
	6/v2RPkuALP1mSx5slZKX6ISJAhYNDS2r/KyrjOVug0kiGSdXxLmu46liOkIRjggp2Fx4ldCjTh
	uBirs2tb6O0aI81+338+b71QehezzTjvK+dg368dE1xJLszSn+KfrWAvPE60qPwV0tnmVcNzf9r
	QC8RNwbWiwUfJEDcK9neEgEExK8VW6o3qBVVra3VgvEkNNSbbX59XJymuelfUhXp49fTh3GGk7n
	Tjae0psrnCbuzYPd1HWy6Qg==
X-Received: by 2002:a05:600c:3541:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb7da23d3bmr103851875e9.17.1795076692821;
        Thu, 19 Nov 2026 00:24:52 -0800 (PST)
Received: from [172.28.20.244] (ppp-88-217-21-207.dynamic.mnet-online.de. [88.217.21.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm18620975e9.5.2026.11.19.00.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:24:52 -0800 (PST)
Message-ID: <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
Date: Thu, 19 Nov 2026 09:24:51 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118145636.3534234-1-william@wkennington.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261118145636.3534234-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.11.26 15:56, William A. Kennington III wrote:

> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.
Hi,

thank you for the patch. It raises a question, though.
It is not clear to me when you use READ_ONCE/WRITE_ONCE
and when you touch the disconnected flag directly.

	Regards
		Oliver

