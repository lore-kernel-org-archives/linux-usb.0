Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBD2DB7BE
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513680; cv=none; b=CGNNesyAZFXYh7OEA3Dti2WObM8tbP0m2hnSL1t23c7jbSrd+6l6GEo/RdaQ4HecYr6bg31TJrNTtqu8jkQmJ4rY+R452u4dvsjibw2XSNUBxVge7EcSTEpg74LLk2ek0zriSn6f9+lp+gdrXobRCJS9ios50Ie6jfWpz0SeMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513680; c=relaxed/simple;
	bh=3ubcLCcyt8+VvZfAFT0yrgNoMjVrniCRUSXMbUphHPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTvCMU0dwmxH1UMWmFk+G6HhBIXByivlDnWGMGewpQ0L19rM8IMLK9VJ/NxWkGCLO7e7f247zjmBra6OPu0822DNcG6u/8PSZmcFn78gh+qS5PIeRh5zMwVoWhz9faqppoVIiquFdBscIxbieM220goaWyCNWB8WRNsO5Wjw2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnJSGlYg; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnJSGlYg"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3515f9a5d25so2015867eec.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 19:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513678; x=1792118478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTsktpTllALq6EwdHtFSoFwjaEzOVxy2nJk/AnvaP7c=;
        b=TnJSGlYgGvZ/r5OMmtbIsrqM9moQCvrPxarrTkch5lvSp03bRG2PW8n8YnkQiIFtok
         87El//GIeWkht1VYr+pvUMhPrpxw5+Js463AL6dHdZMuxUannXvg/1leLHN6IbrK8C4q
         mH1bi03XoIpzPwTCZ4zf/Ijo4u6hSRZiMDoqAtUMv+EHOmgaiJbd8YuT24khRPuRWGwq
         YxhumnotMAhpmOa/OE4A20uYK/H23nh0Diu0JkhAGSAZ8AasvWWhxdRMjosnr2VhOtxj
         QwiYm51XYHQ8g420Fn0qtRBVPOHeqRgVkVmPwp0ev6ekS/H5mmvSZVO2stA8jy7qVv7x
         um2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513678; x=1792118478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTsktpTllALq6EwdHtFSoFwjaEzOVxy2nJk/AnvaP7c=;
        b=RUu5LKG69GRBWrLk98LXbCwTC0VmRfa0ZUVdBez79j3S6x0Sdp4YcSF9nhFI8RwuG2
         u88aTTaun5AMI2+aw5JAkwXqZhxMpmq4F7KAL8fH2YbMjzgaUoyr8A+lOGFKPJ6WIEqd
         0RtI0Ne2mJqWG1dN2p6Yma488uSuBGnrq5yzX32tqxwNa46BX2sC+wZ+L1TtD+N2h27s
         PTjsoXr0BT7QGjS4eLeEMKemO1yE0pCq5dCHh4ez/P4cCK6ngYEivMMNglvCm2yGlPye
         yWI0Yn3LEGedWMYYL+h5PyfdKXPfvMpRVEGoDaEJ5yhXx6lRKwanz/SQ/qKRDZqqK/t8
         VkLw==
X-Forwarded-Encrypted: i=1; AKwUvBxPQURzLoLpViObj/r0KM4gv7jAKx4Ts+oiyJVEmX4r9QfSP5wVspVkxOlyJw2G6dJEBcVniIv/7Hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3hMLOeRiKpDGdCkn5CX8avbcHb2wBBv/MZFdIPTIkR4ZPjZrX
	vhNVqGr80ZSOrfdSj6Tkd4ZgZ9CrJ+HuiKaKrALieLAjruMsvd7EkmCW
X-Gm-Gg: AYBFou2htj86FpIEYY+O2HtlZYo0/rVJXwTS7WU9rC9F3TnJiqfA9HmtJEHhW+KrkZR
	XMpybnzGCrWHYTK6kTnRGF5GAuTydwKAc9p9D1162bbHTbrgchDhPgPR5KmkxegbDNZWpcwaPBD
	ct68SaScA/KRh76qONoXwdE2DGy0+9kTsbbYh1sGR/2CgljIHp4MfuUD+svW5flcFsf5mlhqu9L
	w8LbMiPOhmjVCGgLzAz1l4A0Fy54Sy/UbL2fMuBRI5yK6TgO7iNLyC4SG6GcwUFC75ypdbZYyEb
	v71ILJ8B0EWwNFx0C5mxDQmpoVxswcGLbFXxXIxx0YPI47Q/t5A5IXl9zAGIX4R3sTJkUvJR8H5
	4KOoBS3z6gDNsV+gUJ7sY9o0vdzoU/WASjNpwDIdtYlbOp2S9KKW7TZ7NUED36hbO/SF+oWwQqs
	nv7vLxcH9IdomUDkvVm0oIQtJq1Z8WM7QIc5Uw6lu6oh02NPw+EjhVEmMt95u/uaQutJTJFGE9w
	SxiLIE/
X-Received: by 2002:a05:7300:ce94:b0:351:6b27:d67d with SMTP id 5a478bee46e88-3537e04925fmr988070eec.30.1791513677882;
        Thu, 08 Oct 2026 19:41:17 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cad9e53sm2343328eec.22.2026.10.08.19.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:41:17 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	alifm@linux.ibm.com,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [PATCH v2 2/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu,  8 Oct 2026 23:41:04 -0300
Message-ID: <20261009024104.14995-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008225825.GA936610@bhelgaas>
References: <20261008225825.GA936610@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Thanks for the review, and for suggesting a simpler way to do this.

On Thu, Oct 08, 2026 at 05:58:25PM -0500, Bjorn Helgaas wrote:
> Apparently this is a reproducible issue on MacBookPro14,3.  That makes
> me a little hesitant because we're not actually dealing with the fact
> that the Thunderbolt controller isn't responsive during suspend.
>
> It seems worthwhile to me to skip pci_save_state() if the device isn't
> accessible, but I don't think it's a real solution to whatever is
> going on with Thunderbolt, and I don't think we should mention it here
> as though it is.

You're right that this patch doesn't fix the Thunderbolt problem
itself; that is what the Alpine Ridge quirk is for.  This patch only
makes sure that, when a device stops responding, the PCI core doesn't
save garbage and write it back later.  I'll rewrite the commit message
in v3 to say just that, and mention the MacBook only as the machine
where I found it.

> Maybe we should remove the check in pci_dev_save_and_disable() and
> make it check the return value of pci_save_state()?  I don't think
> checking twice adds anything.

Yes, I'll change it that way in v3.  While looking at it I found one
small corner case worth mentioning: pci_save_state() can also fail when
the kernel couldn't allocate memory for part of the saved state, back
when the device was first found.  The device itself works fine then,
but with this change the reset would no longer disable it first.  It is
very unlikely to happen, so I don't think it matters much, but if you
prefer, I can make the reset stop only when the device isn't
responding.

> I bet we get 99% of the usefulness here by just adding the first
> accessibility check above.
>
> This second check only helps if the device becomes inaccessible during
> the tiny window while we're saving its state, and I'm not sure that
> the extra complexity here and being able to restore a valid config
> header with junk in the capabilities is really a benefit.

I'll drop it in v3, so pci_save_state() goes back to what it was, plus
the one check at the start.

I also wanted to see how your version behaves before sending it, so I
built it and tested it on the MacBook today.  It went through four
suspend/resume cycles, three of them with a USB disk attached, with no
warnings, and it skipped the controller that wasn't responding, just
like v2 did.  I also reset a USB controller by hand to try the
pci_dev_save_and_disable() change, and that worked as before too.

Thanks again,
Francisco
