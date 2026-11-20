Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206883;
	b=zgZm3Z1TAlAjBs/BJPHcx31OOSJaHxnVxCG0b1Ay/qaY0gX90SYpczIfW2IcnKL+PA3z
	 m+lc740NZ3MpWm6F0/9qX0YBW3HKSAFRSO5ZY2trQDV2KEtum/xoFEy8aMi0Qldl1CMmr
	 yMOn/F4zyWyGAd6Ca240Pyug+fYWvRcbSZJTNCUe1V3V72EO3p0hlBJyS4PalS5CCinZe
	 BBEINGCAA+82lWACHSH18Y+g3KZwdzvQceuQfth3FOAZ0pymhghaH/+UAZG9WewbDTV8G
	 dfvDa5d5QmTrNK7QdrRha/dyxNRiDpTTlT2mUMKzI8c0l4lTSInE07q+/9NyfhCRddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
	b=R5MFZZTXJLdnEU+l59cOKFKvzFersQUH6gUn1QYdiLviCklwv0yZcqxCd5hSkjSNOXA1
	 VgpObEzYxDZ5zACNPr1YBA1kpXdV6Uut0mHTarx/EelA+lwPTqGL4IWicZ6ldaX9I3JrL
	 3wLkUY1xgSHTAbVa57hQ5qcLhwbg4MKyM1L8T8XqjRAQok13VnXMbr/CTS6JmcS3L8Zdr
	 3LSElQe5frQOWFIQtwxg6LtWrosQepA9fiG2EMr0YmaFXLgdKk8JKRUxzrMnu5oupS/Jn
	 ilktBLX0sPZE/HMULI48nPFmYCpLiaEVaYmyFFsA4AYZJFarrvKsmwHJtFD1Ru82cAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5yeIS2J;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D46606A6CA
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D46606A6CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5yeIS2J
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d2f5f1e26so14772861cf.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795206882; x=1795811682; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
        b=q5yeIS2JOBZN8SyUZivBafXJ5weCfBqketjq0eLDKLrN7YZ2N6gR0MhBibsYavzWKn
         Xe9K3kyC6GDMe4ASXmusLzO6cObMlo7JgOQb0MTVxP7sB0Xk9qz4THLnTU1Atze6HCLu
         ckY6hAPQXY62JFVKV81+brWd3wGIQQZ1nCHZofTLRe4aHHo5WvHvIAbo5mzkZ1XJrv9E
         X5KqaS+8FI65FlF9mm48fUb9Ks1ShjexokRsIq+aSICvVEdu7Sti8Ha/yFb3H7ZALz/R
         a+eEJUcPqupQcPO4y9CawPOhtI0i1T/as35JX8fDYOsjurYeArNxBQKygKvO0eCRlc1o
         9+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206882; x=1795811682;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtEU8b+Rw7oaJsWf+sYIPuoXL8GdHMocWcBYKlWujUQ=;
        b=QlHlCgJtiRic35c6HWGnZfXCxDomFQPHOAGuJFMCF/+7JKl3T0F+iiWP5q/f8QDRWW
         7a0W+BjYMR1DYGiuLCNcbLrFibfuK9QYG/cHnp8D26Tq3XyyrIHrxgwMhTORECHvpRIj
         aIMJgRspLNdQCPaWOcZlBcfRc2lQqmtjgrSuVwrvqQaIL4Y+qDi+U+q6W5T4o2ABxahL
         mNG5sPbEHaXGeNqJW4PBsQ+rg0w9FzUyg6L1MBLFPVl1u9ZOALQaZnbF7vm61c0eGLPD
         wryceHclzDsedMzaHAH3r02v5NJ/HrSRDy/hPqn5/DokMIXkk6Od7wUhhZZnx23F+icE
         EoZw==
X-Forwarded-Encrypted: i=1; AL+hErFMUbdV9enhJJKdsbQkJ+E5y6Luzh+4z8RgSzG1p5La1ox4PFhkqTMMdXCGVkkY/RD3NXNgdD7kXe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Ou4ga/L6U0CqwpksY3bE1mzkq53lEL225SipxU5krCskqmO9
	Te5vxe3VORUc7s1shvNbiHOcv1ggtyGgPolSN0LKZWpcdi3e+URgNrT4
X-Gm-Gg: AYBFou10KYQehwJo6HStEkfERW6nxkifrpzcVZqYesNCsf5QXyTDmq67z39X+BsIr7i
	qXttTG0U5ZWeLkuR9/pZgoYLm/dpy+6QI+jsJeDDQvO4+QephnuWKTE8OXd7en4QQgNJg9WaDqU
	Q2dbG/sPex5hEqbQI55fHw77nQ8xfeh/whWbjBYBAhsNNH3U1gzyEtL5zHnA7Q/wPM/pig1P1d/
	uvkqSzEOQ6kUhA4YMN+g+bJP50cR6zBnrw9o/O/G48SrajVtH/4sF2egP9qdpahXs+3fmWtQaWM
	XCLwb/eCvEmMBhu8Mp/04W1NUPXCWAmkEO3Sq1Q9HgYEebYz5YScB9jazOiQpr/JSb7IDmiD2jA
	apKpkAKmTVEfAsvUy/Ny/7kCNApn0LCCPpOvXjvIBOfiwK906FPtsjhPMhRIFUAqq9I4EDR9Xzp
	pSwyzNBd9YNWumpBn3xwJNFabWWwdZ477/pEMhtPdnKwO9oW6ftXredpZOU9ID4UEcFoiuw/iZS
	IjwyYwy0bLbQnCMFwdCJt3GtAYEaavENUQQDesSng7v9ra9PzocAi0qdC3QY21H+BuP6KI8JcRC
	kLcXmxTSOl6l5rw8PtEpS8HpaLhgfX20XMfmpq2NqeNzq3arnK0MmS9NlrJ3
X-Received: by 2002:a05:622a:1901:b0:536:6856:f590 with SMTP id d75a77b69052e-55d76a269dfmr80867651cf.18.1795206882285;
        Fri, 20 Nov 2026 12:34:42 -0800 (PST)
Received: from smtpclient.apple ([199.30.143.73])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7844f9bcsm32619781cf.1.2026.11.20.12.34.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:34:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free in ffs_func_unbind
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <2026112053-skating-swimsuit-9c33@gregkh>
Date: Fri, 20 Nov 2026 15:34:39 -0500
Cc: viro@zeniv.linux.org.uk,
 r.baldyga@samsung.com,
 balbi@ti.com,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C24E320A-EF6F-413E-A618-FB7FAF023F79@gmail.com>
References: <20260815013818.39466-1-shuangpeng.kernel@gmail.com>
 <2026112053-skating-swimsuit-9c33@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Nov 20, 2026, at 05:21, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Fri, Aug 14, 2026 at 09:38:18PM -0400, Shuangpeng Bai wrote:
> 
> Are you sure this is ok?  This means you now have a double reference.

The get is paired with a put at the end of the function, but taking and
dropping an extra reference isn't the cleanest way to fix this. The real
problem is the ordering: ffs_func_unbind() keeps using ffs after
functionfs_unbind() drops the reference. I'll send a v2 that moves
functionfs_unbind() to the end of ffs_func_unbind() instead, so no extra
reference is needed.

Best,
Shuangpeng


> 
> thanks,
> 
> greg k-h

