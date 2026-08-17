Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6953F7898
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963490; cv=none; b=LRI1GTdMzakhJMaP/GOV1jqmluX6VSoSFkIsw5IjdcFcFlAFUiDdbSyfbjPOJeYhGwI5S7wEcNsT9IGt3u9ypJrOSNKDlFV0k1/O8ZV1I61rOBNkj16vcPxVw22cCq5MRLqq1awbFQjyhbOO4xElxTOVdIowhmQYyC74xqz+1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963490; c=relaxed/simple;
	bh=6OdGQIYZC5zqFcRMs2e7MQATKCS/u1O7KX9ONOahp6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbPvYDRcFA/JwNf2k8nk3IMp2S46I/jS9xhOMFbSlElMaSvkR2Kr/86B5n5cGpW5876ObBkfOF+4ZXIQ/O8//hvZqmNOP3zbJfc7iuPRYc4cpsrNckqZjoGHUJmcaD0zBC4Hw/7LmXy6gZgYnMQPGpO//aewiplnkCHVYC31h4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=EMKAuq/8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="EMKAuq/8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954d29264cso15815915e9.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1786963485; x=1787568285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6PGZNfyM8jsJWbDuSHn+rMcyRH+NaUJGRfXqfKgngQ=;
        b=EMKAuq/855aSjbc9dNZ/Clm6wtzZllmc0St1AHjUEeANzUZGDz3bceeN+CcCxDtpbG
         B5gCGiAQ0vCYtcSLW8miQiAjfthvjMIfxM4HNbumx4g8aGSslOvDvtoMKTnDnQp7s7eV
         HSAfO4hW/0KQyDW5z5kli+saz0banpvSIxxGoEez7PVHRI9c5eRF0pG6v0oPMffU3TMJ
         7zaMnH02QAX9B1Y3rgc1nMTrZytaf1EKIjDgCXSZZpSUrMpWG/65o114Ta9qzjzZdDTr
         IvkzY9bybvhx94biQTUegEe8cvs7mOxomhY5J5yfNQdggbwvte48VyB/SXY7twHev6+I
         0VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963485; x=1787568285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6PGZNfyM8jsJWbDuSHn+rMcyRH+NaUJGRfXqfKgngQ=;
        b=W60g/L4sFCIiWLdsWVlkMM97V8nppqGOrua+HKsdVw/BgWCTigdoo1QYUuILwiq7T6
         YEZWHuAvedEaxc3ej3Q1TcijCAZ16aoSw3Ps8vw7o8eqyhCL2E939IOdtaJ3VIcCmZEd
         NdFECBk92doOpSQG4fgAHMLjKB7BOO/EQ2Rj7b70hq9cT/QTLTx9Qd4984wvY2AEfZu9
         GdEiyW1JH1frFjhGICsfuU2zd0fQ6RUiDgKROfomOnVqN/Chd34WZL2DeDt0b6rWjbYM
         6OjsaobETRRKA6rkUsdZduWAxa71YSHB083ogu2COhtJH0zijQApkD9SE20NVCG2+sQS
         igjw==
X-Forwarded-Encrypted: i=1; AHgh+RqdQnqtkux8/D5r7Ebrv+6PVEGwz5b4oTkcj8A12aHt1u3C1NzYNRxtL/M2efpxU12DmVvVHVLWE40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrA5wywd2jCL/wu0tAj3pHjOJALQBYKme1UZ19FD5Gqlg6tBR
	drzvFBPNitN9GzgdbXml6WyFba27rN9xAJ8ivcpM2ZseVdx91sXB4IY86O7b8YS3/j4=
X-Gm-Gg: AR+sD10LwcDq1HHvKisNTNzu9WO4edpBvj3r/j0tGXWln0+yixE29EbSuqKZYJm61DU
	tIW3qNHdVQTrEBMF1FjzUYQy8ZmnxnMpIkkVPPSmrA0/Hp8N3GduEf+WqlGorbgDx/zAwAnt0s9
	8ZeyWC93BBhdpvAW1lPLG3cb6F5bonEePRUhabtLbZ81UrluHxqpnoK5ZXRgvk1UYJQXM95qTyn
	e2Gp1Gfh77etI4jHWPKnCs4mdZI0hvAutvm4YlW4clIalla4vqqb7Sd+8M/GJJNXzvZtHbe9m7k
	G/X96Qog+MzJMa9amF+09GhB92oA34c9PInRcFyCDfiQHi+hQYUuvychpOAdPm1P2zu76YVZy02
	mH7N2XtqvclhD8cvg7ejxCT02mdqOBwa5e24TKaWYdgZ9ttSaAda43xkkVC3FblOm8z9IrrE/lg
	TvAr/P1gKolbOK51SSfyVy8A4lZ5fFGvWJeqAtqSnaZV9FZvSNbuSt6RLnXOhD6wFFEBxuQxr37
	KRGeJ0wlPL9etSXhBMDBUcBQso7EeGr7Wwu6NKnsQxw8pyTWaa5/8mvxuYd0xLw4JghXu4DEQNF
	gOSNz0VoyQ==
X-Received: by 2002:a7b:cd06:0:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-49987998f91mr271465215e9.16.1786963485389;
        Mon, 17 Aug 2026 03:44:45 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb872sm43171465e9.9.2026.08.17.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:44:44 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:44:43 +0100
From: William Bright <william.bright@imd-tec.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Handle connectors already attached at
 init
Message-ID: <aoLmG1nTBJ8bd7ok@will-Legion-Slim-5-16APH8>
References: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>
 <aoG8vy8upZhuLsQV@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoG8vy8upZhuLsQV@cae.in-ulm.de>

On Sun, Aug 16, 2026 at 03:35:59PM +0200, Christian A. Ehrhardt wrote:
> 
> Hi William,
> 
> On Thu, Aug 13, 2026 at 10:38:40AM +0100, William Bright wrote:
> > After a cold boot the PPM may already have a partner attached without a
> > pending connector change to report. On a CYPD6125 the CCI register reads
> > back 0 in ucsi_init(), so ucsi_connector_change() is never called and the
> > Type-C mux is left unconfigured for the already-attached port.
> > 
> > Fix this by additionally checking the connector status of every
> > connector and call ucsi_connector_change() for connectors that are
> > already attached. Whilst also continuing to call ucsi_connector_change()
> > for connectors that report a change via the CCI register.
> 
> I'm not sure if this is the right thing to do.
> 
> First, there is code in ucsi_register_port() that is supposed to
> handle the case where a connection is already present. I wonder
> why that does not work for you?
>
Hi Christian,

Thanks for your feedback, I had another go this morning at trying to
reproduce the issue I was seeing last week where I was just seeing only
high-speed on the host instead of superspeed and I am struggling to
reproduce it even when doing a load of cold-boots.

Can we drop this patch-series for now? I need to find a more reliable
way of reproducing this issue and if I manage to then I will need to
come up with a fix that is on the ucsi_register_port() path as you
suggested.

Regards

Will
