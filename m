Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51237CD22
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642430; cv=none; b=N0QCtNT56usRWy6++iVzkDNrbACjZMPGPc9II28O5+Kelnk5jVBFiA/yVMumX9gEO5aw9L2GRdoF3lpNySSvw5KoPloN1rScMtwnSRJrEQo/+OXQ8dyexbCeMwKcY4uTwCmgmnOJ3Wq2UxZU+cGHi66ijLQ9SX2sJoZTgPwAIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642430; c=relaxed/simple;
	bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NM59+7CJQLKy+tPowO6/Z8glN96u7qk4N8PXeoYQQu7QIgNWxuYoD2oE1mayvRiw9KticP5Upu1Y6YlvVfLu5BWs7BPEcHOW29knT7uu9xhNPe1bC6UEvP364lAsQBENdIny4EWa9jiWNUDPFk5OwhfVliSf91OPoVKcG4iYelE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEoKpKIo; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEoKpKIo"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ce9c039c8cso87399e0c.2
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642425; x=1792247225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
        b=gEoKpKIoGGA3vHhqVW4cqXARBXA8+KfdFA4u8/d6JgqidrYeMtRJjmbHoOr8iMKDKw
         jDW9BC67krz5fBAkfp2H3tbwMwIEPI1aYe6QXUowOwWfFzanOVnyFgCI+eY7K7AURPuE
         dB9yrWP5ECUUlRq2vsmke06X5ixwPdkaXYb4dSQhUxBrh6aFEPEhXTWRTRqYl9q3fqOy
         m4xoVORcUAjCrF1TOmjYP9t6Z8D053sAMIbGjMUkreIMDoN08/6O+IkyN9UR/2rp9upH
         rO+Ga5E7Yut92CY85DpWL+L9BpfhQ9c8RnEsrsrmq/tW0FSnzySaqHpAiF63hInRyEPn
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642425; x=1792247225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
        b=QJvrr0T+HAntraEQtNCNwq0JkvZWEbYGN8KGABHIl81de6wFDzNaUcre+0U0/2Q/b9
         xLofkPFL/P4EPuSG7YFggLY+6uVeHtZfAb0NS2t4ts5ey2PLVErhjrS1bTSTXfD02kqm
         SaexdBztcmZZyrL1skeKa22dK57T0DhjXkvpcsW99NX95PsQbcIfr2g2gnPJnUzexEDT
         3p+YSDiCUunzIkrun0QVd1Fe+F1oLo2VCx7lcI2S+z4Rx6laAUQmjC/UdJrTI2xulxSF
         gZchRQrS4+tktMRbkoHFJJHWc7g2Yr1zGl66OFZ7RN6JwcN1hQOzLGGFWJjvqBBvmgtF
         CsBA==
X-Forwarded-Encrypted: i=1; AKwUvBzKI6M9MsWpQaWbZ08daQJsm0PbgqSAR7jfu7yo4fq2dR55nbCUxHy02EYsHLrzijRNcKGGoLF6OVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjWlYCjRGVJW2BIl7UXiXN2nW13Ihjmt6+0POsThabHSMBndxV
	/Li2UYA/6Z8HmwouuxC4xxUdd16scsyIsJ80OJc9TcmOmnQlF4fT6xIX
X-Gm-Gg: AYBFou2rjCSMhEt2AOx35Ovs2ZGYppgDP+qLcQFG3jb9o8OsiG8PjeAVI/e6+TNnFcs
	/z4AzjxytDI0dUXXKk+duWWkGcLuowNcyGM8QVXULatuMLj2F/2/cnBSRMCeMhsjmm+ktMfxqq7
	8jmHRPURxDfxHDxDVEywt5Flfo65RLhM56WGlL4eD1uM60Dgh3muKCBU8KBuw5y5oFWUE0Kw9xj
	E5fWVlfRLGlW0YA17mL/o6vJXQ74soRYX/1bw/yA8YfxPji8qR+xR+b14S0ki+IAP4cBS4Orhzs
	0BSeahzsdTidpWi6JH0u5Uh9ospn7kpxZtlA1r77cyAlE0itpmvH+kQrIONKnoAxsNpeyYhFKXq
	4zzXj7vvaQx6dWk/eqcNvYn/rIkF7I7Sps5scOLuCbGZmtdrOWc7xD5/e4ZY7pY60l6m/yrtQf+
	gmmQSlpC47ftg6rTdowNJQDfeaaqOnEe6I8Kz1G4kDIGb9bQnEsTvAkCtw9dNDy3O+rt3Lw4jCp
	Ms=
X-Received: by 2002:a05:6122:4f84:b0:5c9:a60d:3278 with SMTP id 71dfb90a1353d-5e91f4d0880mr1648232e0c.12.1791642425058;
        Sat, 10 Oct 2026 07:27:05 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb292a5sm3982216e0c.7.2026.10.10.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:27:04 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Faqiang Zhu <faqiang.zhu@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
Date: Sat, 10 Oct 2026 11:26:29 -0300
Message-ID: <20261010142650.2664739-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
References: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 03:58:35PM +0800, Kuen-Han Tsai wrote:
> Replace the composite.h logging macros in u_ether.c with the standard
> netdev_*() helpers. Because dev->net remains valid for the entire
> lifetime of struct eth_dev and netdev_printk() natively handles
> unparented network devices [...]

Confirmed against mainline. The DBG()/VDBG()/ERROR()/INFO() macros in
<linux/usb/composite.h> expand to dev_*(&(d)->gadget->dev, ...), so each
use in u_ether.c dereferences dev->gadget; once unbind clears it, logging
on the surviving net_device faults, as in the eth_stop() path you show.

The conversion is complete and safe. u_ether.c has 26 such macro uses (18
DBG, 3 VDBG, 1 ERROR, 4 INFO; no WARNING), and the patch converts all 26
one-to-one to the matching netdev_*(dev->net, ...). dev->net is the
net_device whose private area holds the eth_dev (netdev_priv); it is set
at creation and freed together with it via free_netdev(), so it is valid
wherever dev is. The remaining &g->dev logging in the setup paths uses
the local gadget argument, and the dev->gadget->dev access in
eth_get_drvinfo() is not a logging macro and is outside this change's
scope, so nothing is left logging through a stale dev->gadget.

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
