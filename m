Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBC1D7E5C
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858998; cv=none; b=egaOtKLh3bw2t6rrSr+lTNdPPUn9HIj4KJ03Fazo+rficMG+xjrRmQe58L9m6zb6tbp6AjvKGm9rnldj+hJCFUErZwAuhKGIHWrH0JimCKsio0ctxuMwV2cJh1uckoJ48dxSLIZ8gja29fp2k4GDo+X2YLqzuJJ5oz8WYW59XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858998; c=relaxed/simple;
	bh=VcOHWDTnnl6g0WBCWIDoq2YGdXIi8g4W8Az5JGVNyKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQWTJCsUPE0fuonC+DMO/XnLng673xiYOrnisA3WaVG2HMNAWm45J6IPGz4xQCnWhAHmsHR0BI+ZaPb1iaRMsKJoDcMdBhynuhywWfSbSVTyPTDAS4Xp9V3edsK0psKBWh8ad9KiM4buzIMg1gndcTApWwt4ylIMDS68EfdoDxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f/9kMRtt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f/9kMRtt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so39976105e9.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790858995; x=1791463795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rA65ySEetIh5khnLT1XBKCYJyo89EMuZtxcz1hrLdGc=;
        b=f/9kMRttHAkGFR6MgIvngE/PdBynpVPCv6oFFRsZ9ywwYFYfqlxuIh085wHQN4DTXz
         KqfSdasgnjAiwPTK3cTslL6oq/4t3QPomJK6yj4P6kmVjZrGfk9q69asHtdVfBQRAHdh
         kpJh326YtyDETv/FxDMflyUYHMxBPrPW9mC/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858995; x=1791463795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA65ySEetIh5khnLT1XBKCYJyo89EMuZtxcz1hrLdGc=;
        b=L6KaPvjnB4mZi26hXAFCu7voNe45ZDy2xi6IJknxrPfR0vAA1jkskbJ6lhyfIKmL82
         lb3606W20nKm8jMIi2lXLAy0vCufR7nySgNeVxCk3+M6UKvbzIM7eu0aPjTZnW5ej4o5
         pjDynqKY+EwY5UBCbwQoXHixGr3lCkMpbuTxpMSsGsPV967voUa+hl8BV5VYPr8bQ/b7
         XQ1rHguqYxd2+U8Y5mAHk4fnYwMjHoeie8dswss7K/YqbHfUq+NE1SwJbwv8wfxO0+FU
         bmma0kE5vfLXeERVTICr+/ku1xLnVTmOYOQhp7JMgSvw1zS3uTOLmQhiMLjQE77Sb8cQ
         MPMg==
X-Forwarded-Encrypted: i=1; AKwUvBx4UiyTB/OUGVeLq+FmnL9vJzYP9VZ1ZorPtjVqlOQ6QRLZfwlLnELuQHnXeDFkGRVa1giLF25RBjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lwkwWprBBtgBOFnEd9G04MFZnGw8qkjlcAPdD92d50T3USNikP
	IVMxIxJnBrhkY3SgpWStJE17pI89DFmzr7Ib6Rlx8OEbSYXnOOacx3eh78LCTfNHzIc=
X-Gm-Gg: AYBFou3E6YXPVAtXFeV89GkgZYtYCSRX8Crcx/nDaG/a/L13bBPKdZLK23s9KwwCom+
	HVXOMMKelt0Lq4j91GWlzZvxL0yxTm+N1x3LhuAIjB5ibEZ1LE8jh/YPpIs7ELznwqGwrDFKf1S
	hrINtkAsvcsX94s11nQKzrIPoy+8T3FQWM+xQLrCCqCmxFt09YVPxzhtdeb8kvHE0IweFYkjMZm
	X5UmockxnmY7cxtSTdC5zHWhyitb04X1LsASCIEHR55X8JUx8F+DZ6WiaJ/ix6/anweqfCTItk6
	ttuL+D5SXJiGZpTszDOLgz8SLLlvq6QwQMmAkH5YPgIau6cVtjCg2Vyl9fv8OsUs0tLvr8vc7xe
	vu3UAYo1UaU864z9qdKB5L8ELisVZ5oGBRC8LKHFcvPP5q6JsmADJL6+xxFySfCFSEsenPNMsk7
	9TBAC24d1mhaNZoss/E49RCXyGg5P6s9HVfjNuiWkaCtoTVUmOSexYccq6ZS1uZkRGFDNkw5DBK
	9nDo7ew8oI2QK7yEny1
X-Received: by 2002:a05:600c:1d18:b0:4a0:1fe2:d4f1 with SMTP id 5b1f17b1804b1-4a01fe2d97dmr36275505e9.28.1790858994751;
        Thu, 01 Oct 2026 05:49:54 -0700 (PDT)
Received: from [10.188.175.252] ([46.140.6.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm55621285e9.3.2026.10.01.05.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:49:53 -0700 (PDT)
Message-ID: <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
Date: Thu, 1 Oct 2026 06:49:52 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Jason Colapietro <jasoncola1@gmail.com>, shuah@kernel.org,
 valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 22:00, Jason Colapietro wrote:
> Hi Shuah and all,
> 
> The exact v7 patch has now been built and tested with a native Linux
> USB/IP stack.
> 
> Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
> usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-1)
> was bound to usbip-host and exported by usbipd. The client connected
> to 127.0.0.1:3240.
> 
> With the unpatched client, "usbip list -p -r 127.0.0.1" still printed
> the human-readable "Exportable USB devices" report, reproducing the
> bug. With the v7 client, the same command returned:
> 
>      busid=2-1#usbid=46f4:0001#
> 
> "usbip list -r 127.0.0.1" retained its human-readable output,
> including the device path and interface details. After unbinding the
> device, the parsable command exited successfully with zero bytes on
> stdout; rebinding restored the record.
> 
> I also attached busid 2-1 through the v7 client. "usbip port" showed
> it imported through vhci_hcd at port 08, and lsusb showed the device
> on both the original and virtual host buses. Detach succeeded, leaving
> no imported port. The build, list, attach, and detach commands all
> exited successfully.
> 
> This was one Linux VM with an emulated USB device and TCP loopback. I
> have not tested physical USB hardware or two separate machines. The
> existing option-order behavior is unchanged: -p must precede -r.

Please test this with two systems hots running on one and client on the
other. Send me before and after output that shows the bug and that it is
fixed by your change.

thanks,
-- Shuah
