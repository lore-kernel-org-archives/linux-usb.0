Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696801;
	b=DGKUhymPB0ISem8B6T8X25jMj8kBPgVQy4OIJPN2hKlPfFb+74obT5WVMlqVuVyvxkyK
	 407I3doD3z5Zn6zKb3ejiQZFwYDEYekWzWVDv0GnuehCpvgzX5XqQ1DZXz7z9kR+CwJiQ
	 NV9zfz+Utkv+xWVD345xkLkkumx9hwMecY77ruK4Dfi4xyVRvjKPnP3z/o+BUQ8WnDHK4
	 x4Xd0PJ/ZMZwY4gg38gDDcvULW2RCqR2CNHeokBbpwLpzZg4RrbChCgpuwiKA2yvit5ry
	 MI40MEU5K8SxnpvVBavKqv1sTu9Ex6vuecfwHMVkW7QP1kQhmCdWd+9J2njK6Tk047A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qPUA0tYF2NIjDvPMT86AcZAvNEU+x6KNl319uLJ1Bcg=;
	b=OtXFl6r7+jiaWqyliMH5zTSjJupvl/0UudshOnRqCpHhOqWQmhkH6jRtv03g9WYzNgCB
	 wdPeOe42m08lHUPCIZW3z7Eb6sEGRA3oM80CusaRa9BBQ1tdyeYBANptJ+J4pJeyQOyiN
	 qzxKGkBERrQNBU/UZe2wqPF+QgelaBdkJ9KUn+SRpyXyfJ4sxeC3Nb3JdCGCPUsq8m4/p
	 P+mVC131Te4r6Hie3hqm3ESj7JW/FbzesQ1b/Qfaapom6kplLN1+TW46XN2SV6pWQVGAG
	 XKgGw+dMlR+dvz4W0VspIl5rAP9gt+KGJPcsV58b1pZ8OYdVWG2nP8rw4lIfWyoyxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eC13GFd+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6386606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6386606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eC13GFd+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so16466625e9.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795696798; x=1796301598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPUA0tYF2NIjDvPMT86AcZAvNEU+x6KNl319uLJ1Bcg=;
        b=eC13GFd+lh9YmREtdvxdIs3d045300VCGk5Z6VNPVPLmJaQqzgl0iZUWXvN7NGtNaj
         VzRWt+IWvRybMPlDjq2p2vdwUmZeCF7lSUu6P9FwTqAMb2PN5/MLpFQFgAepxn+yHiFK
         U984yq48QQhGQnJ67BuP7XSHIlN3E9cutOBDiNEnMrUyuYDV+Cnhn/FcIC1QYerKaaxd
         NrLShtNhEx8QJcAz/SICrs8Dj1vDt3+rENF017R1MZqWWm4Emf6KhqMQT63TLP2vb4Ui
         5CymRLIVXYIBhhHC4vjlJP4UcQaQpkxMzfX4bSIWCi0Faha0Oz2/GAgzxDjo7XjYZD5g
         /Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696798; x=1796301598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPUA0tYF2NIjDvPMT86AcZAvNEU+x6KNl319uLJ1Bcg=;
        b=MEBri34Mx4CbtFyIk99sUETrl3OddxRaNtOIqiz8XbGLqJUOz+7fj3Uhi7Pr70Di/J
         v1+bcxT/L5pAX930PewdKtZnJmVbb0kfyLsKrQjEZoNLtLxmEiaWxLLeqoOA801eV/VS
         e/kO6qcHHY9SEYX0PGoa0rW6R3FlYcSt3hTxIWX8/17g/yCXQ3P+6yn+1/90zCYAd2Cg
         U+MsAZAGWSj1f5V5BJMzwOdhWrpvJOIk+XkN1UeMepJPVVeb+UKyB9Y4fH0GTd6jUBc8
         DiYsbHRr6QlpAeaKcWs/fIEcoJdmSB3r8CypuYF8c/y/yL0QEYqsWqCjsR5h4hPNrGWk
         wDZA==
X-Gm-Message-State: APuU4Z8NdmhXGspD4ih/68LR0SG9XAy2qnteqO1jEpcjLoj4sq1ESWoh
	nl12ydi+kCN2lsQCnyRVp9QupQEvzt933Amv71yiKVpYzeRKGh5s1RxxH4Dan5z5wL0=
X-Gm-Gg: AZFdTZc4/lzRjopFtCg0vCHljLBxoU6+5dz8eGdnj1tNMSAF0R7AS1HQDmDHWCnoCNJ
	7Fk8iTMUdn1OZbwcVOBfQuKU/TEWSU1zOY/sMmjYBB02qrslEq6LYjH4YJC0P4sc2A+yvUswQTj
	+rkLoZu12fLVZz5NH3+7T8rnRBnUICz9Jl9GYGsdRbuVR43/iU2fVlO1luoFXpDY9KHIdW47G5E
	TkXImd15wB+bolUde6veTWr684eUznJWZaS/0+UAjwn0uXFnUlw4PWQN2Qfxvjo0nmC+AO8Ci1l
	LpO8reevNRph8EuUiHhByySMXg1SotocKpuOrwUAK8wan/AJeMtg+y1pvTP5tI7YetvzOpK3O8a
	b57RdR9gyEJNTqGU8Ia0f+lzsihyHKtbo0lmrfR3Wuk42pgv7j5HkMJeloYcQAG9z4m3MYfMvM/
	pk26weFczC9IX1UdTgT847+aNqjcxfKXOVepksHkxTDn03C+EEgicJ2FcLP3dojf9oG6bEY6zPV
	XjShwlZi74JF+GpnPplyle1N2iQVOlV+H9qzbe6SrGKj9GL2cxoZfc64DsSjBD/Dj7OeHkci/Zf
	mYBdXG5NdKNOZ7d7op7QtU6gi/7E+L6A/MJIynwx+ogt1IZ3Z9Ge905qt1usF7jrNRLCKAEh
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr371708535e9.33.1795696798313;
        Thu, 26 Nov 2026 04:39:58 -0800 (PST)
Received: from ?IPV6:2001:a61:134d:4f01:7bde:22fe:61b7:119e? ([2001:a61:134d:4f01:7bde:22fe:61b7:119e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm41018184f8f.16.2026.11.26.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:39:58 -0800 (PST)
Message-ID: <fba67984-e3e9-492e-b512-180c257ecf11@suse.com>
Date: Thu, 26 Nov 2026 13:39:57 +0100
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
Subject: Re: [PATCH v2] usb: image: microtek: limit REQUEST SENSE transfer to
 the sense buffer
To: Alexandre Becholey <alex@becholey.ch>, Oliver Neukum <oliver@neukum.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
 stable@vger.kernel.org
References: <20261126122151.414230-1-alex@becholey.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261126122151.414230-1-alex@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26.11.26 13:22, Alexandre Becholey wrote:
> mts_command_done() receives the data phase of a REQUEST SENSE into
> srb->sense_buffer (SCSI_SENSE_BUFFERSIZE, 96 bytes), but with the
> length of the command's own data buffer. A REQUEST SENSE sent through
> SG_IO, allowed on a read-only /dev/sgN without any capability, can have
> a much larger buffer (252 bytes with sg_requests), and a device that
> returns that much writes past the end of the sense buffer.
> 
> Limit the transfer to SCSI_SENSE_BUFFERSIZE.
> 
> The bug was found, and the reproducer and this fix were written, by AI
> agents (Claude Mythos and Claude Opus models). The analysis and the
> patch were reviewed by a human.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Becholey <alex@becholey.ch>
Acked-by: Oliver Neukum <oneukum@suse.com>

