Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158839;
	b=vIoV2VhWEsXzA1wR1VdZec5UItQ11tTpCVbUUszqwYRfNfzhhYsGNKMSTDXGbXRFoR1X
	 SXwOkf/F4jIqEEH/yCbigFd8WI5oemLo8nUERJJrDRZhve0u34Tm38JVVExCB6ZTgb/AB
	 O3WW5pGm2NWqd6PAmLy75ur1xQQLcOUfpcz1SUbrfPrPvN106aqVro8pDDRNHIrjyd8Nr
	 9jSObNiuMWFhb8IG1yPzZw2k+NEgzQXFIVycS27xh1LydfcM312HewuoIVuXv1IdPGGxy
	 jiS3NwDlnoIJkIkefj0rMLCnAfHVKM7uC2XeCi8URj3hucu1Kz/48HAZRmDvDPAMWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
	b=h0IqweitC8xgeKJvQfePcCmijhon81UehYVAQj4gxC/2QvibxJLjQGAQGoXccMVLUGDq
	 5u+7AzkrX1SakApFjyFNlpMU77lZYG5m53Zba8qKjCj8VZKEg/kyDL7XBOnhkvSDmI/S/
	 iP3kO+CvlVtuoxIdF+0Tc9R5IXyT9uvRwhRg2Yaz4aukbXgaX9I3btOgte7Yk4jH1USKU
	 IEQ0nTh6q4wRlO53UcpFL3vl/bkMmRvZmTN6EaASISLnrm9WxljaUir7tzyahI5jL1nHB
	 yRPiWP2ZYI/8TgG8Ar+3/FFZh+y5qOBMh/FEZkjueFctChY1CmeQdkbPK3b9xMgbnsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="StZw2/H6";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E9606A326
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=StZw2/H6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so4868185e9.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795158837; x=1795763637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
        b=StZw2/H6WwnI+YGGuGADmugfPJYA+F8P0w1qgtbquhzPWqUTsPNO2Lw5UnizJ3W4LL
         GAVFXY6w5tO5IasoWvT8Ek00TkkLlNylb95iS4B/3H8nffZ/iaRc5MJsTohqkreKspyv
         W1ECfVESSwtHzdU170+sozSyhPMupwmZF52FffVfyPeGUTKzCzYC8U4RGrUQAqALDrxH
         bEQGQfp/hjiIodKap2dXV6OYiWhBGcdtzz7wiV4InkGeaB/w7OtSDpvx2CcuPDz6t+sm
         BGdMkEzfgaHXVcerhA8FNb/0DeIy/G9P0fgaO72UGUrFNVAw7vT3aHhXLy2ActuWhrVy
         1r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158837; x=1795763637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
        b=a3a9EuZij3LLZUWIuAJku/GD5QFsfkHrRJsbqA8M7T4mjQvror39DCy5vnHXSU7fDX
         n4FGt8jkiWa1l6/u08ddT4FKGon5EbC1VnKATOZvsf1/83uAcIY5nn1vg54aytMh/DEh
         DA65OdiWLvp+UZzhLd/5lJU5pYAe2/aJ+dIUOGv7rYKeLE8jpgmMRw0YmBIrpZ3TBuon
         +U9FsFb6gUQwOFEpLHApMYYueQLhIzG0nFUWxj4AzEDkr0+F+MwKNM9us3M2Vb1uPbn1
         8vrodcisuOuirgYgE3AZmL8XiMl21mhiRhppvjRRoMGOxm9fEs7OHz/dSCx15QSMzxjv
         DBew==
X-Forwarded-Encrypted: i=1; AL+hErH+Qnusq/CTNazEOmg/TqRxrkt2a3GbbfQnzBvC8PVysFMdPHY13bY140FjcS3HGiHkwGekC4uoNek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6hm2kVOJNBgMWuBZBhh6KUgOY7Xr3/iiEKIm3IAI8CaTaTzra
	j2IADJexzATTY4Ydk/Nu9ki56ECfpOyd7mdq8F3v7Bf1KokDm8XHWKKzc297mR55pgE=
X-Gm-Gg: AYBFou2HPEDljQSIGm2SNP0qi9iLU5x4egV4eKxvirdYGrtieiH6k0dOv1Q83Hyu1rG
	f7X5aO+fdAezJlOUZx+4PKik4SZAqjo3NK/2pzCbZwc3ndlXP4jJkWh5WBybgEJgjAgI2UvtEVE
	Rdb7WAfx6j9IKE8wu106a4IdXJib6dVPfdNv8yAlJ8glfwJlttQ9J1irCGJtWoAU892JpWOyO4W
	VWjsv0PgIqw5ueOgDCTHyPgqJn174XQMTArJyTlaty8s/eo10aO5wMUVcd6poXSTYIGClqpyq8C
	uRkIBbgpUmKjabq8K3l9E7PqZPaI5C3ozNBh8H/U8/r/SD9UARIsrfxsdFDbNUymL1485XhSa0n
	z4RTjToOoLLJ4CuiLQKoH8BMKXKQRKNSNVMdpquDPr+RHXxu5ZLbbBN5O16YEHUvwifgSdWFhWn
	M9Sd6DgiGiuOJJ5tc/vMgrr/rqerNOptkUlHxOqXAlUvDYuDmnT+MjyMUcVAXNdDvdmg5hAFVFC
	bqYMHeCKRRDMlScAe7tawDX3o4D5RDeuTfGYkGL/uEUAh9LxpKFH48XCxDcWvRiO8XsyjMU48YG
	Or+njgEqnulksNJjp+mWxPFv964G0SrkX8O3jb8DeUvWqFmUJ3kiwcbkmPPRcdDjW8Ws
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr45264345e9.29.1795158836687;
        Thu, 19 Nov 2026 23:13:56 -0800 (PST)
Received: from ?IPV6:2001:a61:13f5:8201:41d9:56b4:277:abb8? ([2001:a61:13f5:8201:41d9:56b4:277:abb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm3848039f8f.58.2026.11.19.23.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:13:56 -0800 (PST)
Message-ID: <41a997dd-48ab-4635-97b3-f13b11066e2f@suse.com>
Date: Fri, 20 Nov 2026 08:13:55 +0100
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
Subject: Re: [PATCH v2] USB: cdc-acm: refuse writes after disconnect
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120070353.956978-1-william@wkennington.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261120070353.956978-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20.11.26 08:03, William A. Kennington III wrote:
> Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
> warning)") stopped clearing acm->dev in acm_disconnect() and replaced
> ACM_READY() with acm->disconnected, but left the write path checking
> !acm->dev and dropped the disconnect check from acm_tty_write_room().
> Because acm_disconnect() frees the write buffers with
> usb_free_coherent() and acm_probe() only pins acm->control, a late
> acm_tty_write() call dereferences freed memory.
> 
> This can happen when a CDC-ACM device disconnects while a file
> descriptor remains open with a line discipline such as mctp-serial
> attached. Hangup closes the line discipline, but a subsequent reopen of
> the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
> c_line before acm_tty_open() fails with -ENODEV. Because the original
> descriptor keeps tty->count non-zero, the reinitialized mctp-serial
> instance stays attached and faults in memcpy() inside acm_tty_write() on
> the freed wb->buf when transmitting.
> 
> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.
> 
> Fixes: 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep warning)")
> Cc: stable@vger.kernel.org
> Signed-off-by: William A. Kennington III <william@wkennington.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

