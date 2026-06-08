Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5A37FF63
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925369; cv=none; b=MG7uooX0Pb+UOZhZf9f98CmkQqLVgIT1a7131Ysixh6D/lyW6I85A0r28SnsumQoCKweAOel60wjmNuOwGr9VL719WR4x3ziD/Ad4BYnuoF+5ePGcTC4tVBaaDIq8nhLZoByS/PkTn7AFZDLGLR1bnVrjFuHezMrX3W7Qy6GtSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925369; c=relaxed/simple;
	bh=z8MSdvFJcLlmwUoCN7pPJ5TAVHYrBkkNG+2rX0mihLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4LiW/x0hsMJH/xmtW4xuf40AERmRfPf8Y9x6GsNHjdxYXIXr0Oop/vKJJp7td/oSx4uKR+/bIX9SgFFLD0lCUg4BqED2TB6AypUmSwK7Zm3pF590JaSbFFX+4W/7OURzmEkzfhdjdziNXXTnWA4Fph6Wvpbi64ZPRc/UNMOTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OnXKoIHX; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OnXKoIHX"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6efdb6755f0so2572443137.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780925366; x=1781530166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpRG/XYD997Ymrkj2/briBLafb3vomi9fBuHfBWo7ok=;
        b=OnXKoIHXQDZ0jZYMUcz1Mc/DfZU3WzJjd6tJczBWurAdWpLhnobdkoBbo13Vchne2m
         2m87pFohrb+/3ktdqrVIUpCnB+Fyh2rpOQWTezVzvjRxBnXQOqZIJLzIGEjXZO3cOkV8
         ssAMGEgqgX0z3RII8JnMYaemIfDWoDodCEHpHp53hkAd/KEFy7TK5oPT63Fc99UtSXHo
         KA/5nQ9s5/kODnVRMxAQjw0+A+yqs0CXGHEdO0Gi4foXvbHGqc0RqUegohuPKQHkEA7W
         cKKwJ1EHtr+co+GeEj1s/Yru+6LXqknQjDhd7o/XC5iFViQ5gfDNgCP8TctfrLqG/r6C
         nG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925366; x=1781530166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpRG/XYD997Ymrkj2/briBLafb3vomi9fBuHfBWo7ok=;
        b=l66wnWQZjmIZgy+BdsUdNx4pJqYX4ulfKTH66obnfYnCTxvCHzopZbgD0xnwUHbSqR
         mr/wSF3yLqZDmJY0gcO7gaO6ENnFy166C9Vmoa5UarQllgiRg2n3NhPjbpmO5YNeOBIA
         tCfFbU3WsqaMH40oh3SGPIhFadbsvK26QJh5BkOYbknXOgNnm+J+M1N8KNhSM66n95R5
         kPFdeGrqZ7maToLkXG//42OeQylPmVV4EQSQ3PHC3OoUoNRKjziKKxQX8qSzxcMX4RMX
         +pYYHijhL4YMcHeBi0ga4+HDW8bFL7knPR+jrN4ErIK0QSrogjdHv5qGIQfcWV1hU0gu
         NMIg==
X-Forwarded-Encrypted: i=1; AFNElJ9KAfV6RIq6ZHAedqq7GMueH4w/+acusZcVI2IVAZRAeUv42QTrX8o4AS0WaQIGlwJ81Us7H5nEImk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLoPofQUC0Bx76onDAoARXFiAnuBPBZlP+b/jegxl+a+BOUKD
	8/jSsGc2ZoFpXzrhOzG9Wd2hZQpqNYHv+HszXdtD2476NHLSkKIbVs54YqbWT0HxayBOXMPUzqJ
	SEeA=
X-Gm-Gg: Acq92OEk7TRC8+QL4AvCQ/YRZBgxGPDjabxNlqfoEftvv2LqnjesRIV5JFjYsuOpwGB
	/ikaQVOZPKWnMrVU3cex2q4yD95jsaz0LovoiG17MTodW5nlHfSpCbuclVRSvwWzQAvwZSMDyfp
	ksUdg8dK0JNVDd11xGXnoIqFOwBfjzZULzkYRz1/GGwTpfCN/Ly8p3YMBZ+YS8IsTCuMYeoSGFO
	7m/5aoSwOzMaV17m67onElNx483zxQL/pE8v+x57xOkmGyRtoQy3lKsnYBT6Kyg48OOYA0/e4sz
	Sqcs7rBje1DnsfzYwG2clC7kcf9MBUVeVQxWhQtLsEeUzAVce4HQR15P5nkSb/LktJx/gFSE890
	5bCNGQ1H9t20jLjUJdO4PnCvLrkoOeJADtAs/IOrYeVROy0bxwc1hYk8lwtXhEPWHVqhLmUHyJa
	4yqKnI2CCkHSMshC8S5SSwU1EUQfEjalVX5V77HRhQHVMvy1f5cVp9iA==
X-Received: by 2002:a05:6102:5688:b0:631:4e9a:bab with SMTP id ada2fe7eead31-6ff084a62f4mr7261799137.18.1780925365990;
        Mon, 08 Jun 2026 06:29:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd051facsm163824426d6.32.2026.06.08.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:29:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:29:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Shuangpeng <shuangpeng.kernel@gmail.com>, keithp@keithp.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-ID: <67613cb1-acaa-4870-93ed-95a282a74f06@rowland.harvard.edu>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
 <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>

On Mon, Jun 08, 2026 at 01:24:03PM +0200, Oliver Neukum wrote:
> On 07.06.26 04:29, Alan Stern wrote:
> > The simple explanation is that the chaoskey_release() routine contains
> > debugging statements that reference an interface for the USB device even
> > after that data structure may have been deallocated.  Since they are
> > merely debugging statements, the simplest solution to the problem is to
> > get rid of them.
> > 
> > That's what the patch below does.  You can try it out and see if it
> > works.
> 
> Hi,
> 
> correct but it misses the same issue in disconnect.
> You need this one on top.

You're partly right.  Both my original patch and yours ignored the fact 
that the driver takes a reference to the interface structure.  That 
reference isn't dropped until chaoskey_free() runs, so the only 
debugging statements that need to be removed are the ones following 
calls to chaoskey_free().

Shuangpeng, can you test this patch instead of the earlier one?

Alan Stern


Index: usb-devel/drivers/usb/misc/chaoskey.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/chaoskey.c
+++ usb-devel/drivers/usb/misc/chaoskey.c
@@ -248,7 +248,6 @@ static void chaoskey_disconnect(struct u
 		mutex_unlock(&dev->lock);
 
 	mutex_unlock(&chaoskey_list_lock);
-	usb_dbg(interface, "disconnect done");
 }
 
 static int chaoskey_open(struct inode *inode, struct file *file)
@@ -320,7 +319,6 @@ bail:
 	mutex_unlock(&dev->lock);
 destruction:
 	mutex_unlock(&chaoskey_list_lock);
-	usb_dbg(interface, "release success");
 	return rv;
 }
 
