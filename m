Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54AA372B25
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226433; cv=pass; b=RIajxaKO/eoAw+CwyaVuoebS6/LbO+wNMlxQFm2ypuGjmXWZjWKIH0iRzfTeEhofAKbdtKNc3w1L+BosEp1RfvVClvZ02CPcKJpqWZoFxLyCb3l6zbUCIzdy2tnr+kbcnKq/d9wPhuHzHmfyI2fvCcmAGKvmCJY8HsBrmpuA4QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226433; c=relaxed/simple;
	bh=g+RcRL2Y1aCrncAQ9muyp63uPoOQsIrI9mS9L9ufMMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daSoaKlnkwMId77IB8TZMP7IIskLD5d6mNqxIWk00vwd+bytH6rPBM8GyZBBZY2Zlxhu/jvkyYB2PyJe88a3acs/PET6fduvhe32AJwFV0m5CUTBDE06xLb0ilpFym77l9RGBhOru7LuAqFkTRIAu64FSMvQq3R3J1NOf4NYVZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcP0XnL8; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcP0XnL8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso3083736a12.2
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 04:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780226430; cv=none;
        d=google.com; s=arc-20240605;
        b=TumzyUZM/UAG2DvLcuCrzAWrqskN6T0ifiwuq5HXj3s4qElTxalX+TB5IdwfKjT0tg
         JEHT1GV7Ba77VR++n3l0fyBoR18b89NfZInjF+J9r+lPZN2XvqOzIlvjjIrHU5CtbBGG
         i9EcTEUZ8CI64sZDtIJ7Oo3YAfm8VwXBdOnWgn3DzCRyTkG8LPyWMdI0DlxqmiwYOq7B
         dzLYK8Q+WqHn/zSNmS05O9MJxLofEhFFVcZQN6eky1WCQmd4BQVPARrjEZ7HhN9l3U9W
         LO8pTvk0RBQ9fKnrye334gFUkhMMAY6YdMk4s/c9459/pJ4hEOPSwsecCaadQH8+rD12
         avrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g+RcRL2Y1aCrncAQ9muyp63uPoOQsIrI9mS9L9ufMMg=;
        fh=0g9ROlWvuhx3ZbXw65ftZjGUX3Z+GfUoHpMd3SEEz2Y=;
        b=ZAYgLbKiUoQGKbBZt5jyyLWGzZTZ0dxcxMB3pIo1kf/MsFr9P6U8KAGxR71HlNDWtu
         cewwhjS8pmPd5Rq4g2eIpqh+P/kgp6EEqPRDGNdvrnQU/YUhlyZLXgz5GSgGCyypmjes
         uRGJgOcdS51cPewClNPkjvSdc442oQ9/tyHaqgt7I8EZZVt41rf188pu2OaP7zVQUgOn
         AImYkFtprZpBk9eHUVR3WxDxFsXMA9KnrnbwUNWbQ/ESz8p62Fgq9HKKVL2PEnvDQay1
         HRhs2A7CnjiOoSseW8QOJHE8q2RxDffipFcrTVc2g2xc7Ss3uUi/c9Z8WXVkZN4mZjBX
         FXRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780226430; x=1780831230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+RcRL2Y1aCrncAQ9muyp63uPoOQsIrI9mS9L9ufMMg=;
        b=KcP0XnL86Gt2GKgYw9YefaiVOd5LXSwPGPG9pzU3Qon4flO5G6l6cKLhihuybFB+eA
         QA3w0LliFXsqeASBod/CHxutlk//qS+uzbIKW3IFBi2Y8EQdavykwJtAJrh5+Mx+m5N8
         Odlm+veQx3MRbmtrFbQR3gINgJbBjlSBOAlqH70MfABtag4fUubzjX7i3OUefQapVNBz
         WeQLaffzht3jxowqhA7O9RjakKV/mDoZBiytkJdNGuvvpJoR3JYCWyvGeg9xrpNd3nrg
         tEjAndZZcSB+QdcEfOL/o3vg1OaHWkQGDY6+SwZkXvGDH6f0wKTGYoF+gWML9RDa93pm
         8u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780226430; x=1780831230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+RcRL2Y1aCrncAQ9muyp63uPoOQsIrI9mS9L9ufMMg=;
        b=JczhJb1aC9O8i6m+T2zFT4n1AqC6O/cSdqN0tArLsAagUx4cSPEYrHpsiTmTs1ZNtP
         Vp8Zh57NATWnjKEuCY3zdSWuzkdBz/sJe1HhgaZqX2Q5m+sD+zxPNRunHBfChqcJ3eEH
         5Aoi0s/8TVnJj5R+WNwCmKmGQRh1FynOpSIW8GHnAgOjzzg9Y3efASeooQanSVvMBp2P
         QWFNzwIAtfMbrzUx4gdY+AM7XjXLGmkg45PsNutvkR3lIgu1cw8SG04bLbQbN8ZDSCYa
         ObW30E4Ch84IVlgfLcpzUSQzLFyIlXhfDU5/HtSj5Nshc0YwMaG28HIXdCSyH1VXbiMa
         NqQA==
X-Gm-Message-State: AOJu0YzhervIJpFlMaG8tRGwDEl9IlHZA0WAa50JyvpURXGoQABK6IiM
	dxrPy1SGw/VFQIC9FXktxQdDJ8H+dS5QX5uHlh2jiBwrVM5g9sGyEtfJB5JcepACX5gKWRRh9Tu
	T9aEAlC0oAd2c+zAB2mqqfISTELSXR2A=
X-Gm-Gg: Acq92OHbe7Q+aTfL/mXyt5LJII5id0RDZMrBZESq10bI9FjDgm6VgQFN2br5ZP92sxR
	+exfRckgeEbcuAIH2/WFRfpqtyzx3aF3GodUyHhVUF0CYhyiCTHlNnXkY+EhmpxdckJgeHONJ/8
	rwplak1ez5tos0/7VcZbtwcs2AX04al7uj/U5RY4fpgo+J5FQ1OUANP4UfKPFuYMCA+1B+T4YwL
	sGFJ1n4OR1huegMkRvglvb4CKLtJe8K8hdUg9PBBMxQdmwmlsmHGESm4oUl93ayaa9YSChUHij+
	4vYWG6ekvwz/QQ5OIw==
X-Received: by 2002:a17:907:270f:b0:bed:25a6:1c89 with SMTP id
 a640c23a62f3a-bed25a61d08mr18230266b.25.1780226429835; Sun, 31 May 2026
 04:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com> <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
In-Reply-To: <20260531123843.736bd69a.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 31 May 2026 16:50:17 +0530
X-Gm-Features: AVHnY4JyxPF6_SzpowO1ngh2fLsPa52m0GfpIpt30w1o0y11S2JFT7NApkl0QJs
Message-ID: <CAFgddhL8_q0D43r3KG3vV5jCagmXcMZJcbjACjFr5+6c7LNigg@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com, 
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org, 
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com, 
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, 
	oneukum@suse.com, stern@rowland.harvard.edu, bence98@sch.bme.hu, 
	eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"

> What about xHCI vs EHCI?

I don't know how to test that. I couldn't find any BIOS settings
related to USB controllers on my laptop. There used to be an advanced
BIOS menu which revealed a lot more configuration options, but my
laptop vendor has unfortunately disabled or hidden it.
Previously it used to be activated by a combination of key presses,
but now they no longer work. I tried disabling xhci_hcd module but
`rmmod` didn't let me because it was a builtin module. My kernel has
been compiled with the following:
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PCI=y
CONFIG_USB_XHCI_PCI_RENESAS=m
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_XHCI_SIDEBAND=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_FSL=m
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_ROLES_INTEL_XHCI=m

> So I don't know what's true anymore. Running Windows under a Linux host
> with individual device passthrough (e.g. qemu) could show what really
> happens.

The trace is exactly the same. wLength is not 255. no additional
packets. one-to-one replication (which was expected since it was a PCI
passthrough, so...). And I can't utilize the normal usb device
passthrough (or i think it's more of a redirection instead of complete
passthrough) either since the vid:pid pair is different after a failed
enumeration. The device doesn't initialize in xinput mode, so QEMU
doesn't even grab it. If I redirect the Android mode vid:pid, the
device stays in that mode on Windows as well.

Thanks,
Nikhil Solanke
