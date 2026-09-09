Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895C563FAC
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965700; cv=none; b=A/skIRpFksaz/Eok7af4cpY2wSjSzn+YlrAIE4bU46XZgd0DcWqu7UyvdPHLrq41g1bgp9JcJTk7FPeakAhwP8Me0OtykzAEE9r+ivQXVDsr/JUI2H46UVrRRjDKge43eempxQbxMgTmgMk5Aj7E82EIGFetliAtZDCwYtY3k60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965700; c=relaxed/simple;
	bh=3mrzF4PFQcJ4DbH3RGaSc+zm2PljjP5W+lnaM84CL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKe+zobqGTyZjN3SnqQTZoP1NMrFVHgL+lrweqstCoZMXEF3v8fBRWrYsZgUx0k1HXXeNJV7pICGGLvQlNvHmMG8LSPgpc4rYBE0FPTmutrXsCQG/zRUKVGV+oDvHs/ZLKnaGJY8QUCQftm0lxDKsND6uK6Xtof96dGAr/Waah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IffCLY9U; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IffCLY9U"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so9931665e9.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965696; x=1789570496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=IffCLY9U20m06r8jq41Wip3wbMxiCRO5u98+gwJ4IShm4wkkg7X/pL8ySww6J4XebT
         8G83o+T8HV7UQxDY3AILmU5PPSPuO0534vpsVpgml81WxUkg+jSWdlsrkZC1XojQfCR9
         wPEjfOUTpu0aWTpyHsP2JLI4iJJRVFv2sABsgKZDRr9k7CZCff9jMvjKbbYGvq36IDFe
         m7IyRHupa9IRPB9ER/5GcA3V13z7+3yeRCUbOWz3N6E2aXBB+QFxpxYsIAmSR8V60/bn
         NLxgbMrD38xmDezTXGpi3zHNw6RU9YnQGWCE6LS1nhtK5eZf2geTo1QVmBir/zZ28I2y
         AQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965696; x=1789570496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=bFyQHI7eFcYRXWcYrhgUxj5/llWxFYiePjVW6XpVdMDDR1ABj7zSvJjeTDbdTPToLk
         cYFvb6+12RVQegDImMvqv4/0rmHoVnA0cSHIjT8+KeRNwRT/l//1PEnK3p9jsazT9zPN
         mcbqnfpfObsvOQ7fLsySFqHi4VyjcrThpMacl+JECH2pf7T1ZIYFY+Q111n0xN5PfyvZ
         jwJFM6kBZHSb6d5raP7kLSOBFrUrgIuhotZly7xK83WHOt7s78OsXCCHbkuEyx/S7AnJ
         5WSEBrgvY9cT07h8xtEBHezVCzyF925H229o5Gaq2+Ru6SPPduh1zUBmn5rnM30GXC0h
         uEWw==
X-Forwarded-Encrypted: i=1; AKwUvBzBeAteMrR+h+U2iOkL2uFcBWiYqAKu43RizkfoLcQLUAkqqs/VZWFn9a3nX2jtc3eMufTovt5orC8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVUUSnw1nNpOyEoTmAr3I/OluBoOrhI0LiTObkX/9fjFuFqhli
	hpEGVEf+PcjRsfaOFhH5fJMALoSVJhp/GK+x5aOnl8BRJEHLaISNeag/
X-Gm-Gg: AYBFou2L+Z6l2+T8yNmmdH1fp2NA/Ax0AxdECIupuM0g1ZNg6rI75zTZpdAu+PWSJIo
	FBCGsFVCDgz1bZEiXkMO2XI1ccmK1LB62fzKEjgn95XpMbBXATAc/8s0B7fzeFf4KmKl78RMNq3
	SpLjs0KBbCWKKRhIlw/QZwE+df0RXLc3RrORnGgF2QDWyW+Auush7qAbw1b16d3gPHihOxbtmb5
	VFYDgcBPqC2Z/vVQ63M2z1tZbpwwpi93B70/c0ylNBMbKTdJ5jCJbH7WQnAIFWhzC7lufoSuN6v
	r5BnLxVSW0gYIMNc2B2CDlEwMHZmrhgBuDB50LRE0xEeq7/fNB+m2UWDsMtjCZlWW8Cc4duQ0cb
	B44slLbMr8ppD3NJ3YOywx/oOG4W6A87GvRwYLQgj6aj9yw5ZDe8xOwck4ErsPymJN/Mz1jccU8
	u6gZxwqVsmj5wcp1djjk2y8aTJ/s6FMjk5cUDsZgm4floMb+9grwrpmxIXRmgQ+bLGu/PuOGeNo
	+N59OA=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr117005945e9.8.1788965695566;
        Wed, 09 Sep 2026 07:54:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm384918195e9.13.2026.09.09.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:54:54 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:54:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Breno Rodrigues Alves <breno3011alves@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5] Kconfig: fix typos in core makefiles and purge
 defective DVB debug (v5)
Message-ID: <aqFzOFa3ADXIBo3G@stanley.mountain>
References: <20260905003005.118245-1-breno3011alves@gmail.com>
 <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>

On Mon, Sep 07, 2026 at 08:59:28AM +0200, Thomas Zimmermann wrote:
> Please stop spamming this list with revisions.
> 

Generally, the rule is wait a day between resends.  Otherwise it
becomes pair programming and no one wants that.

regards,
dan carpenter

