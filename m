Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9735F5E3
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 22:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787091286; cv=none; b=Cw+qICgOgDGapIxEbpvSoXGe32jAo6EOxQORgK7F/+xbL4XTJplqL2TGBBcDbyFHMnwMvfw2En/uVma+iU15zwWZOHHoOFeMYVawbPm/34IcMC9xoi07IYRjOAhpASTDyzcpMNbhEwppkzw8NEYC3NM5imRFpTLUIeKOKSCrwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787091286; c=relaxed/simple;
	bh=+/H+wBy1+ETyZpr5acESYNGEUWdWsdU4YXrENI7QCgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWiIP1KLIr5pGZx8k101oxR94VBbhUGFIxYuZ9cAPSBiPzdB15RBfnpTwnb5BuFd0lzL5KiTEarEN5/y0K4xcyUuES+9U1A0OoN7SZNpCbHqJARMSTWLSkQtyrMfRSU4Ph9K3fFQtd0Wv9P2yudprHO23MnM1W6A+JjJvT5uyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuY9p5Zj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuY9p5Zj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fd4531020so177501f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787091283; x=1787696083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efM3F+wFbP0mAVU02OW9oAVJkwM8FLNE+I19WeQALlE=;
        b=HuY9p5Zj23pcNkb9huJiePbYawpN0OU3jt9HT7QCfyGaB+I0V7Buy19La+pBAVqBDM
         eyrkwrePD1b3mo8AC9y9WBweVs/2Hz5LOQOEBD0eOTKZwZ9qKfCKGiz12M0qrpjFZIBq
         hxQylH0GyBH1IAwDz0AtmTDg1w+re60HDL3AsKs8qj/ERH7yKqAfW5K4mVT5bwro3cYi
         bT24+QtnvFuJzmzZ8dp879zAW7tXxiL8dfcSxDZ5Pw4/r1pZD1OeJiQvx8wuxDVTwfr9
         sKAfqg6Dg+o2OFx+tHifLwxCvneyAom554txle2iwtaviSb5mRIlHAvoqPKk2Vmmrfjf
         sWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787091283; x=1787696083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efM3F+wFbP0mAVU02OW9oAVJkwM8FLNE+I19WeQALlE=;
        b=OMlhZLctJe2KhYZkZDWXePnOl/OZ40jwux/1yefUariFDls7p5UKHFkpZBXsK4Fkwu
         9mhCwom/X4hVqIhEz8oGfDTk3tCtKwweF2LsiptQ/WOkShnfLuvF4d3/LazfsL9vYHHW
         NlqKVMSJBN2M+eT2Vm9vr3kw/YREE+OLdH6zI7pWt6HsBJNFUUj28EgHybmeMJFsi9Gg
         /GewwLlU8oD4ZvWU03SXm01XyhQuZBagDm0MhkTKfyv5RKyrh6vkzxDI7yjKMszikJIE
         kwBmbEGI6u9iqRPu9Zd7nAHZToxaIFSkzm/KhDiaZQD/q28aKp7MqPw5c3BpSxuxRE4D
         r3Wg==
X-Forwarded-Encrypted: i=1; AHgh+RoGSEk1XCqF58Ma+NsjFyIxmG8AbBYPqXY1V7rnyFqHSEjrvMNFudRftmpKYAdsIS7ACmqAMvRsgvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+lnxO6MYSyVnVUcjQtCb+mBlaGuEv/HKRNqi3f1xBwsC/xx8
	rTr5Bl7hXQt4FLcLQRHN/b8+dozuAOnAcokp6XNg8a+8N59x3dP8NiMh
X-Gm-Gg: AR+sD10Ag4yYboWDvNCoge692pkDsP9JXNeXvuHy1bRtAlPyjbX8GTcwvOsnkGNVSoA
	etcK4Oi52gWW83jKVvJLuGLds1giCQUNw+ZcH4hhDdLBrR0bQh2kSVU1+flcYlUlZcJBgz0vGEk
	F2pQEb1kQU6LJheAurrvEVwDUMbwm3JRlM/K9VoOeoflcUDBaFmOwfmvGwv6R0OBRBkbXxczewW
	0+G50FjgYqtGxbRWPqAxDDQSzBmjTInObW6Qm9Fby4a5K845k9dF4JIquPhvEnhXLx7fm2H/u9T
	X2A65Q95PSHNXbjH86C2XCU5OCW4t6mJOStUBEMgxLjZHUOYvJR3GB/8ATSMmWrDcqXUNCvlZPQ
	3b99oO4aiSDcTe4VTEhfJkA6a6FmdTfyIMTp4t7lc26kxgXB5c1c0ujv1aouT3ZFYGwRvbggxxW
	93tCxB4ZJMvFVTFc2rcNljjk28hfhp0pXxQGfR8eHFrX1GLacj7Dl1tXvcPnAQVWlj/V9gSV5Y2
	ACBjg==
X-Received: by 2002:adf:e18a:0:b0:481:56ec:b422 with SMTP id ffacd0b85a97d-482b07d6433mr2245539f8f.9.1787091283389;
        Tue, 18 Aug 2026 15:14:43 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e54sm429660f8f.11.2026.08.18.15.14.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Aug 2026 15:14:43 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:15:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Rishabh Jain <rishabh.jain1198@gmail.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: pci-quirks: always assert xHCI OS ownership
Message-ID: <20260819001511.45b3621b.michal.pecio@gmail.com>
In-Reply-To: <2d13e2ae-f5da-4951-bbe4-be7bb0b296cf@kernel.org>
References: <20260815014534.77850-1-rishabh.jain1198@gmail.com>
	<69fdc442-a4f2-42e0-80f6-6b35cbc207bf@kernel.org>
	<20260816220306.64c615f2.michal.pecio@gmail.com>
	<2d13e2ae-f5da-4951-bbe4-be7bb0b296cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2026 16:00:47 -0500, Mario Limonciello wrote:
> On 8/16/26 15:03, Michal Pecio wrote:
> > Not sure if this has anything to do with PROM21, or if some BIOS
> > is just trying to use the xHC at resume because it's permitted to.
> > Then it makes too many changes for Restore State to still work.
> > 
> > Potentially, such bugs may have happened and been left unsolved or
> > "solved" with RESET_ON_RESUME quirks and other hacks.  
> 
> What do you think about making this a series with each of those
> quirks dropped one-by-one?  The head patch (a variation of this one)
> could go to stable and the rest of the commits dropping those can go
> to linux-next.

Hard to tell. All we have is a wild theory. I couldn't even test what
happens when the BIOS claims an unclaimed xHC during resume from S3,
because my BIOS doesn't do that even when I clear the "OS owned" bit
before suspending.

Those quirks may be wrong in the sense that they weren't specific to
the particular PCI IDs, but to some particular buggy BIOSes or kernels
in the past. Maybe those problems don't exist, maybe they still do.

I have completely disabled RESET_ON_RESUME on my test system with no
apparent ill efects so far.

OTOH, I tried disabling the "broken streams (UAS)" quirk on ASM1042.
While the kernel crash which those chips used to cause has been fixed
long ago, it turns out they just don't work correctly (Set TR Deq is
a No-Op with streams). So I'm not rushing to remove this quirk.

Regards,
Michal
