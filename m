Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB92FD1DA
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078615; cv=none; b=q/mv37OshRzzVvnASu1CUWHUDe6Tc1bU5P7pHiOIIIq82ssql6s8cpd0c/BaEvOrK0izykYNGVPtXb9VHxPDlRKbgeWbX1Kt3VKIfq9cWokQBLtxnSbufz7t+43aS3EK16Nxk3wZWUKXraRf+CPb1+LXZBYMyVsgJr0zrSh/8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078615; c=relaxed/simple;
	bh=XHtOvOdExVYVK0L20Y1kc+p1kcu3IsVWTMjhJrgKsSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biab/e5U4XT9wDM97lsqKpJR2f9i+edyBJrnOt+dnHloWeMdzqmemRAvMVmIxQvPxh80DqMMVhjmOOxbV9C+u0FAUAqk4hr2kyfxfiQKBZnE50mvIHNMljsp6rsAKVdKoBwOcwWjTcvaphl8PSLbZFDi9FYeQmrWJHsVmIqmhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q1UIzLFv; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q1UIzLFv"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e4f0d7d77so12267485a.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792078606; x=1792683406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NG7yQWPRFm6MWCNL0sADJ8FQgyahxBxkuQMMXilVXkk=;
        b=Q1UIzLFvhLqtxBc/ZN1Pl7ibIFbz9qXk8iRll+uAiRUGyQs8S7+UFZby9y72ScIZcx
         rfMws8DA2OfzPYdK+D/TFAGvrBzhyy2p3WGG8LSmhartt/aRcKxwRBAkY6cSvwpJKUwN
         ZMS1za/ZCTfHw9nrtXyCLUjjpGVCygfrodFh9AUVHTaihaTEAYcFOfIIBfdeVAWN8InH
         rCbm0AkciCmQK4hilt8dU26L0mnW8BHmJXD+VhQ1hWdvo/68gMsO3Is9YmB31VxcWgY3
         GLVs5CVAGmHdxa0yY/BANx2vbyKSM6xRoAL80OPrYyTJSzmBtRB5uyXHndxIej8P3oTL
         eMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078606; x=1792683406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NG7yQWPRFm6MWCNL0sADJ8FQgyahxBxkuQMMXilVXkk=;
        b=W7z0hRjagDu5d+ljYm1Dz4fto2xcZa0UyMj8L6Pr9k6rRNFQxndGFf8nY4Vp3kcPSL
         Ksfn8P2OrYLU9ILY8ZsypEs4pKvIN/+J9+C/M1MXAtoBWG79vvuZ03Q5Z1rQfcBPFg2s
         b0okNqH+kFXEkKHGoETji+WL3DcyTfYhBCaqOwuScKVsI6xaEwq6LWnHgf5DEHqF+4NE
         aEKo9xpglNsPyXNc/BNf3zgJAIcsKlOpop3pixiHKKbe/Xuq69XjKLpb4rQOdJOwL1hp
         O7Xt79MxRXs8kNFf5KhJ8SgAmcecqwc8Pzfha18HQ1/mWrZeE6kX/mSyYpHVuAwZ8I2Y
         sxKg==
X-Forwarded-Encrypted: i=1; AKwUvBwv59SShncw3WdvDHxyaZBdRDx83k+rfSQ3Lx+JtTrJiRbOsJrs6pXU4idj/+DZrFdutwEm0aVYU+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ5gFiohnAcGuIHuHopiQlBhnpmdXRf+FC7nX4bWKSn8qn6xCY
	juqMjvDl5fYpTWVKIqyU92+vCwlsbBQcMi7r2e4aJQVc21CbIT6Zm24BjnYYhad7z3dqmjevm5Z
	Eui/cWg==
X-Gm-Gg: AYBFou1de0uN1VDAMC9L5I8aPRV16S39VruiOTsIi2qrJtUCnWfp+mA8WVyjPwhYs2J
	F6IpoleNmit/d9JzAl7Cm9D7XPKehciNmzdvVfrgCzC3DwVXe0iUElHtM33XddJDJ06HBULUUNz
	j2FVUSw+9BVeGMF3geeo9RtjGKW/QFc961Niz+TNbCix+Gm9o21jX6WzkAFpXSmCMgJEVVD6x3e
	YTOgfD6AeSxbYgGeP3BJlj7e5Ed8xyL3DdmRapZTmzh833CfjWiO9B7CO30Yuw+tj78Sxlluo02
	9kCFHWN7RrrBVNKWwM7vGURkh7VtdVSGMc5ykZ9Ya/1TaySmXdgK4Slr67/VU0Elm5Y4Fx1fISh
	0xcogFKHL2WeZLwdB3XB78DHZq32IxBZ3oyn91lmA6E0lIfi8xOIpjquzRWKz59izXfbAmP+S0Z
	yMvN6oCFmYAEoHrGT4Kbdmo2Jw8Cr6lwlAjZH1/iEApnZ7YOpHTQ9Sn0NRS6bD/p2y7cKY6kAdy
	YIxv7Mk9qKhYC3zflOTmTqndt4eaJpj948n9hjjAA==
X-Received: by 2002:a05:620a:4416:b0:93e:95ce:53b8 with SMTP id af79cd13be357-93f17df69afmr76605285a.17.1792078606337;
        Thu, 15 Oct 2026 08:36:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508c857sm779973685a.38.2026.10.15.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:36:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:36:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Reid D <skibletz@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
Message-ID: <7428176e-3036-4919-8b46-aedfaa1f58e6@rowland.harvard.edu>
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
 <2026101531-secular-entire-f7a4@gregkh>
 <CAGNJ+_0ShEM-G+8p3oHx1uF8rBtC7JyqmyFzswDB50qsW=qwuw@mail.gmail.com>
 <2026101509-reggae-whacking-6598@gregkh>
 <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>
 <747393c4-4824-4a06-9747-3fd74028c2d7@rowland.harvard.edu>
 <2026101546-civic-gorged-3023@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101546-civic-gorged-3023@gregkh>

On Thu, Oct 15, 2026 at 05:26:18PM +0200, Greg KH wrote:
> Awe, you spoiled the test :)

Oops, sorry about that.

> Reid, again, remember that the _BEST_ LLM right now (top of the line,
> frontier model, no guardrails) makes up patches that are 50% of the time
> wrong.  You MUST have a reproducer to have a LLM be able to prove it, OR
> take the time to manually review it yourself.

Absolutely.  Don't believe anything an LLM says without doing at least a 
little verification.  Lots of the patches they make up are just plain no 
good.  And even when the patches are okay, often they are "solutions" to 
things that weren't problems in the first place.

Alan Stern
