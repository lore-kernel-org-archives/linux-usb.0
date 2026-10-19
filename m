Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437438;
	b=fYBDolpQR+g/Uv/xtA279ZO1FMnsKfToW7Hh5xCMpejcKezPTjM7Qy0zmSJINnCIxdA2
	 xaU/5koJPFfpcV+NMYle9AcqLvjZhD+4mlD1gNHw+dtgvpnfyGfWzzhcx1Hoi5PBJVPzN
	 yAvP6icDhN6FFMZhMbMXjnYkC3M9XBeZYhK0GqT/aVPCoeUx6V3ZUYeMgBnVCjwDIBmz4
	 ZCvVIql3JU515dVdoOQ/QtiRLHtYvpvGe2t/WebOkRx11rIvwR6KaC/fHuZXz6OiGmZ/+
	 wB+BQUY0zYfhy5YS9GClUgpLRz8HFIWR0RD5vqaeyhVFTtKQkDIPwEPmq9pKvNs+/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
	b=OXgJwKlvFk5Pt6tuyP6hM9jlujUpwqx2m7vuVWDCh+QNv4OwT0KL65mgI71GxfTJAEvV
	 NFBQ2W1FjcJ0vu2y6xsWEHs3Zw5aPJGCstK/NuQE4GBwRzU7tJHDpdPBZxHK/rDlMVyiw
	 KvB8/hfs6QgGbebLQeyds134GgRd+1u+0JWyMVoOSzEXheemFUmTbF9AgU59HryAMN3dq
	 IdcE/7nxn80uNYCRNUIxQDww52mp14HR5yaWbkpyF2BHfxMtephbP4QZv9c6bctZCu9zA
	 bXRu2yiwE8G0h4V2gQouzo9T9FalcevJmDkzGnJRGDvN5iW5u1aZaP6qYvm4TMeyPVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62896606A31F
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62896606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f14642adb4so1081366b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792437426; x=1793042226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
        b=fSeNzQRnAW4IKP4kSbBBVuq4cYW+bUP+uYb8nreQzuaPMgbvBuiRx6Fuhp+NrTXQWW
         Ut8Z5rhQWmMKqFnJ9riJxcBM3iYxrisvIlZ75yOP205wFxoBtZ1rSrTWTZ1MFk076PcP
         fUgiR3UjRUUjl8lPjmGbb/BG8dNhY2lLkDIf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437426; x=1793042226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
        b=O1OmCjcJC8ptbjMEY7Zz75ODo11jMJrqAaJr6rPgSjaYMybFkNnxRO8Ow6Uw0nPJ/W
         MEwZsqpFibrDlTkfaWCYWat0DCfzY0eo+oFfVlcgLG1j8KblBjXcP2/ygml+GbNzNLLV
         m12hilpJNhul8ep893H6TV0AVZNH6at8jjoMdGcojIAvDHq+ymXrkmT3BMF/gVC394y0
         m3X7GPsny8AqLGNE5hwZz02ViBBiltAszexYT+dRHdIJDBqyyGPJpRAE3rWW5kbshrxr
         djyh6bekbIldSJ9idZlw7wwvZlB5Zz7qbJywBkNacfYo2BirKUW8JaSDgIaX/6K9sUSi
         Q37g==
X-Forwarded-Encrypted: i=1; AKwUvBzd3VJlgD1QmWddC3m2cu4esvWLGYMyxwcTBsY9PM/uSpeqE+JhsLH/SeiWalvpSQKZOHBxVLsP/MY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS8sU4wGuuKimwFHBIz+GcyF8QIwIk5UtmDMTJLlfffzzxIpWM
	J60m0D9TKkoignHSGQbD00+SJ7ptRgBdnxuJSpFVdx38tKX9FslcL+i3GUbza1KBKaM=
X-Gm-Gg: AYBFou0ZLLnYarahLc0D/6L7ciE3+UAB7nWIy2n6uVf6aNfj9Z952RVWKoqLsWyyiVB
	4EXzPB8Axb65jktix0xWoSO3EjoQzvbz5SYVcadUzbVVYwCt9gfvo4nZKjEcq6N0fIZV/6qowav
	JVFUrNghw84O26ZSuv4dO+ztanC5s2Zxkc9XpWwdSrHouYoxceZxTvisciADWHOwFX+cbdswJfM
	Ngy4ml4DqujA5093PJSbMR+i1VDsmCecDdouD2MX33gaR+iuwkWJzyeEigzhorHNqkcNYyRrMTU
	vkcKEb9HsQAgC/nt3MbzhosfWlFlHu7kz7bAywWXTewxzO1YcxULHm4AP/K6GhCdCa625rApEwH
	ExZxI8Wy9Ex4ChiMVS4HGNCfjX5PC9pm0Z1dkgfYUnFQhhi5mj3HWRP1pVsyxaQhq+cyEq7Y/P4
	kQ/ujS5JGv5YUzahP7U29YA65Xl7qU7jnfWMRVaHrA4UtF0SnLNybihQm78lZx00W+jE79WHPbH
	W8vDaA=
X-Received: by 2002:a05:6808:1314:b0:4f6:243:cb9d with SMTP id 5614622812f47-53cd561fffdmr8117322b6e.61.1792437426202;
        Mon, 19 Oct 2026 12:17:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388c1654e9sm7396007b6e.8.2026.10.19.12.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:17:04 -0700 (PDT)
Message-ID: <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:17:01 -0600
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
Subject: Re: [PATCH] usbip: vhci_hcd: time out unanswered unlink requests
To: Hongyu Xie <xiehongyu1@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 06:56, Hongyu Xie wrote:
> When the connection to the peer is alive, vhci_urb_dequeue() only queues
> a CMD_UNLINK PDU and relies on the peer to send RET_UNLINK (or
> RET_SUBMIT) before the unlinked URB is given back.  A peer that keeps
> the socket open but never answers therefore makes usb_kill_urb() wait
> forever.  The waiter is typically the hub work item, which runs with
> the shared address0_mutex held, so every later task that needs that
> mutex or the device lock chain - a second attach, usbfs open/release/
> ioctl, udev - piles up behind it and the whole USB stack wedges.
> 
> syzbot reports this shape in three long-lived bugs:
>    INFO: task hung in hub_port_init
>    INFO: task hung in hub_event
>    INFO: task hung in usbdev_release
> 
> Give every queued unlink request a deadline of its own and arm a
> per-device watchdog; when the watchdog fires, it tears the connection
> down through the existing error path (VDEV_EVENT_ERROR_TCP) if any
> request is still unanswered past its own deadline.  The teardown
> already knows how to give back every pending URB with -ENODEV, and a
> RET_UNLINK that arrives late (or never) after that is handled by the
> existing "already given back" paths.
> 
> The watchdog is cancelled whenever no request is outstanding.  Queueing
> a request re-arms it to that request's deadline, so the callback does
> not trust the timer's expiry: it re-checks the outstanding requests
> against their own deadlines under priv_lock and becomes a no-op when
> none has run out.  A peer that answers promptly is therefore unaffected.
> Controller removal quiesces the device first - the event handler
> stops the per-device rx/tx threads and drains the pending events -
> and only then calls timer_shutdown_sync(), which also waits for a
> watchdog callback that is already running, so the callback cannot
> touch the controller after it is freed.
> 
> A similar fix was proposed as an RFC by the syzbot assisted-fix
> pipeline; this version arms a single per-device watchdog instead of a
> timer per unlink request.

Did you test this change with a usbip_host and client? How does this
reproduce in a regular setup?

thanks,
-- Shuah
