Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDAD38D014
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386815; cv=none; b=LkG6TdLx4c6czE6DQp6/ukOrdy+MOokQ646GjoVYwojkIhQvpG9JLhwcAe5sq+3Ae/TqT1WBOmGbms+iQhpM24oWdLviOl94gnYGGquizBV7P6scJfMgorFhkO4omwEzSqJOt+Mw5Siza9ogEAMEuiHL43uLZjaW6HDz/sMNJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386815; c=relaxed/simple;
	bh=1dAfclRN/nmv7uY0bWUpsisbW5y7IcZ0Z7SsLZ1q5lw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ph/uPfpRnWOdywkZUzwhPHY2C5NqLaspO+N3qalZhxGSztzyGbvCA1L6ztxMkjp/rIXodhKc0XH4NtEtxqwm/IWgUbFjyotYj/27Fc8gmw19sB+SrO4iYe0f3d5ABzDnvL1/CdpSGKB3DDr/dy/q9l3qpPsl55aNB9uDRywiE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etvs0WIF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etvs0WIF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954afac04bso18242895e9.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 21:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785386812; x=1785991612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XduwMnpj7HK4kp4UcbmFCBNZ+6mOdUnf50UJZABb5nQ=;
        b=Etvs0WIFmNXJx7xMN096eTFuV48n8Oz6mkrCJ4bYmPOgTBQz+ltMP+S1Skgc52KR/u
         tSaXrf6T52LfnmNMd362Xvv6f5cbGNqagCuMKMvhxGfiCqkxyuFotYdwLNNJclMFqP3h
         2cUPhMso97fp9AaZGaExPsQuxSOODVbTDbL/MRe+Mx5imdwnQBE5M7HpYVDvgO1p4cfX
         9NGBwrooRaNvA2PW5FgAxjgzDmA9DeqHXeDHZe7kwUKmpnPEIVvrFTT8WCzHizbWF/I4
         uOGHdaglv3F74EqTodremJwYloYxA9TM8pwQVnc9lWWENqPEf5IbNo7LVSbZDpO+HOfY
         ReBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386812; x=1785991612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XduwMnpj7HK4kp4UcbmFCBNZ+6mOdUnf50UJZABb5nQ=;
        b=PxKqOyedh8S1YlNHXW25QNg/nmfk6qedHc7RIVFS0u1cpVtIPdrDcaDx5Vjd+AyLED
         1EV3AE3OQe9sC1LsizOdKoajlO12+ro+2gD4VVH2yKHzNUZBo7wzxc6Zbcpd5W/P7Ar0
         ozXcymdbT2CzLs5U0y5s6Wvc/ge0PZa6prSbG7B/RylDuCMa4xt0RI66pqHivvaI7ERB
         0Bh+xC6tcoUccYoAOVmRkv8WKyw0kMAEkoOmlQwS/J4FjcFJfPPtZp1skA7UEPmUJ0kT
         /AbuEF6YNOxnjQBfcT91xZx++fGaldFPqGUWcQV4VqwYdEPmKPirrolgRaIHeHV7s4Ow
         vbVA==
X-Forwarded-Encrypted: i=1; AHgh+RrXh117zZxZVCcgVl0FywvmhJK2c64X5O/dVndYSXA5JUJuugh4Xyh1iVs9LhtIHDnCIBOE8TTHTrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3ukJJ+/CSpPj67NGQBFsx7K4rXrvAaJZwlmc/MuErRGOAevq
	xMQ3cQ3GxCz20UH6Bh7hyaOu9L9SnXu+/9joz3DeMES9iV72+8d4bhnz
X-Gm-Gg: AR+sD11gl7YXJ7C8/YoZDHatyQtJAH2Kb97MF70qGnJrJgDMVVelTNacbyFOcZTLRWV
	QvIw7RlxQAmg5dapAW/H+hHHwyA1KtRabQUu51ViQnepcQJKGWTaDR6c6HzqQ6VqsnYwpakV8D7
	mMdTV5Uo4gGwMlKjqKY4XypvXNbMVUoGQj8HrzIomlrDdfo5T20zk6u4bGEhemctG2X7KmiYvgn
	BMC8Q7xKQTax/GLJsXvfuDtCD0neSYKKQFbyuWondO5u2Ekp5u//Ic5InWtbaM2exx1BMwNyG/r
	tpgEgTG+LmjS0z7I2ZSqRwROx7GNcsIrvInSbwWMpujXtd31dwb8OjVeqVH30hMR8if5ppjrSHz
	oppyQtPLTpjmDqtfmLf5EeQCrBUjPyePiXMTGtVNWGMwHEgTlvm+MoGRtIxg4TFJ5EsNAAy/YcO
	tM6lVNEMRFRHqddapSH+juUsJP7HFpRBxvpD3az4t3aTcSKYIYFz8IW2OkM6vi5DawSCilUw==
X-Received: by 2002:a05:600c:3b1e:b0:495:727f:40d2 with SMTP id 5b1f17b1804b1-49800ed19e5mr10900265e9.38.1785386811674;
        Wed, 29 Jul 2026 21:46:51 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc894c994sm2545793f8f.37.2026.07.29.21.46.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jul 2026 21:46:51 -0700 (PDT)
Date: Thu, 30 Jul 2026 06:48:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
Message-ID: <20260730064817.79e3d1af.michal.pecio@gmail.com>
In-Reply-To: <e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
	<2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
	<e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

To avoid putting PCI-specific code in xhci.c, I wonder if it would
still work if the disable/enable cycle is done by xhci_pci_resume()
before calling xhci_resume()?

On Thu, 30 Jul 2026 10:24:05 +0800, Jie Deng wrote:
> Runtime PM is not practically triggerable on this desktop setup,
> but code inspection shows runtime resume also goes through
> xhci_resume() with reset_registers=true for XHCI_RESET_ON_RESUME
> hosts.

Resetting at runtime resume sounds like an odd thing to do, maybe
runtime suspend should be rejected then. But this is unrelated...

> We conducted 1000 tests on Hibernate and did not observe the problem 
> recurring.
> When it is suspended, both xHC D3hot and D3clod can reproduce the
> problem.

> Additionally, I was able to reproduce the problem using the Renesas 
> uPD720201 controller as well.

I wonder if it's an issue with those chips or a general PCIe or IRQ
resume bug in some particular host system? It looks like nobody else
complained about this old patch for three years.

I don't have ASM3042, but I do have ASM1042, ASM1142, ASM3142 and
also uPD720200, uPD720201 (rarely available for testing), uPD720202.
To be honest, I have never seen lost IRQs after resume here.

How often is this supposed to happen, how exactly is it reproduced?

Regards,
Michal
