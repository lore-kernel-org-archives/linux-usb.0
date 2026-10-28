Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190002;
	b=pmCpaVjcu5xNEeHyocrqUAF2Q80gQgmFsZJD7voxmwqHEcVqrCGG8kxKRy8WHaftvSBa
	 khgxhp3w8LlNjKxQvafh+N2qqfCDZuLaM16rB8mk/+eQe/jVgHUA917k7vmbee/8vQ2v0
	 9g1qqgz9/nIViH6c//Gf9toRxDh2JUvlHixI1yso94CqRVQZXcjtMxbwYTlAJVEojhStw
	 CZLROJp3i4YFyguRCtNSLb7tNl772yhfzjCY4oKWnTFp2ALV/rANYu448M4ovD7ag2Ce+
	 cicTHBAQf5ympt5hPTujz++REhykurwtDkGAyVfECPOLns6CRoUTjxPzFB69XzdqJ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
	b=kXpXRqn5InFKK/2Wixcn+uBvfzfgCclwz/Vo3fC9HjXJfHJjHuKxn/ELTgUvyaYNfW6W
	 C4IxYzTEoQtPBLpkb0GBvXLbClzcu136VXwVJVfwU+FOBPUz5ymmyzjY56+OoEDlEchcG
	 QHpSLrQSxKfhU0DEAbiXX0HW12VkTEoySm/9T3ZtENBz21ODYcN6Lsc/ngGw5satVk2Ty
	 AcOgWWReD/HOrFjEEJ8QhRsfG+YlU2jo7MRahwl5PD9Zdz0Ld8/Pbyi7VlTw9kJys9eJa
	 JZ0aHI1rUo7nkgdoyrqVrJwhSVJbfEq8C2Bq+1R5eM61fOUuuO80+psN5k7Wb+9aCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxjgtRID;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD7606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxjgtRID
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ac9d666d4eso7564247b3.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793190001; x=1793794801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
        b=yxjgtRIDQCo9PH+S550/uh92/aLIYneEcVSaL9nGavFETMpzrtM/nsozyghZTKg5dJ
         s9dXy4lX58bNF5rPb+hYu2kUKc6EJ8XIkp6OLVuHpSdAyxs4PUTWFbuCXxQSZ2PUAJaj
         r3Q1x//CszCJUHffp8s2JiDjyRA81nZrxZp7IHO9P26IBVvpPDbIplH9IML4RloQ65gV
         WxiZuoxyyJw+hQ8A5/7M6j61IZe4CMSnM69YjljceYl0fsl6G0HUQ6XEIFzdHdNmChea
         c67f7ZsMdRrd0oUtDNXVI5Q6c5riGHZRuIdXoJfEBkG+/6rqGJunDyuiy0NB2oJF6N/P
         J5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190001; x=1793794801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
        b=2RC3U7mOauwZqQ0drwR67H6X76xO5WM+u9QkxlVFgnWzVjLxPQ78DOphd0gQQE3xx5
         0tmQdo3q4b2dJppvE59uIbL4VipSmWm31lffHt2bkwA+jw8gWUiZhAZJ0bI+aQ+J1MVh
         n4yVuEyHvsDGcuJj1IPway4yxYhLlWhklRELyRc3msUtCBICs/OFn+7xw/OLuI5YMzSK
         tvV3A9+BwN1LuIOQJJfPDGlpXgvKVGIza0hAsq0idy16Z1ryRwwH0V5DeKhyrIrRRPn3
         G/chbIL104V8kQ6S4BGLfE9NOkG2HSkf4Q/07eJ+ekMaNVrh0pFT5xiF5iejt9k+gFeQ
         sDqw==
X-Forwarded-Encrypted: i=1; AKwUvBxh5o3Plnwd55Heax5KBKmGhKNML/OqOsiqvoZSeNa7yWvkAcd9Py/R+Lbeu9dtcSZDtbdF+SFN2HA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP0Q98yrlISkQ2AsokONO4VmA/bUnislFkFK8uuaEvKYhijdC2
	tMyKE/RjMW5Cz5bp3DjPLTS7zKIjLRQOiN6a65E0sLW4FZxf7HWTyfNr
X-Gm-Gg: AYBFou2vhkLk6GLCzXeJvGhidtl8zM120dRUqg8kXqi7RKYZ3aUIe3FXbCwpcjW1f1Z
	eSMnxAjwdVmwzcyKDzTn5t9m4B5OKQ6kYJvHKswfTqXopgMXF3J0Cxh3zS5keprzDOIlTEV4Qhs
	q0tLy1T1MnuPBMVuq3xygPohFHJNzNFhpYUeufJbtYZql2TBdvrmBYoYAPXcktTpJKcPHSMEiXc
	Br98xQ5+tGJmADOvVlj8AtLKXNjfkmUJ3aQPqFUSM8FlUHJ2+cCVuhK7XvCLH4LPvIckFw52gvi
	gQo/hGVJPj2OwWVQQZGmhaMMbf0WgImNEjur+o3f2IVbqTz9i/ztqZMnyYUFbrevC6T58QWTRr0
	sBEDvRVzyDnBqyNXbnF/9lf2vlYL3csYIJ3Fi9KU+CPj0sinn8RRphH1YS+owSjKB7QF2BTK7XC
	eaEocDg7ZX50w4HhAcs8q0orlrM0tIokzZd8u0QwuuKmdyqNqgSBBQRp9aAYMvsdXKUB1Zsi2/S
	hs0cpjdNlx0d5t9odUmIbwScWgk4GEIF1oTuqzY2f0OuE0Snw4sStmcHExxzJtn4zvej+AcvWoi
	E3O9iYjxoEusIUxPowy4TTkjfhbJR5wJUfI=
X-Received: by 2002:a05:690c:dd4:b0:87f:cfa:3db1 with SMTP id 00721157ae682-8b1b5bf286emr12448807b3.39.1793190000802;
        Wed, 28 Oct 2026 05:20:00 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e6198e2sm25691377b3.38.2026.10.28.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:20:00 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:19:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuen-Han Tsai <khtsai@google.com>, Sonali Pradhan <sonalipradhan@google.com>, 
	Kees Cook <kees@kernel.org>, Felipe Balbi <balbi@ti.com>, Jim Baxter <jim_baxter@mentor.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: restart the TX timer if the TX
 freelist is empty
Message-ID: <75snoennvklw3l7zuwighfx5f2crthf3l2zyaufhalbcu2uyot@kw5gnvof257p>
References: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>

On Mon, Aug 17, 2026 at 10:26:38PM +0300, Cosmin Tanislav wrote:
> ncm_wrap_ntb() aggregates datagrams into a pending NTB, which is sent
> either when it becomes full, or after 300us since the NTB was started,
> using ndo_start_xmit() (eth_start_xmit()).
> 
> ndo_start_xmit() returns NETDEV_TX_BUSY when the TX freelist is empty.
> 
> For regular packets this is fine since the networking core will requeue
> them, but for timer-flushed packets there is no logic to handle this
> situation, and HRTIMER_NORESTART is returned from ncm_tx_timeout()
> without checking eth_start_xmit()'s return value.
> 
> Under sustained TX saturation the request freelist is empty most of the
> time. Since the timer is never restarted, small packets keep getting
> accumulated into the NTB, until either TX_MAX_NUM_DPE packets are stored
> or NTB_DEFAULT_IN_SIZE is reached, which is an unknown amount of time.
> 
> Check the return value of ndo_start_xmit() and restart the timer after
> another 300us.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6d3865f9d41f ("usb: gadget: NCM: Add transmit multi-frame.")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Reported-by: Hiago De Franco <hiago.franco@toradex.com>
Closes: https://lore.kernel.org/all/20231204183751.64202-1-hiagofranco@gmail.com/
