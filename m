Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092430;
	b=iYwnmMZSDzU27piSoZAcw3VnbY5wd2VgM275rhhx8krgwFvxud+K6+8WIOqxOjo3yW0j
	 Ygl7x5kJElt35OxZv/ViunDM0cyyL/ipTUSRUPi63xwDrOlrvC494hRfsxePN2h0cLpYL
	 zbPEz77IbbB6t34dhX4n6pb0oeioC0uB3g7l5Xyop4qCP1V6SlkLAvkX6TEiN+9gxmVFz
	 7W4i6360aYYzScNRAHX+utnwhGu2CmeupvpAzJED78r77uIp9eRSJoKH0HQuuMOVXqzul
	 cgFgf/BGnWZdhiuGoLdSFET7TOhTB0L71PGMYku0k/u2dLfrvMj7x9E7hRSxRhd6r1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
	b=To8cMK+zFiCDoEP8A4XLY0k4AuYQUbZMbPdGFZahnbEyLoOfKgNhHfW3NDJ8ydUyvx8c
	 1mGgVYqwxqxj1XRwfjQ2XyuSybJyICHDIPXv7eG+NYiSCMbkJINpFTkThaH3UOVBIQ8PJ
	 3aF9rgOh+jx4iWgDfkjX8tYNKLwNHw91MSRd66OwyQMNV//alHX4W6TsWeMSLlD7NhEjM
	 F7jwLoFHxU5q00C+2CNvEa14FpvDRyJdVjZrmpTVwVwVyVS5/Vz9D7EtOxX8tWnguy6xk
	 g/WOTdHNh3DVkRn5sfCzryi4WOLa8l/y+JBE8FoIl/ej0maQFeQ/ur9JaWZcqYEncrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NvwwWLRD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B074606A326
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B074606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NvwwWLRD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20355805e9.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795092428; x=1795697228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
        b=NvwwWLRDp7Qs5UtSDGgAABsVFvqMBo2hh8Z/WQZno7bgQw9t1McyppSQDAAAFFJnHM
         zmpK0HLKciV1gu/5Te7mXBNOakuOo27N8NPeoLzbwket3yMFoHB9M499ittKYxkfaw8d
         vYxW8+yd6wbh326wMOE5DHUqiWsa+JxHiBfWUnfYovtExfQ+tdW239H2AOxZA+nTu5oW
         EDWHRmfUaT12N+2kFSPfneTa97maN2s9aA/PV8tpflWJ5Hii7ITem/+Kr9ketFFb8ee8
         91SpXmZ7lgHsQFTpNMeMKq5jYN7Ifk6JNc7v0mRIAei0JaNLmYMRM2b8eC+1ng9Xim62
         50vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092428; x=1795697228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
        b=MY3dQzd8BERfEYvQz7gFgVpwy280Fdy4XfDOYIiDfrgB9sgCAc+G2nkXeISqJxTmam
         6L+Kn+PcssaLU4StV21AlNnfLjE56nF9x7tgzpCBlxC46abK5y17PrEXGf7xJ5CGCLJy
         s/1fbRYRZxGrAcemH6PWZEp17mbL9GjbmqwJgRd1KiRRbLh6Cn3VJEXbwYAz4D8JLL48
         EjwCNWsc+TqVvz1/M7Fgk3g9X3eyevi1p+I9JjU5EDLZRgsA1KT7TXl8tl7Fs6k9GlVK
         +LumCP6O9h0alLWku17bJY3yKKuAfX8RocAk59baOpwYhvwnjtHMGeDVUwyql/AK2XvW
         ujPg==
X-Gm-Message-State: APuU4Z/xv3szPuiNtpc2rAVRgwTO3j8Jii5LltuhMXwjhNRySA65RRtQ
	tKtqcTb4LedFdwqt6jVnHtHO4YSvNE2j9xm8yPTIEf+KJwBoGphI3l1JXA2mqSdYTRQ=
X-Gm-Gg: AYBFou3dQ6TNQiHf43xS4EWWN5VSbjOerkMOb/uKVb/rr/SAz0aj225O/dHO1P4exW0
	wy+sHcmxKBPNh8IeHV+NwxLSrZkuax82I3YjE4wvYCP69X56OureaTjOSD5sx2nK5JNdjPgt+yR
	cGr1zIkGXP8ojK5xNA7xvPq6vcovcfVl1eXSdBzgxgFr/PwCDQIM4PfbQlITiHtagdW5vzOPJdU
	laFJztQUctmYysUuF3IYFj2bxnULAtmxXKU4vnjN1nXmu2DmGhkWr24y5rYr4LWCX2L2ejs37Ru
	ltzldaNVay9aP0NZtsJ5qvlvBz/EUDoEOBj9UUKiZ55sQFfUMDMMbJReC73IS4NSXthvmpHrmjM
	bYhMRxvUSEStv7YDxvlAoTdsv6ylgRYPT32rRyGry+/lPo6t3M2Vse62sddNWqmnx+DUI+Q1Edu
	3StU79H6Gy1dFAdaDAWZkfzsAag++dxZv0KovnROEkOk94wbshegA1tKtri6FQ0z0odm0zruJ6i
	KsBCyGZzY0ZKleLEqWiyOCM0Xd8h36kXSR0ntMeP4Y1d9GA67euCsaqlT1AD+Eywmg3ti+MFzMH
	gAf3zQITIEE4pdtlXjPe5JYOuF433J5d9GLRxICm6yvX1y3ZOrn1a/+EAADa6W5FSjJe
X-Received: by 2002:a05:600c:8b71:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb7da2c635mr107058465e9.21.1795092428543;
        Thu, 19 Nov 2026 04:47:08 -0800 (PST)
Received: from ?IPV6:2001:a61:13e6:9f01:eee3:1629:f0cc:42a? ([2001:a61:13e6:9f01:eee3:1629:f0cc:42a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm54667975e9.11.2026.11.19.04.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:47:08 -0800 (PST)
Message-ID: <1817932e-469f-401b-bc04-37f30625c3ec@suse.com>
Date: Thu, 19 Nov 2026 13:47:07 +0100
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
Subject: Re: [PATCH] USB: cdc-acm: restore the line coding after a
 reset-resume
To: Piotr Kubik <piotr@kubik.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Francesco Lavra <francescolavra@interfree.it>, stable@vger.kernel.org
References: <20261119122842.3611681-1-piotr@kubik.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261119122842.3611681-1-piotr@kubik.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.11.26 13:28, Piotr Kubik wrote:
Hi,

thank you for this patch. However, it has an issue.
Let me comment on this inline.

   
> +	/*
> +	 * The device can lose its line coding, for example when it loses
> +	 * power during system suspend, and acm_tty_set_termios() sends the
> +	 * line coding only when it differs from acm->line. Send it once, for
> +	 * the control interface. In a runtime resume of the device, an autopm
> +	 * reference here would wait for this resume and never return.
> +	 */
> +	if (intf == acm->control)

This test is problematic. The interfaces may be resumed in any order.
You are setting a line coding before the rest of the device is
resumed.

To do this cleanly, you need to look at the counter.

	Regards
		Oliver

