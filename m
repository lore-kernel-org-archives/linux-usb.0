Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105137B3FD
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452169; cv=none; b=eDYNS4YCJG03Z0WfQ6pcnExm/NgXBuR7OzG6QlyULbfYfl1tNQbqhfO4WlkMhvLho2DtksysCTPqYjli4/dtn503g32vxwlsOXBEoQ8SWGxARe/FTEa+eE0yRlMHI5JKahdmrgCvNxn3VJlr5ZHGiHYZsa/aoaJvrWjb+KTvaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452169; c=relaxed/simple;
	bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5sGTu7/F73UK1CRc/TH+zZ4qNfuLzjGjiwB0Gs3+JkhLsvcFVHhOuVlaYWXdVRISi9eSg2SBJmeovo6QskKEHJsoo8+96dbj9/9j/c8t2rJur1rLCAe1f9fBpUEivFWPGkiSx1fi16E+8eENxnoO702LE3hzltPiil+qZl9n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d/hPTyT1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d/hPTyT1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so2724055e9.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790452165; x=1791056965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
        b=d/hPTyT1+1vOyCgAJJUGe4lMmZl5bq1zRgOIrjH81Aw87tMs6Q2d/xlMplTucUvA+O
         Ps0dFGOOCSFM36fmwNmF8W5dpimIRQPuCshXz+nDK7/fjOl2OMCbNXQaDpXMlrMpqm4E
         mtq63JMfPeizK0m/LqgxDQed2hveLCXZcMDtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452165; x=1791056965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DePFCEtObnLIzGyGVncSOC3Te/jkUfVOEKHBPWr07w=;
        b=JEo8EJfv2ISP6YW21URwGdCVfHGXHfOZLjopRlTptI9hVLPpHKcRXe90aSAk2V+6VB
         tc8F97X1gCvgKuEOMwv0t3AA5prxmafjuwePAfXzF6EU2zhSVwLB41M4UzEx2oM5yL7V
         aPSG5fc6+7qagNALkzMjB+/YWBteWAhgPnj8dodFKLQpipab4mpTFdm7AIBPmiXdQA1+
         LMAEhj52lD3QDuVnSJKurwPgBeLBh5yKs5rrXwDAMVCSZDxWVn/o4SnDYNVy0n0Nr2RI
         bpq8fVJStxiZgAdsTPihezzNt7Xf3g+DAAR35px1VLdMu6EbUC+h3El83CaTIePfkKQW
         5xoQ==
X-Forwarded-Encrypted: i=1; AKwUvBygfF5/xFpyH8kGNY458tpnOQBhT8VbfJ6hnVK+Rb0RcmVKQVlQBdQGL3V5DsCVxgXaI3pUxgO4qn8=@vger.kernel.org
X-Gm-Message-State: AFuF++kXxE4ooxvGi+j3sAmEecdaVmqR0AFOqpqjK33MKcD4rrAOzlkC
	MwCC4VXf6UdVRFltPUWi0BxOZqsOkgVeEYXm+DvaPeCjehNxIYN+nmAZznle8V+l6zA=
X-Gm-Gg: AYBFou0HnVamwqVjmv0mweikS41vgzJbAEPIfDQBb6TYuyG19wcOTV1eUtMZJ5OyYhM
	PQZuZMxSLYyVonaBOP9OswrnE81pGWHWBpBZGrEMoBeyCDEO4aR/HaiJrb9ByI787jB1Wmjm6KV
	DsIVoT4j2OSe3g0HAhQk8v0ZjxFav3ypvn+U4Nhz8DC4cKqJJqTBYGGzq7eO8Yu8j6wjiiB8DIl
	o4fTBLemkBB9MWRlt3JvwD7yUXzO1u8ejSCrdI9fMk+jepG8YGY59XQbheQV9uoVhaBD5lViXlh
	2GHaq2i63z7x5A+Lwrlk0dn4in30H9VAE62bIaO9uwJC+4ZsnW9F/06BuD1iPuKHN7pCPxdiQE/
	VPrjmLWvvWK8X8X7OjE7v0ZsHgnOwfs1vtWzyEMOK7ffTJsYS18TIgHoHGUdnQx3WZETZSGKANY
	Slf9YuK24DFS03UvjSyBf5z/MFROyHFmTtg7asay6/pqYJXpukL+yJqKlufdYugvpoQh3E0NaaX
	CxD4Cz6FdKuU51D7s7WuRJ6+N1v3durlQqqc91xftinHFLY2/YH3uqRyA==
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr107860355e9.2.1790452165483;
        Sat, 26 Sep 2026 12:49:25 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm17547635f8f.20.2026.09.26.12.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:49:24 -0700 (PDT)
Message-ID: <eeb557fb-7ae5-42f6-8167-83c3828169ef@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:49:21 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in
 favor of drivers_probe
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org, stable@vger.kernel.org,
 syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
 valentina.manea.m@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
 <20260820101800.14650-1-jeffinphilip14@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260820101800.14650-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 04:18, Jeffin Philip wrote:
> On Tue, 11 Aug 2026 21:35:39 +0530, Jeffin Philip wrote:
>> do_rebind, which sleeps normally gets a mutex lock. However, it does not
>> or should I say, cannot check for null udev between spin lock dropped in
>> rebind_store and entering do_rebind. This is a potential race window
>> already. So, even if we check for null udev under spinlock, we cannot do
>> it outside. Regarding do_rebind, it is called during stub_device_rebind,
>> but that function is called during module exit when all files are removed.
>> So, do_rebind is not designed to work in a concurrent environment in the
>> first place.
>>
>> We have a safer function that can already do what do_rebind does,
>> drivers_probe. So, we use drivers_probe to rebind the device rather than
>> use rebind_store.
>>
>> usbip tool references this function immediately after the device is unbound,
>> which is safe for the tool itself but since we opted for drivers_probe, fix
>> it by using drivers_probe rather than rebind_store after unbinding device
>> which is more safer.
>>
>> Tested and working in both userspace via the tool and manually echoing
>> the busid in the related nodes. rebind node is still left active with a
>> warning to use drivers_probe upon encountering rebind_store.

I want to know your test setup. Can you reproduce this with usbip host and
running bind command from the tool?

Also send me the error messages.

thanks,
-- Shuah
