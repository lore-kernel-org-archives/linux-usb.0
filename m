Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675796;
	b=upcCOGZUkyHKIfAz3wZuSrL+Ix7VTGi74156bB9ri4LxuphpmtHEqwpB1obMthLsUNaM
	 2rYVrQyyLkogFFFq4t4ycN81uV5m5DSJps9ucQptPKxpETSX94haYLZ+jKK1elo6tliRv
	 fPh9h6+7C2llC+aXeuAj8p+XEvS9OUrivehvn4hKDEp7lQN7+WgaNCdF5bmn8GfueOAfZ
	 /wCcOTeGMwu91WyGPpjri7WNjVZm+U+P3hWpbvGEn/hujzpJdwrLWYvD1UmSHgVnS3cAK
	 OjITB9jT71KGtLNiqkjMVUuXcQ9F6o0msi6s9ZxyP7mGNlkAGsO1fntBaC6URtG3x0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
	b=2IXBZ2Wm5505wMslJ9oOdEzxVRjQ855SlZioYvocJwCVL3lH2WUcftyVVRv/HIu2PKJg
	 kFGIdhOoIHZkxMipoMy2iy8XF+w0v2BywBQ6+4hvmhqpCo1W05Hskf/fl92YL/Rq4o/s6
	 sUwoIpSoaBSth1A1XiigyU5HBDdbrrpFrbZ8B8uKXAkBPbGUKwbXQK/7SuYYUe65Jnfn9
	 mn7VgUQDIXoYQ+56NpbEbJObk8Aa9deWRhqvL86vDaCtb5uj9oldSfN4P7LNAOhYUDKon
	 wqzkhybrP7dbM+qGTUEilULUKfNQmzjVXN9q3Icm2w/aaS/4KtEurZcRw/f5OuTlZGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UnnznAku;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBB60A262D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FBB60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UnnznAku
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so11222135e9.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792675794; x=1793280594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
        b=UnnznAkuDtGZE+MuoQei834/NZGnv+7Vu3YK0PkPpU0vwUPzY0P7vPsBfdCBwl1D7g
         cDMgvm6L11UCVY634uIvYXoT301cHNuxy6xCGZwomfA5BcqKkBKwgphDojJzmW42m7yF
         nZsOF3aj7f8myme7/ZAA5ACEV+B1OvvzCpRuMSqZGAZNuAiES68IdgYcIXt6kP5jlFRP
         lxaajb5lltKGetqki+6nThGI6mtu4BZ4gT4LPreda2Yr5ihTPSWO7PSOFLXvma0SlABy
         uOpEbcoLqT89POjef+36bd6+VJwTehl49AbT9dDCDWbVtSL3Kw3EDUgKzjdqTX4stHSI
         hTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675794; x=1793280594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
        b=obrRxged1RSZvg+fIXdw7joJE7Mg9Mcu19QiJEuomFdKW2A4s7Sua6JiFU/17AOSbJ
         DQZ8rbkNmOgkBS4qPtAadtDZDurYQTIpt98p0NRjLRD92fgCyqyiesxK/Q2oA7ajj/1k
         XOpU4Ftf2SM3ybxJTpe7/jNTRvj5iajoJLymd8CasEv7wvD4bTghKMyP1Oebs1kgtqGo
         eC6y6zYk0NzSms9QkOEJ670593X9QfGf3zyF2QosLgvSgvDPpdXd4TLu9vYXh5nk26nW
         Ba1eF1wkuZijrOyhDpJ0LhUAI4O28IgGzwtopzXJ3i4f6SnmN0iDXx6+bOX8YMmL/oqL
         ptRQ==
X-Forwarded-Encrypted: i=1; AKwUvByOjZNWRAPYdye9C5AA3d3XJX5xh/PXUaV1IxyqzC/uscLr13tinA+HL9Y7pOIEtVmDfiNQgm7X0mQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9TnGCoreJ05EfUS/iFrki3XJoErMFA6ErVp8pp+GVEycvJd5T
	ZJ8xWI2f7d5c8NGNA3oBQWOeKpFb6xaTp0A3dTGsl069D4+3ogXyJs3WUnOjsmz6xyY=
X-Gm-Gg: AYBFou0uLdN2RV15ccyI4+rxrQmx6iZq1jQRa/80E0pCywTuwyv8Cl4ZgyUwkqX2Oly
	JOZHwHclQBdlAEJJUfjx2cYEdNgfbBKePNZYoMC6phu1f72r/vGmMkczXsiPM6eW8EFd83vdwci
	LVL2kUn3uaYpmZYe56gEa45yK7wTaeOh1GMDuay9uBBiy73C46uJ/j5aNurytWwiptxeMii1foI
	Uzw1BzoJ5VhEmyjg0BlFXcsyiYJ5a+56nQVmjwJ45eg9YGYq4nU0WqTHxxaf2r2eIKOhyuPrApH
	yAyfvhEQBrKLsMtbEmKVoiCK41tWRf0n486RSB7AwGBc5JRnVsjsUd4vIiGsbfzN0SPXJywxcQz
	EvfNdSLzE2hQmC6NGgC+w2rEe0Ly6Nxt+ErzXaXphx7JEqfTHHD8hLYyYDlaCr8rVbT/ob8ZgVA
	DJUV5KUUdcPkb+x0C7VxtEBQ8sghkACfAt53EhvBpG0+usHKQMX11XkJ8timwXUYRNAtamFplAN
	JZZiFI4CtkgmqcZPNoU5IwQP8Eo3THfYIQPCNLhFbnj/C38H4/EMN5M8UqT9S6Qwud0MplP6T28
	ETceCwIl4rxGjT7R5ek=
X-Received: by 2002:a05:600c:6085:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a204b04321mr42997325e9.7.1792675793804;
        Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
Received: from ?IPV6:2001:a61:1362:6c01:90a6:c895:55cc:41c? ([2001:a61:1362:6c01:90a6:c895:55cc:41c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a265afsm82566045e9.7.2026.10.22.06.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
Message-ID: <6015c40b-04ae-443e-8271-63e064f08ab0@suse.com>
Date: Thu, 22 Oct 2026 15:29:52 +0200
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
Subject: Re: [PATCH] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261022123401.319479-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261022123401.319479-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thank you for doing this.

On 22.10.26 14:34, Jiayi Li wrote:

> +static void uas_pre_disconnect(struct usb_interface *intf)
> +{
> +	struct Scsi_Host *shost = usb_get_intfdata(intf);
> +	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
> +	unsigned long flags, start_time;
> +
> +	spin_lock_irqsave(shost->host_lock, flags);
> +	scsi_block_requests(shost);

No, on pure grounds of maintainability, please put the
blocking of the host in the direct handler for disconnect.
Unblocking in the caller something that was never blocked
would forever trip up anybody reading the code.

	Regards
		Oliver


