Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BD397936
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727602; cv=none; b=BZJGGV3cuz+/BZCJJ6u5oFnpaeGkuruJa0917BrGQA7F3k7Z4pcKGnNvmNkfGlUzeS2evsd/9fhPK11fDgkOZhlqF/Gx+96HpzEKDGm9ZjfipMnyapyUXSXPhr4mvb/Vl8leX56zrAcQax3dlvJ15vxayl/KZChArgQQgYBIPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727602; c=relaxed/simple;
	bh=LP+CjnPTNKJTOh9M44NP04G+M4Hbff+bxYnyBcwSMCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fg7mWtKQso93FXQ1MwupmlSUIm6m0IRnw3qKH2B9xYnuL13LtGPHi9IBRg6HYyRSrXWOeNxuYkaFIUdKwcr71ERtbDFE8K30SBTwHpRGaKV/BoqmkNA6euGCq3w/RD08ygjKmvgR6YVtF+KRJKduUe47RO+p0Dc5DpVraBIkbVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmdo7CJZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmdo7CJZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so967998a12.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787727599; x=1788332399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WauUjNIZUT9UpQVIgggxGeGxRKN9frgsdAp/zagOntA=;
        b=rmdo7CJZpHR25vsrePOxBFmoNzU9CeCqJIDRuYtMkL+HCbbpOE+ZsUHi9i86MZM2pV
         902Ie7moc1Qi4JP8zY3ACU7Z14NVnW7qHwI7a2v3MoMfS2DFrgW7gajNdztzt4rO2l4l
         f+exzOtVBYf8w0KY8SFMSLP8s6uGMCesWbgEsNUyuDIpBxpzWwFLe5qPyv7OONltBxiN
         JG3tzXj53hz06CMzpcu3U17Amc3mK1q0fPPBOffBRp301L8uEr56NUa3/SoOwOU2iTn6
         L3SgmVdMbraliotZjwKoiUdSkgBvcdfeE+GABeeSeR/yVVV3yQBx5HGtoaxtf2WELIhU
         uYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727599; x=1788332399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WauUjNIZUT9UpQVIgggxGeGxRKN9frgsdAp/zagOntA=;
        b=BBqRSHWBfpwLPdtd1tod47RnZ0t4xGZJupQ8EAncDSWzNDwJl27E1CN9phwWqcwWq3
         InfLO+piqGWyQmYkVxORr7GBtkTfAp9IJ8EGxDfUZNrgVMum315OMOJX0iia/7HiNtde
         eGfLBC7anCmZ11LQ717jMXzI2od9kf/s53lh54Lj8i2/sW9sfUB7Smm7pG0SQuZCfGO5
         89N+fdHvVFGMpnu0RClMe1QM98giSTLBAgBC4Ge+8+9RzN4Mb40mHAdXy3Car/zR1CK4
         /jct6VqH9YN0veKN61QY2x+1FWfxyoRLyIURtw3MrSIkko1SsL7PIg1TPuqoHs2qkEa+
         hSXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2bKPi8C5fOOBYgwnzE82NDMJKVEnMmwcjUzALV6BNPxrVzF3I1NkRur0bkzvCUqYIw6xsLkytSGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mWwF7e2z/2KOB/txEEdvownLVV17udhvDdI+3rEYRRdRXcB+4f
	aI0JOEp5Joru8RjfTyn6a8DdvEIksC2PlKYkkN6oFl1QPNjwQF/d+5l1
X-Gm-Gg: AR+sD138GekwBxe7Oug20oRlUwQ1/68Yn4LQkewBEmPIaMpXrrhDTBasjwtWvbPyv10
	jkVjiqUQVVxoJjE4LzKWajEdeVqpJt4DvwvDynwWwnNc834TUkCWePNrFuz2MbrkJyCjgwrWG1d
	jlllIfc6PYUiRQyaTJ8okt6DTz3pQKyNSVXcnEAwuzidx4Cyw2UXdCLc0t4YucCjl3ixHsm3WHF
	M4I6Uohvj25Xi9EYsC7R18xW+0sEu+IgsfDZRP60xcbYzOsj6H/+dhEVWxhOs39ulV0hqA4oovt
	iM8D//DNuYbV78aR7WmKLASpK9LH4Nt6GK8RqVetLkHI8voNRvso8+km9Ht1vMgON4Bh6K/lVYX
	Bo8X6bfmw2ELoimIhme/blihA+Y2cCbXHB+YxMahYzp2SfieyqiyTZL3TaNZgjojmrD6eIghthh
	9PmKYP7Oi9X4g2m1hIqK7O93hf0jU/El0minkePb3i/zxwBtZv0n/FMsmMx/rO/+Nje18p
X-Received: by 2002:a05:6402:1f01:b0:6a1:b0b:bc2 with SMTP id 4fb4d7f45d1cf-6a5df65b8c9mr6399127a12.10.1787727599087;
        Tue, 25 Aug 2026 23:59:59 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d0b71sm2826662a12.9.2026.08.25.23.59.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Aug 2026 23:59:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:59:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, Lovekesh Solanki
 <lovekeshsolanki00@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, Forest
 <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260826085953.7f8e3949.michal.pecio@gmail.com>
In-Reply-To: <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<aosGtkE_diwVJJtB@eggarch>
	<20260823174059.46fec036.michal.pecio@gmail.com>
	<aoser8dLytrwqBC2@eggarch>
	<CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
	<226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>
	<CAPyJwA9GvqeaBYhN56L1S9YW-rwWgFejrcNcE=54DQC3Eaqxww@mail.gmail.com>
	<f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 22:14:32 -0500, Mario Limonciello wrote:
> This isn't a BIOS regression, it's been around since the beginning on 
> this threadripper model but it was harder to trigger.
> The Linux kernel changes in the bisect exposed a platform issue.
> 
> The workaround you can do for now is to disable runtime PM on the
> XHCI controller to avoid triggering it.  But it's a platform issue.
> 
> For a proper fix you need to reach out to ASUS to get an AGESA
> upgrade. You can ask them to reach out to AMD if they need
> assistance/guidance on the versions that contain the fix for this.
> You can share this thread with them for reference.

This sounds like it's a known FW bug, so I suppose the exact failure
mechanism is known too. Is it triggered just by putting that PCI
function into D3 at a "wrong" time, or is there any USB/xHCI layer
involvement, particularly anything out of spec by software?

I ask because we know one case where dodgy SW actions cause some AMD
xHCI to malfunction, but the problem is contained in the USB layer and
the affected xHC doesn't bring down the whole SoC.

Any thoughts about the patch which reduces suspend delay for root hubs
specifically? It restores the original timing of PCI resume/suspend
cycles, at least as long as there are no external hubs connected, and
has just been reported to mitigate this problem.

Regards,
Michal
