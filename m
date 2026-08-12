Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904B348C6B
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 05:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513251; cv=pass; b=YXxu+V33fkKAtiQovuvp4wTEb1Q5/aGP8xMjlON2R7W/1FWSBkCJt/HV9/6R3m/cJnFHK6X/pR7ScGmXRuWL5n7bHImrUWP+JTS26qf1mnfToTxzZmwxANLCdQuuZiJoA6zuJ+p5MBTyiDTQT+4rIVr9I2t5zJ0JMovqV5uyot0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513251; c=relaxed/simple;
	bh=m/seKxW02ByOnB0+QTpdy9uY3bXNt5eyT11VbzK816s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNGWxPIQi3naWgS9BeHl+P5yj4tq0zRZ9fKtztUVNymr5KhXI5i+7aU/Xm0PjTLF5R5iTtNOXKEx8/Fxz3t3VZAhe1h3bgKPt3+wpn8PoO3bIAPup9RNBXEwpeIefsCBM4qYp0q5oUTNHTlELc1hA91gHGz5OP1VSMu3LZvjM4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz2Z6J8I; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz2Z6J8I"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66b13ee8801so724785d50.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 22:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786513248; cv=none;
        d=google.com; s=arc-20260327;
        b=Ph6avXLdp58E+5nkNRIKyFN6rIiCBsO0woI8kQVkwASZdE/Le0kyZhE/S05kmw8zcJ
         NK1eWj/nu0i5WzD37KTgoy29wv+hydZcWpT/OCCRRMQFtKsqzTxW3g7m7CksQRdqdygw
         HiGd99RGkjMeaTFDI0uOscZzf6V3FxzpR0RuNr7PkT6/efugqa61AsnsPNvfYGfZbLeJ
         IttanMYN493AqMxcglrGnWqT9F+r+S/gU97S0x5SOcLYya/i2bDA45ytA30yO+7GvoF2
         cfrwmp8P5z65+ono4DR2zHCA9OrbtxXAl7U0QnWQhamNGJliHWNyb8AUZtwC67d2IQWF
         UmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=m/seKxW02ByOnB0+QTpdy9uY3bXNt5eyT11VbzK816s=;
        fh=NU5uWpz8n8fZKLxs1VxIBb+nJx98yTtv67ft1VASB+E=;
        b=OSt2y0xHA92LssqzcMgDl5YiVewEEvNWAiCE1BkV/l2z4nQquORbCSm1AvbZEw3LWP
         Kf5/6AQtfGdoxhiuu56T7k0fI+Dgd7D9nkWuSETGADRcpXRogAqpeDbziV5kuW8VtGqJ
         RGPizcYc6jsGVlB0TZZ6/p1cnAifzdqPfgiWAN2q6Y6zg1H4Q9CL5ec0+7mjr/KkaEKB
         KtX6UVztX12lI78OXk3xrTslAcD2FSUA6poDxe/yp0t6IbU7QjqtAnbppJ7z6HvEMVFY
         LL0jSqEeF7U9J3KL53J5Q5K4omUgaGMvC6NrrSAO8Pzvtu7JZd/EYtWxSF+UTS/X/ETm
         hEcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786513248; x=1787118048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/seKxW02ByOnB0+QTpdy9uY3bXNt5eyT11VbzK816s=;
        b=Jz2Z6J8Ixs6NimPEQy9sKep53S92MFJXqWjUKFdiDavJJpSsajB5bBDC8QZB2BJsye
         Q8b65I8sj3IhW1//ZVVdzUdaezZocwe/Zqj5kQN8eFf3OWduWcG+uHEopk4hozH7GIAB
         pHixYe855QgeLpyKb2Thcpg4Rux3xRDGBRwlLnAnN8dXHpgQhxZOutUj5MjelSWx7EsB
         Eij5P5AIYCzzjjR0GPPy0XJBBTZpJGMk1JRWdcESnQD89xKU13MPM3ZLTHzWRCG3poFY
         4aPseSBSAosRNuamCnpzXwzEYqzeKMG/8NfavsPLXHs8WLGoybNodB6sGTYm2vEXXSZN
         jm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786513248; x=1787118048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/seKxW02ByOnB0+QTpdy9uY3bXNt5eyT11VbzK816s=;
        b=n5fi3CmrtOk/j87iP4dwli51wHknA5i89IBz99iAaw3O7ggaQ3/ABezq9kLuIz0rP5
         PW8cW9pytZ92wL/YWRjB4z9eh/KAHfuhjexJDPh/+GnU66xA5vKfxeTYj5pHXBt8FR51
         snlQq0zZIENuhmV+evvrVZ9/cp9a4PGwbyLl9WO5/PuI05c/MAhl1l5mpRAbYjPyS588
         leFAUItj0vAqQb1laIunzOWqNKW8of5TKutC3Qeln2sX9hrHdAqGOXO8rZliI5+R2bqj
         iqb3SFuxWbYXuKltRaPbqNX1HUNs29N7HFVw5ajxXtykt+9CawXla2nDrmCiXoPoDeRk
         Ehyg==
X-Forwarded-Encrypted: i=1; AHgh+RoCotjmiqiUipSXPO3wygiazg6hlfHJuB+HWJYMp5ujV5M+B2tE8cZ6va+98gqi4ZA7ycMUK2u97hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFjFcRoWX/U4SAcEGSdeR/xty1Mnx2s/2bTSVFg9Z7I0MpRRU
	p/hIegiFSb9weVTzMd7zBfthVS8fzELzopipXPMX7ENRlV1eYO/SG632wlA0XfgzXyf3NktAyHX
	TFaIeuB/BbOCgwgeZpOPpqrj0FoqztGw=
X-Gm-Gg: AR+sD10FifNUivOMSqMwDCRhyeABnEsC6QULCAsi7EHmo4Z0D7LQZ1Njdy6IrVOQ8h3
	rUzNyFmXMIiFAYL3S2g8Q+wohoZGAwqe4JAY5kTgWPU0Z01EziJSHRWkIL2wnt0aFUuP9CS6ern
	VNNkNUVMuKIcbMO93/CKJjT+NF0OnQ/r5dN8JXN2oTvzclOO1AHIBmnxpuI83BDM99Ootd2VXK8
	+e22PGKZSFRCMdNH9yJAumjqV3O06JIXW7Xs6uwgwdt+mkg2xMxZ3IT27S23Bttap8dFPZwOUYU
	VvX6zQMK554FlNwzoREKSTDJ8Y16gE3Sn20ohuMLvQxoFleBxiMACGCATeUSHGSfi4KZi2ntLV9
	TwqZf/d6AFZUzoacbC0L1Wd7xBXP1Pv1xJBVJMoaMZKUwrPQGAQQVMom4oCEZmd6svD4GJNhVBD
	sBB9mbIWaD
X-Received: by 2002:a05:690e:12c8:b0:667:e8a3:eb87 with SMTP id
 956f58d0204a3-66b34144aecmr1111382d50.17.1786513248612; Tue, 11 Aug 2026
 22:40:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 22:40:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 22:40:47 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2026081214-litigator-nutty-83fb@gregkh>
References: <CA+Z0x2JOUKR6cH41JyFHBmG5L_XoVEa02vrc91-L42RX5oa5OA@mail.gmail.com>
 <2026081214-litigator-nutty-83fb@gregkh>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Tue, 11 Aug 2026 22:40:47 -0700
X-Gm-Features: AUfX_mz81W58lX-6xZZVf61oqNpZmlfCoL0gtL6qlB1v4ZYFnlzhyz2aLE4gVbA
Message-ID: <CA+Z0x2JqGxXmf7y_bQpTP-OgqwPbDAgzvCVpiXxPrGx3LxsKdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usbip: make remote list honor parsable output
To: Greg KH <greg@kroah.com>
Cc: Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>, 
	skhan@linuxfoundation.org, Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching that, Greg. Sorry about the noise =E2=80=94 Gmail mangl=
ed
the patch. I'll resend the series as plain text using git send-email.

Jason
