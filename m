Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760630;
	b=1JgCxLJHXiafs03DSgj4ECylfc4TCrpI02ND79toSskT1xePXewKe8VyUMSwD82INQ/0
	 0ggQq0N2UWXxRQAed4yiaqub/PEGPp3xpMPFW5RaAI6/ADQozTjqQN2X750X0/SexdttJ
	 UpVtnJ+TYE3Q8+eeUAgOhMqd25CaNJzZYEjSYvRwUcb/KIc1uzYcMmRUEll9B9QDV9oRV
	 ykBcoX5l61GnZpRDLQAYW6a4h8mBK2K5khq3a9pwBN0qBMNiUqmvnGS9KxKCiygRoWivl
	 YcRsuRk4vU9kOP4xROt90yAutdbb0NlobIvMka3KtaQAvcKSszoPKV7P5m5dF5fHogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
	b=nD7bKtQ0UMNFBoj3Wz6JqvY3L03oGl2rk2SkEptHZ4ZDedzAgZ60XEHOm0U4LTZVbfHL
	 YRSqqULzNjKIenv90iEVOZZ11LckDayqIWzE7ijjQePKtIE06yFhod/W6wI44tClhDdIt
	 eRBkU3cklexkfqox7rOOK0NsjFN4awEmND0VCkbF79iUqaavZNJdBK7uY+2+e/0y4lQri
	 YtJQy3m0IOmQHD1YV01z5YW2b+DWBGFM2UavR08nijXTsMix+5ktpad15ZoQJW7LDA8yr
	 C7Qbe6bFLEccUYACs1yLSUe/rYDb0W0+oLl6pTU32+MCaWTrV+jSdzz9dgGUw4zC5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0bTNG2g;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC9606A31D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 16:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BC9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0bTNG2g
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so3495704c88.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760629; x=1795365429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
        b=H0bTNG2gDEZzAHPBlDa4XrlwRON3ziZuDLgNS28y1qY3cMeouwQsKxEGewtaSGsGUP
         Jc5HVB1F1HK69nBIamv5eylgtZV63Gis5A9eocEGVQDT/MdW+8ZJryjpyPuuMQBRJDaT
         sLTrYgAUw3P2yYFSfI560buiWco5gI3pAzGZw8HL5plcABzVE1KMhPMtZv+TeP5/Hp/+
         dvvU1krvM/NqXCoy5N0vyqMrOfwOfv9gUr5JMjM+2DIIUGRM/BDepGexKNGHkeTBCcCZ
         nRUP9dot7y4diFLLTiCZs01tmRtnX332puMZ+wNvh/coAKCYLjo812p9gNmUtqD7Tm+5
         Md+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760629; x=1795365429;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
        b=Dwc0Z67T9Ez2M7r1NMV1mFl1x2F2AP1D0BJMKH6ocqhwLc4rz6ivJXhkad1o9/T68u
         wHwBq433/V0HPCut/w+omf4JXNFX/gFZclSLQaRvfrVMNONz+1zNaGTorlOZIzOgTsGs
         I1M6mha9s1DM3RYzM5t9/lr7l+u4EjSHlyKjA6c/VHK+0NMkRtlpbGT9aP4O+gXCBlS0
         L97LJdlN4b8QP+8mRCEhA+kkATIWayfAVciVk+Y+uWNr5mc0STarXEFE87zP2Tt6GBzg
         HtTmJKiLaQG/LynXlZJ15ypE/IS4ohSeLL8gGDJHyvVcKKup/eS3d8y299wA4kEndxg3
         ZZ8w==
X-Forwarded-Encrypted: i=1; AL+hErFBffMmdyPigCcD8ncI3nSZX4XpS+F5iGF/0jakJKd0eyG6y0ahawd5XvWnl1/ySh1nERSJEfJ3dNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BckFwZ6g3D9jYjjw2Hg+rhPhodlom8P3jAWla3ge9ihR3krd6
	AgQaZttKOnj2DY1aQi67xPyzNZU2HTnSA2QY1eLGB8umTMwOmY2+MJ0K
X-Gm-Gg: AYBFou3PLx1bCFotm85CZhizYG+4AXJE8lGgjoO71HAdWfeIu8peCrGnWe5BxUHdh/Z
	/xT7b6DAIOJLgfgb9LbMli8+g0LcRsLnxesNngkUnv2ZmgKMkVbS8VegYYw1MWLxETlorSnVH4B
	8xvG91599DbdesRvuljwaAeX86Vhms3l9m3R4w00JWdLM4ZcK+BsyUga4LaxUS0U65qFKrKJvF1
	OX0joL/fCIdQSdIJ2KtlJe3dMmBDu/+ZNax9zTdt1oYT8AemSyEz+zgArCBjvG9wGY1fnmr6Cg/
	WYoEb67GDQ/AwHptCh962HvCPpgdmQnUBcd7wOXKk+0IoeplhEku8baPWHuZ2ob+6FRYL2uxCe4
	FgTTTgb77UPUH87JhnR7Gh9mGGk5v8PTLXUh/oz1EPCksoEXG1ax3egznf9WbuWya6QZV2W1C5t
	ed4KrzBS6GwjuQeVUZWVFYLpyJvOZriqASG7hmtOnlNv2RuBoy1x9qdwQbaKlWNjcaUDSVRl5+0
	+ckADUzqIG//6JMFTYf/gJD8eC0JGfCzE/1Y/YWpCoOMEiLg5exp0xpMzayrWarMo1nwQadeR3C
	fS1pg+NcooSu1tRo/mdY7OaFZgQ+GxEUI/DnvSYKvzm1fUmByPe2KzgM8Y3rtiRHDyhm
X-Received: by 2002:a05:7022:b0c4:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5030f291fmr6853776c88.18.1794760629009;
        Sun, 15 Nov 2026 08:37:09 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm24178729c88.11.2026.11.15.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:08 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: core: wBytesPerInterval checked with unsanitized bMaxBurst
Date: Sun, 15 Nov 2026 08:37:01 -0800
Message-Id: <20261115163701.226491-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Alan,

I hit a corner case in usb_parse_ss_endpoint_companion(). It needs a
SuperSpeed device with an invalid bMaxBurst or Mult, so it may not be
worth fixing.

usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
wBytesPerInterval check from the original descriptor. The stored
wBytesPerInterval can then be larger than the clamped endpoint can
carry.

With wMaxPacketSize=1024, bMaxBurst=16, Mult=1 and
wBytesPerInterval=65535, bMaxBurst becomes 15 but wBytesPerInterval
is set to 17408 instead of 16384. usb_submit_urb() uses the clamped
values and rejects isoc frames above 16384, while
usb_endpoint_max_periodic_payload() returns 17408, which xHCI also
uses as the Max ESIT Payload.

On v7.3 with a virtual SuperSpeed device over USB/IP, the kernel
logged "setting to 17408", and 16385- and 17000-byte isoc frames
failed with -EMSGSIZE. I only tested the bMaxBurst case; the Mult
case follows from the same code. The code is unchanged in
next-20261113.

Using ep->ss_ep_comp in the max_tx calculation fixes it:

  -		max_tx = (desc->bMaxBurst + 1) *
  -			(USB_SS_MULT(desc->bmAttributes)) *
  +		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
  +			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
   			usb_endpoint_maxp(&ep->desc);
   	else if (usb_endpoint_xfer_int(&ep->desc))
   		max_tx = usb_endpoint_maxp(&ep->desc) *
  -			(desc->bMaxBurst + 1);
  +			(ep->ss_ep_comp.bMaxBurst + 1);

I can send a patch if you want one.

Thanks,
Cheng Yongkang
