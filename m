Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BD3B8945
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859239; cv=none; b=mUPHpyi1NXvXPYyOP0MJ2kEQR3/sSSA8XMmIcQ4z+yXUzExl8ax9/75+xj0yxf0AxxachchbpbKxjzganYz//Kk9JI1CV5EePiY+T5ycgRNxsyfMJwl/mdoXkgLqOIGpAcr+Q2qWAy1srPI+iukA2fgH4uxZc4Ao5WyESF3WYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859239; c=relaxed/simple;
	bh=iO6ACXtbQ89OMoYuGfImztORxz07SfttR06dY6iNrdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtD8EPGLyz7gZJfH3Ltml9BWmXcozOUXCCeWEdstUXSnPynhikHktj9HkHOySQ7N1RHLhTeEpYw83GBSq6nlDF0v/RSB5DGezUhEHYKkVMKY6M6nj385O8fvP1Wocv4yhVBvH7lZxlHhCGjAi0wUN9kp0xWUIoeA2PhqWdECo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YWTEPCtw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YWTEPCtw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso182694f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790859234; x=1791464034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjewsoWKjWgTJS0BtGGvt4SzdxHuu9lC0Aa6uOZYHh4=;
        b=YWTEPCtwhmpmg1oVWz3fuux7xoW7+54slBIvmxJwYn6FjpjgEY0q7dG3IBkMoFx1x0
         7VU7Tu6wuvOflq73jxBhIbW1KI9kD9xYNXHdXmkSVg9pXNq64tAF8neFtin1cFdyeJag
         ls5s5oJjwm9TwsrO/FnjkytLWdTdnALucVtP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859234; x=1791464034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjewsoWKjWgTJS0BtGGvt4SzdxHuu9lC0Aa6uOZYHh4=;
        b=RLqiODoFm4Ea3GLTKgV0rfytOB3ulHbpeReCUfYHDCwN1RQlMd+dtJYWE4VBXaRNJO
         3uZoiHjNIqvGSQ/VhhSw070Cj28oZF0hGMDv8zMYCmV/qxm6AT/tABofsQKS9yVX/7NK
         tKLEB44c72z11MSu0Zia0j6dsD7uCDsdSWhfSHTT1smry8AlU/bNNaq7uSDj/vyD0acJ
         Eou/gn5pXCXapzz1lQUyAMacCkZB2U/CBCTdrpT8J8uRrQ+jR5gCUR0VrwHvwYyaL++d
         ChZfkuoV/CPreXVhu+sFPwqMh8OuU16vxzEFQ35606eZ9bRsUPxir+S0m0R67n1UnN0F
         ut0w==
X-Forwarded-Encrypted: i=1; AKwUvByQhXSlJ+sj9ozNvId57j0t3mruvl8j8Li3UZIrTjYTVt18kLYqB8768A+sn1aZ6q7KTDB4hY9qnhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiK9p3rPLio8dCQDTgryJYZiJryYkoPBeKzY308MnZm5DozKQw
	Pd585gP+7mE+7af9Uj8EPpsItsyvaP8NC2LtbFRCjek18ShaiY9odfT7eBdO0uychFq4lHDq//G
	0tagyALDUxA==
X-Gm-Gg: AYBFou0ZhQ0i/RZu966uRkIu0EM8KCKm/WYf3WreN1wtJKbuJehPo/Bi2fefcENIEvs
	4a5XSYhv8/8rIeO9ueEFLSZ4E3BdKOGMUONfjrXdqhGORyv3qydbQBlwaf0M2Ornn5xMiIUsSaI
	25tiUj3qxvXWPVUfxn7gyb7pbGgzu7vMKnxn6go2VWe+xvPLkex4HUdj7GIDNisvsUcIv3phwV0
	PNXAar+bASgtChqYUeC+w5IIMAstqepuJS9SKjV6w6jpRv0uToeRITnERHG8R+zM/FF5Vf6k8yw
	Pt7AwFK3RVrqR1bydVL00zRedGhkvUaBeT20mZFe8B0DEY5qAzhMkaRTm05LiR57cJXK8gZhj9P
	W7yJ4fHsmOysrLKBmIPZaexdjU24XgKBcWBInvLXxTuMn01f60M8/2h/WUdwYgmyVIkEode5gfB
	E2UP7uCN/UcP0MIWYlIMQL8sXcwl6ERLJjDPrqcrikBRrPiUFjfeoUrOnfxhrzHAmLLQYQEzmcD
	Rt9IsELzg==
X-Received: by 2002:a5d:64cd:0:b0:48b:2eb:5aa8 with SMTP id ffacd0b85a97d-48b067a764fmr5401311f8f.8.1790859234432;
        Thu, 01 Oct 2026 05:53:54 -0700 (PDT)
Received: from [10.188.175.252] ([46.140.6.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm5468346f8f.23.2026.10.01.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:53:53 -0700 (PDT)
Message-ID: <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
Date: Thu, 1 Oct 2026 06:53:52 -0600
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
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/26 06:49, Shuah Khan wrote:
> On 9/26/26 22:00, Jason Colapietro wrote:
>> Hi Shuah and all,
>>
>> The exact v7 patch has now been built and tested with a native Linux
>> USB/IP stack.
>>
>> Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
>> usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-1)
>> was bound to usbip-host and exported by usbipd. The client connected
>> to 127.0.0.1:3240.
>>
>> With the unpatched client, "usbip list -p -r 127.0.0.1" still printed
>> the human-readable "Exportable USB devices" report, reproducing the
>> bug. With the v7 client, the same command returned:
>>
>>      busid=2-1#usbid=46f4:0001#
>>
>> "usbip list -r 127.0.0.1" retained its human-readable output,
>> including the device path and interface details. After unbinding the
>> device, the parsable command exited successfully with zero bytes on
>> stdout; rebinding restored the record.
>>
>> I also attached busid 2-1 through the v7 client. "usbip port" showed
>> it imported through vhci_hcd at port 08, and lsusb showed the device
>> on both the original and virtual host buses. Detach succeeded, leaving
>> no imported port. The build, list, attach, and detach commands all
>> exited successfully.
>>
>> This was one Linux VM with an emulated USB device and TCP loopback. I
>> have not tested physical USB hardware or two separate machines. The
>> existing option-order behavior is unchanged: -p must precede -r.
> 
> Please test this with two systems hots running on one and client on the
> other. Send me before and after output that shows the bug and that it is
> fixed by your change.

Another thing. This needs to be reproduced and tested on the latest kenel,
Linux 7.3-rc5

thanks,
-- Shuah
