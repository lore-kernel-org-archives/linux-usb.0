Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984550;
	b=yPQY5EQ3GQPV57uaBStjhMvt0Xto4MY1lrIBhH0AzXhZHOQIqqizDuBfJZyqayaGxvEF
	 4/BVvATsL9561mS5Tj8eqlQQEA3ak2vQuU9ITE+MeFbzaWsestPeSrvcIh33wW9K6xDxJ
	 JuTwXO1lrCPCOlwg3qHStoGdSJjdIXPs8iyVmdYh3JwrJXVgXYXmqFTVbOWcr1R2mBg0G
	 cZ4WNol0/PapuUITjDkVQhtoCvNoTIA2/YBjliOOpht9apqZbQUHBkyzfqdLEhnWSX0FF
	 12hhVMfxwlK+qiXIOUpUQ9anaDlh9Y2IMXIV+zMyTf17+Lvit1IGqMpQs5MRMZbyR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
	b=3KjHnbJMTptKXJzbbEVRJeqbmTMmldR8mywT/rCoxbnkVPkiO1UMSb8V40cOYi/sK3ar
	 WDj+prCba0l311+yCmDhWySH+YB7CwNS93YhOL3HfkRrjBvUhUQE/KCYBygAG/4gCYTO1
	 6qKJ/2RMT6KyvwzK9jXgeBOfd9UP0xTjWfc5Khqntj8Xz0e+ZHUSDx8ti1Ji4E2E0Yd6N
	 yezmclTHWCpLP+lflimhzEatPuE7MeYTwNado4QKp2MUKPF8mF45Z1NGdQ+ZNncwUdRHk
	 e2ckK2gA8rQSfr0tJPm4i1SOBC9lpGTXysIRs728ARBY2y9fOVgSC6WA6ICVjmxPv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B78606A32E
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B78606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91eb46044c4so6466236d6.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793984549; x=1794589349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=la2KYYkNdIoMoc6wEeIb+LbDPl6uyQUQpIfVl89pwSwtrSGbFTunXRL/lFB0HHbGhI
         X376hmYEScQTcKJwZUtZ+vdZ6Pgc1ld83KsGwkwClcMPZDjj0fvJqCldasPof/eBi7Bm
         uwEP/FyxQb4B/rn/PbVrDW4ujFfjzM0lVu8BohuxO92lUqF2l2AE4LyG+ZlcCEmUCNZx
         3K99FJipn354A0jE7JlMSh7Cyn7axTGVKg1/J1Y9kw3oHDr+IWgH//MoxGF2e8ZscCod
         nk37zD8oIoHkQV1sCfMDQSOolbvj6V20gRh0gyETflKTVOMZWIbzQqGB565HVcjZ/fyR
         z1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984549; x=1794589349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=1uNR36DVRYpy7s9dajMZHrHXRlyP6j2O9AGtOR59S9C0JFkPOhsyIo1HE/7d7Z8NEA
         17mhbvaVxM9GA4koYOcD+93dldxZDiuJDR6LgQ9er2QupM7w2L6UBy73AQ4OCyIg0HiL
         aAVXqVUAVp5wXJsVmE11DIH6i+pEOl1bhOUtCgBx5ShwT0l5/Q079CT6CKCqXcoJr5p8
         MfF9wUXQl1iMBslp8oCxfpgRH+A24vvGjM/7U7SQokLaq+vXlqUpPkm6s358tvPgrZmP
         cw1epJgrkjDbldvXo6qv3vE5/I4rUWGFa4h+tdEOza8+r1Fhd3ixlBca11Y0f4/CAayr
         I2Tw==
X-Forwarded-Encrypted: i=1; AL+hErEVtdDhHKEeNirRLj7ndZQUzeORThjjCak6/5X3ptyhEvq9R6A2RaDyMnjq8tX8WRN4ihcXcUvqIug=@vger.kernel.org
X-Gm-Message-State: APuU4Z913CEbnLCTCfpYQpO1FdSNjg9BHyAHIW90rD1NqcEPnWVVTSs/
	jRbqcFQjQknp8Ar0WuK21DB+MY43IRL/hRx+YLVD7p4KHClpnGlnVRmigz3not+MMA==
X-Gm-Gg: AYBFou1WqX+s+QREzTSLqzXe9Re9VQ3gjlwlVYZIlN5rYfDRftJPAz79oao501SxGLv
	dBLnRH9Kkq6/NON2tZkDM65AKXrseGBtHCnry+V9F8xZDcFc1/Ud2C+wzU9XuZTBQAl7KLqq8Ff
	cCYubeJTS7WKkJZJjkqG5/f3818jG6r05cjPaXrtDqRHk6d6G9UWBBuqy8VJB7HaMoXYJ0l11M6
	tGwwSQWHQBnYqnuVyowzKQdOier9xE8fvekxvgkhVhRV9CwG3x9PRHymulN1D1cVIy6QeD+R/Hb
	8HOtx1St2dKkHZ99WhzWgvYIvKOZuiEMCPRRC1JwwHQf3QoHFkjctwKTMZ+VR7V/pyngOT+IT0F
	eptjKkj+AvZAcTKO5OhX8a8hQ1ZwT/eQARbxCt0sI9amDwzRRa9xb7JmwZxbRTj9DjxYP6WSdLe
	LhVgM4L0aMmR+v6pzdTVY9kI/DqQCsS4Fl3F1HIfhsPqYgYWIhpCa//iAd6EyEUXAYGG1vvkYM1
	d00AiMPQxfxsOvoNByJBVcTvDUBJEtwDC5veP3sjDWOZxLraxa0gCk2vIda2n57hs6zwBnIxqX7
	MJSkJ6R+nEgA8pEaJzaEdBCHO/6F
X-Received: by 2002:ad4:5dc8:0:b0:91e:9463:7194 with SMTP id 6a1803df08f44-91ea96643b4mr48110016d6.24.1793984548922;
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6aa7a97sm24230156d6.35.2026.11.06.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Date: Fri, 6 Nov 2026 12:02:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v4 1/2] usb: core: export the generic device driver's
 operations
Message-ID: <c267f8af-78eb-43b5-b6f8-98af6749db22@rowland.harvard.edu>
References: <cover.1793941292.git.jjc@jclark.com>
 <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
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
In-Reply-To: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>

On Fri, Nov 06, 2026 at 01:12:50PM +0700, James Clark wrote:
> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
> 
> Say in the generic_subclass kerneldoc not to set it in that case.
> 
> Signed-off-by: James Clark <jjc@jclark.com>
> ---

It's ironic that the generic_subclass thing was added to support 
onboard_usb_dev, after some debate about whether it would be better just 
to export the generic callbacks.  Now you're going to implement the 
alternative solution for onboard_usb_dev, while other drivers continue 
to use generic_subclass.

Oh well, I guess there's nothing wrong with having two ways to do it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

