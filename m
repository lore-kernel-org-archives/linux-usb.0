Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3147887A
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325620; cv=none; b=WukxJoylrNDhX5YSWOs+hajKMV5f2cVF81PpgIAv2a2hlQ1Z0AlHhZpR11Gob9gbdoFLYjFd1ECIRoAK9NZsvva/7BzKMKhxY88IZbcvsbDFn1WHIt8YnmBdcMCfswRK9+wKXik+GKHEZJhesWI+RN9Ec6Y8gJ3mgIFYkvhNJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325620; c=relaxed/simple;
	bh=srY0H7mYHc92uRhlgsuKOa8KwP+jnMDvAjWaFiC0inc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=du1J5RfTuEFz3aCIMoTaa/qsAcesEcGUf/HIfqCJyv/4yWvsYkioISCqRcq31CldTt7ZvHJsCDJeu/tlK5avhMxVzC7X2ppM7o8hOrAdRgNIAahp4DHCDhKcj6zfGEdtK4eZE3HgVw5yvECjxs+3mrvcLLk1XLLmvel+JsfnL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUUxV0nf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUUxV0nf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso4402065e9.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790325617; x=1790930417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=srY0H7mYHc92uRhlgsuKOa8KwP+jnMDvAjWaFiC0inc=;
        b=kUUxV0nf1aGdFSFS7WLpDs31ii15AjqRFklEz0R16lepT4MxUxenaVpsdH26pddNLH
         ffQrA50ro9fLU0ONUXl4gwUZJo28we4A1IAEcbIpPSU/zKVYQnL52+XROOiJFLb3WRzV
         l7+rBr7r78cNbg7K5Qh9S4XyqqzWYH/XznxBKjD4WcVyHRf/kNZf7BqQpZnGs6vDoi1r
         j39gU+bhmwCX90ONeiwTXKMnZiwif2HYHGHiO57fPsqgRqjGAx1mG8TjbkxQ660J4CSs
         btK7BSwQhFWw3RyQbjYXEzJu0HupwajEUgVGlxIvVqfG8b/WqZ4wUqMwF7ymxswSH3AU
         Au4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325617; x=1790930417;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srY0H7mYHc92uRhlgsuKOa8KwP+jnMDvAjWaFiC0inc=;
        b=i0v518dpVAMMFZmP/lbZhwzo7YqGq+XgZFnKYn6QZOID/Ct/XdgDXZEWGU4OK7EIax
         bznudPZFs1ZB9UhQVk5oEeyH9IJflLC/kjrmGRY9YMD2Fd6gf5njx+O6GHIOwOjv4stp
         dB8X/H2ZlwH+VZxv3V52+OLs1gzIwr47R3wHr5qD/CFMPdy4LIvBXBNX/GEzlZmM2KBw
         fK4mmJSuXgIk17Bnc/BGaSnKJat2mmJugLY4gVkzAbciXvwnfRuQJM4yp7FiqrzgSvk/
         P5UyPwx3FWAEi4r3mnFDALk0awQQQ7EaMYAW6FNuEZz4VvctxgW2fhxIdyQAJA2z//2A
         crgw==
X-Forwarded-Encrypted: i=1; AKwUvBztCaL22r9hJKNdn0SU+0ZIdc3U+R7MsNGNtQYUL7uxlWDpIlTqlgwfvWaIZ0ek+LrAjXUas2Wrt1M=@vger.kernel.org
X-Gm-Message-State: AFuF++mTSeZr2fQ2c73gyp+gU6vlLjd3LlCdX+R2Urw7M1put7+ySNEP
	N4BNoRoPXpdWxaX35ecXOuAPBdC64DGEDke/NYrHcOD9vtgj9bjAFj7n/NNDxQ==
X-Gm-Gg: AYBFou3N1GIrDARQQcdbu7UuMBTnHcdaN8h2mS1lYLvsVwPmtjb8XAx7vAM/5AVX1/B
	rS5xtxNW0vWzaa8fNws+hIOgIHiAFyi/m7jsyj3JUQQkVcDrqyQbokPopiWSAEjqn0/Yn+87d0z
	XbDMU3TtiVikHvrR4LBS5Uc7qoVXv82jmIumk6wIx4P4s0sBeCaQXpCvna69YiZFUmplCC6VWo6
	FoXyiwSSIOMJx+PPXK628q/TbIjl+BYvRWi53a0lQM4/noTJW6bXftV05Y+TQcnA9BE2A2kAb57
	BKBlI368C9L8coBC2lPM0Cq+6m0CF6IS9gMXrGdno+bIKLwNinxQuNwkENgeLpgGHodv4SiLb9v
	mi7cFyoFDpQz7HG6kiOamVoFo5EzMGu6cJ8KmlZn0v7AnPmekZ6SiSRsU6XPiGZNaN91YZI8c86
	dLZdl7WJa3N7jbNS322aIAgIHzMa4tgOPO5EtbAz2hVSnctMbGE2HRA4V++eO146qwfFP0pZEFL
	Eka5i0g/g==
X-Received: by 2002:a05:600c:3b07:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fe66d1653mr89115345e9.13.1790325616955;
        Fri, 25 Sep 2026 01:40:16 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm50928595e9.8.2026.09.25.01.40.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Sep 2026 01:40:16 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:40:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ben <benstaples10@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org,
 andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260925104013.1c8e21cb.michal.pecio@gmail.com>
In-Reply-To: <20260925102746.25e87ef0.michal.pecio@gmail.com>
References: <20260915043845.GG106095@black.igk.intel.com>
	<CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
	<20260915050515.GI106095@black.igk.intel.com>
	<CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
	<20260916075135.GN106095@black.igk.intel.com>
	<CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
	<20260917043847.GV106095@black.igk.intel.com>
	<CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
	<20260921044453.GJ106095@black.igk.intel.com>
	<CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
	<20260922042608.GZ106095@black.igk.intel.com>
	<CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
	<2a4026e7-f5d3-4301-bc60-0570cbd7fa09@linux.intel.com>
	<CANcA1gAM7UsSxNyHET7HZndeWzAnf4yBDdhLC4pRFsMNuWOHgQ@mail.gmail.com>
	<20260925102746.25e87ef0.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 10:27:46 +0200, Michal Pecio wrote:
> Broken 64 bit support usually shows as IOMMU faults logged in dmesg,
> because the chip tries to access different addresses than intended.
> Here, it looks like this chip doesn't attempt DMA at all.

But wait a moment, are you sure that you have removed all the weird
boot options as requested, and particularly iommu=soft?

This option being present could explain why the chip is set up with
addresses >4GB, which is otherwise a little unusual thing to see.

Using iommu=soft is 100% asking for trouble and it makes debugging
harder too.

Regards,
Michal
