Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9143B7B93
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353833; cv=none; b=cUEODgXmyhAMI27k2oMXIHSIg2pzcsaGPxguowtwJp9zTInbWA+LFqf15BGHF04wzsUQ6EG0/Y0+rKYErRc797rGDDY1ZoNqcjtGN0JMSRXUNOT9nlswsI+4prv0bDMpXRGYJ2N1l3VcM91GMv97fFO8ZXKwkvRl9CAlbd+BB5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353833; c=relaxed/simple;
	bh=FMVBf42bu9ZcwAU4JltUnn/4rFYpbeK57gVlU3IN/Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+/nvArPKbqwQ3nhvazAEvrTc5fWU/5IRk55BSb/DQpfpYZfTdRQSHIL2UjaWe4FjlSpnn43TWrf0MX+3eq1dIM/WliEfZGqAJy4kNI902W+Pd9DxqE1IUoDnTnVAlaRV4f61XcdnldSY4k2oYf+/EHAm7F0ZoziYyzz1+s6Acw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=Y6CHvpLk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="Y6CHvpLk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so13389035ad.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785353828; x=1785958628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Wgddc3eVWviNDs8BRQMeEykT7lG0J2SpOpEN2bytoM=;
        b=Y6CHvpLkNz48gRMOZ9ygelEjIeEpW6Q/jAGEWiEqqXmE2bTAmxvvnRMBAKSEOqbY18
         nAGfoELU+FmZp3VloXRb02g7kdRqndu+VzhrElaycVqJfX8uPlqtB17l126TmcMjzdaK
         JJOdTrTSPrtomGMJblwc2+3uagRuW8aQGe34jgnnstHw296Wlud/f7bpnqUssw31heTG
         CiuyKFwV4jji7jSH0xxu5GtGg+/JkZGmCTyrjVp7cN27cBF0VYeNtjtHqwpdrAc6y4tZ
         xyzY886AK7kcaBFYVouq8Uqwx38l5m3QMZbnoCr5Bt3D0gpTB8g3B42hbtKBAD5R9Kfo
         mZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785353828; x=1785958628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Wgddc3eVWviNDs8BRQMeEykT7lG0J2SpOpEN2bytoM=;
        b=l3hENsQ5JM7XhfjElkoST2lh7fyF33HrgctoyLVNp8CePuwqFlItRSja7k2ILB15mJ
         kOqFU5g4l8NZTD7xTNMSXDWi2V6inz+1vvgJcyRun2XWoJv92SkDhWq8ah1urNEA/Oi6
         eh6ulpubWxAT1ii0xHM3b5iGFTww0ekmFbxZnbHtyeoXtWmhsxrOV1xpFk5KmBDtebWR
         iBoUt9eelH8euSymdarPEkNrOF+rdGklmgWACh7qjAR3HnpWnVRic6TSoOUFDI8FhBnb
         xDX3t9lWihpmxVMphY/xGry7o/TQWV2aIzvZvltruuOtDzFh4liPWpMuIMBXIBRgRJcr
         Mu7g==
X-Gm-Message-State: AOJu0Yz9ZsE1QGvyaJU1nwdk+7OuAn0iaBG2idqvfbZnTpfDAXBjuOFp
	Uqy8HKrA8zroP5d7/OImRlWJ/3IbbPwo7SfKCLXyOmcmvJRdyL5uGwLhav6trn+YzV5Z+hGAY3t
	2qEOXtp8=
X-Gm-Gg: AR+sD13Yc17zibXYqW3L8Kz6zbqDS5RM0phjd3I2sJqmzT0r76WdPf6ezS4YiJX+TfJ
	S5tBBZmL1a8+GEub0VxJEuiog4361yu4N13GqJmMrFM08BmZzhXoG1YtOsjc6L69Aa7ajOsau5D
	7qLy7vZ3jKmOwrRRvojpbewfjOZFbeuQ8rtHC3uQPnesnAYHZKqbc9LaS1ruoYBpWIzoLSXwedZ
	V0UpnK1VRE52y1gBzhIF4Y0/fC+dAJqljnSRQqj7A9ikN9jSvEf1+eiWDdMY5CgPiWz8EG5hpPB
	6TW3UOVovPI33G3nLvbddA3+WdLWuQB33JNNIA440YbggyKxlw8VzYQVNzsVSFC4D0qcb6VfuqZ
	Td3rgRUk3HXv8oARybryuBmlPvoGNXlvyGw+d7TJs+B7JUUkqDe93cMs0SRXdDm4VJxwZCofu9t
	mPzM8ZzE2n9PKh5nYle8pXs/+PIQ0XS5tj5lphagncDt4GsKhsLUfUZmN5jEUHkDcP/mefAqwtK
	PiQHDCi2aqlXCwlO06CjOu2ahoYrveNfAVYbe2GbvzuUSg=
X-Received: by 2002:a17:903:903:b0:2cb:2b84:f431 with SMTP id d9443c01a7336-2d0341bfd88mr1609225ad.47.1785353828223;
        Wed, 29 Jul 2026 12:37:08 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:82ac:c704:2aec:acaf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a466a9sm15908045ad.22.2026.07.29.12.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 12:37:04 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:37:01 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <ampPGn-3C9PSEZQz@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <20260723081440.0228c59e.michal.pecio@gmail.com>
 <amJ9jAtK8rNWDO7V@spiral>
 <amKUdIRBrsFiDTiV@spiral>
 <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral>
 <20260728003131.085171ee.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728003131.085171ee.michal.pecio@gmail.com>

At 2026-07-28 00:31:31 +0200, Michal Pecio wrote:
> Let's see if the attached patch fixes it, it will print BAILING OUT each
> time the failure would otherwise happen and it should prevent failures.
> 
> I think the problem occurs when a Short Packet event is generated for
> the first TRB of a two-TRB TD. The TD is completed and later a Missed
> Service Error event erronously points to the second TRB of the same TD.
> The driver can't identify this TD (it's gone) and goes nuts.
> 
> I can't explain why we aren't getting a second Short Packet for the
> second TRB before we get MSE. Your HW does generate Short Packet for
> both TRBs in other similar cases visible in this event ring dump.
> 
> I suspect that all those non-zero ep_trb_dma in MSE events are more or
> less bogus on your hardware, although obviously not all of them are
> instances of the aforementioned bug, because then the driver would
> malfunction on every such event, and we have seen that it doesn't. But
> let's start with testing if my guess is anywhere close to correct...

I think it is!

I didn't seem to have the "before" blobs your patch indicates in my
repo and it didn't want to apply where I was (at the first failing
commit) so I went to 6.18.28 and applied your patch there.

I just tested for 8 or 9 minutes with heavy load and got the "bailing
out" message 5 times, but capture was still continuing.

The log around the first "bailing out" is like this (it's more noisy
on these later commits; lots of "spurious event" messages):

    [  340.406954] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  340.420612] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7110, comp_code 13 after 13
    [  340.420860] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7140, comp_code 13 after 13
    [  340.421110] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7170, comp_code 13 after 13
    [  340.421360] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea71a0, comp_code 13 after 13
    [  340.422956] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  340.437113] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7d70, comp_code 13 after 13
    [  340.437359] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7da0, comp_code 13 after 13
    [  340.437610] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7dd0, comp_code 13 after 13
    [  340.437860] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7e00, comp_code 13 after 13
    [  340.438110] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7e30, comp_code 13 after 13
    [  340.438359] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7e60, comp_code 13 after 13
    [  340.438609] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7e90, comp_code 13 after 13
    [  340.438861] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7ec0, comp_code 13 after 13
    [  340.438881] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  340.443735] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 10aea6260 td_dma 10aea6270, set skip flag
    [  340.443740] xhci_hcd 0000:00:14.0: Event 23 for old TD end DMA 10aea6260 after 7us
    [  340.443743] xhci_hcd 0000:00:14.0: BAILING OUT
    [  340.443858] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
    [  340.443861] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
    [  340.444110] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 7 ep 2.
    [  340.444113] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea62c0, comp_code 13 after 13
    [  340.444360] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea62f0, comp_code 13 after 13
    [  340.444609] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6320, comp_code 13 after 13
    [  340.444860] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6350, comp_code 13 after 13
    [  340.446954] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  340.446957] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  340.454953] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  340.455109] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b00, comp_code 13 after 13
    [  340.455359] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b30, comp_code 13 after 13
    [  340.455609] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b60, comp_code 13 after 13
    [  340.455860] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b90, comp_code 13 after 13
    [  340.471423] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7740, comp_code 13 after 13
    [  340.471609] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7770, comp_code 13 after 13
    [  340.471860] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea77a0, comp_code 13 after 13
    [  340.472110] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea77d0, comp_code 13 after 13
    [  340.472360] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7800, comp_code 13 after 13
    [  340.474951] uvcvideo 2-6.1:1.0: Frame complete (EOF found)

Missed service interval messages do not always lead to a "bailing out"
message, like this example:

    [  183.316597] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  183.316821] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7dd0, comp_code 13 after 13
    [  183.317073] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7e00, comp_code 13 after 13
    [  183.331200] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6880, set skip flag
    [  183.331206] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6880, set skip flag
    [  183.331208] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6880, set skip flag
    [  183.331447] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 7 ep 2.
    [  183.331449] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea68f0, comp_code 13 after 13
    [  183.331697] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6920, comp_code 13 after 13
    [  183.331946] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6950, comp_code 13 after 13
    [  183.332198] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6980, comp_code 13 after 13
    [  183.332552] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  183.332555] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  183.332556] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  183.333198] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6a40, comp_code 13 after 13
    [  183.333448] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6a70, comp_code 13 after 13
    [  183.333697] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6aa0, comp_code 13 after 13
    [  183.333948] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6ad0, comp_code 13 after 13
    [  183.334197] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b00, comp_code 13 after 13
    [  183.336539] uvcvideo 2-6.1:1.0: Frame complete (EOF found)

Or this much longer one:

    [  199.936170] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  199.949829] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea69e0, comp_code 13 after 13
    [  199.950076] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6a10, comp_code 13 after 13
    [  199.950326] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6a40, comp_code 13 after 13
    [  199.950575] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6a70, comp_code 13 after 13
    [  199.950825] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6aa0, comp_code 13 after 13
    [  199.951076] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6ad0, comp_code 13 after 13
    [  199.951326] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b00, comp_code 13 after 13
    [  199.951575] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6b30, comp_code 13 after 13
    [  199.952170] uvcvideo 2-6.1:1.0: Frame complete (EOF found)
    [  199.965952] xhci_hcd 0000:00:14.0: Transfer error for slot 7 ep 2 on endpoint
    [  199.966075] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966078] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966080] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966082] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966083] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966085] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966087] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966089] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966090] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966092] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966094] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966096] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966097] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966099] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966101] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966102] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966104] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966106] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966107] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966109] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966111] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966112] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966114] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966116] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966117] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966119] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966121] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966122] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966124] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea7370, set skip flag
    [  199.966327] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 7 ep 2.
    [  199.966329] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7650, comp_code 13 after 13
    [  199.966348] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-71)
    [  199.966350] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966352] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966353] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966354] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966355] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966357] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966358] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966359] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966360] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966362] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966363] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966364] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966365] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.966576] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7680, comp_code 13 after 13
    [  199.966825] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea76b0, comp_code 13 after 13
    [  199.967075] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea76e0, comp_code 13 after 13
    [  199.968161] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968163] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968164] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968165] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968167] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968168] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968169] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968170] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968172] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968173] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968174] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968176] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968177] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968178] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968179] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.968181] uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
    [  199.971079] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea79e0, comp_code 13 after 13
    [  199.971325] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7a10, comp_code 13 after 13
    [  199.971575] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7a40, comp_code 13 after 13
    [  199.971825] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7a70, comp_code 13 after 13
    [  199.972076] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7aa0, comp_code 13 after 13
    [  199.972102] uvcvideo 2-6.1:1.0: Frame complete (EOF found)

But if I understand correctly these are the same as the cases I had
before which did *not* freeze the camera, and the patch hasn't touched
cases like those.

If the full log would be useful I can provide it, but it's much larger
this time with all the "spurious event" messages. If you do want it
please tell me whether it's OK to gzip and attach (a little over a
megabyte) or if there's some other preferred way to send it.

Would those moments where it reports "bailing out" have been freezes
before? Or not necessarily -- should I be running the test for longer?

If this indicates a fix (looks like it to me but I don't pretend to
fully understand all your explanation; sorry!) then thank you very
much, and I'll be interested in following a patch on its journey to
being merged into the kernel; please do CC me on that when the time
comes!

Otherwise, please let me know how I can help further.

Thanks.
