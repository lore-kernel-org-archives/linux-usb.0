Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7163CB
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 02:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611552; cv=pass; b=tz9RY104l3fq1N2PLclRv0xsfX18/gAGa7UzybMplPka+/YZ27M84Ks9NNos3nKj9+TEANl9iJtI35Jwo5vIRDsbzJMvc0Khm62XvK/JXqiaT31mwdnFuVgnpSwkgYVjwP+NidwHIso13C4lahUZtXefOlxXbZaIg9XSbHBenKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611552; c=relaxed/simple;
	bh=/h49o/zXEpuT535jauNzbQi/DldqtHPxBwAxYEnOVJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnfR55Io0iSos2KVNRnPzF45guQreTojti/jUiSYUgdXNlp+LQKiBs1hhsr68qcdZE1/Br1oogJrcqKZ8KM+r7dxrI/MqPlohL9vg5BgbruC8AQ6qWQE5z78bOQOTTssKzO9ca8xipcrEFo0QNyKZPuQbjsLHsh5HNt6ABLhA64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOWKlaJw; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOWKlaJw"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4df360cc9so295993a34.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 19:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789611550; cv=none;
        d=google.com; s=arc-20260327;
        b=qCUVIX/vi4z4CtmmgJYJhe/HSU0Q0b+89SjW/DPDaRF8y506gw/kWLJqCyMkbteovE
         DpKeDQuQqnpFJm3qaY8JY6hSZ0b8lsVAPsTnAeGUrz+xjAl0E9yFppmEndQJq5lie9Ne
         l91pMmFvOPjFRaknbpXQuUkvHwJ+7vPIrM7p7wWQZnzA9odUwJfZl0nUFN+mDrVvz0Um
         FJ0p6fyFvSiaQDlvNYx9Up42R3/ygSY1lgKF2Kd9zm3twQIBDDyg+TlNbBXPOgc897zd
         WzF/FniTe/YtMzAtGnvVvNpjhms82qkKeH1PCnf7h/bj79ZVDqGsfMpSXSBXSw3hskWw
         gbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fwundyOI3+aYtECdjuaVmq8eVo56MLSGbLGuPtd3Q4=;
        fh=bKgBQo3W9BJj3FSVwsqaNhv2utYjesPAie1B40yXZbQ=;
        b=rQuTHigN7f8rJvaPL5ocATYlTj7mRXpWNkwwliAy9K6xyxMB0gzynjt3R8aRWk6t9j
         PeNbU7ONF64kKDP/u338Fr4VhZTZv19N9k1RLgOjE5noQaZUADPG0opMyhRaVVlftp4o
         AAKnKleQNouwLivEiwZTAvXncE5Wfc1REGdn1XYWV9+ScUHk4nVLJG5Rdw9IxzESP/eu
         DfZe4t6vU+q6Sau3euCZnj5YiHmnb6qm2KWfwrcyNUqH/ZXJFHJqs4Z0EuXTWrYeUN/J
         pRLE3u83XzXIGlMkeukCfWvCdoaW27yq0Krlx7aqv0EYlgQLZsuBxTJYmsxQRX/uCKu+
         tvhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611550; x=1790216350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fwundyOI3+aYtECdjuaVmq8eVo56MLSGbLGuPtd3Q4=;
        b=qOWKlaJw1lG/gsZ7yN8q4/aMAKudox6fMYTz4XZt0lmYmapO3t/wsSiT6/Hbb+orCi
         nWerWDywzszMyM4I7+RH23/HJKnURxf+6Vkya2W/vZgvVbHahOjkJkZCafkPWy7a5a3h
         tnnN2L+hwCMT06UmuAa9+0rAM9W59uqhxR1UTtQqylrZe4R4MzdOKriKM2f86zWbr1nI
         kuT5N34SZim1K64z5Rwl/1RjzGQbOOF4BYUUd/rYNUsowEpa6nFTUui5rcPMYZFMLzNB
         4a3/9bEclhwRqoSLVlWAdaWK6sktdftssTJ/+On7lTEWc1yK+WchRJHDBcxYIgCo6uX7
         G3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611550; x=1790216350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fwundyOI3+aYtECdjuaVmq8eVo56MLSGbLGuPtd3Q4=;
        b=El26cK5+UwbYgYk8swl+NpeR4uxm9kbFYkzKWvNPU3XTPs+nPld1tMnHM6rjl0qPzA
         urke/xq4HLWVrjBRizBceMoUJC2u/mFFhHH8D9nT8TTMwIF8cT7KRriv1fGFeeMgQqDr
         bMhSGl4M3ZoLSOJI269RtNg/fflwhuKwAEQ/Cx0I5oZ0ai8IfD7+kxZDU1Q6fpn1wvdS
         BKgUg18Kc0mN0yWxzPGR9haPxHfmK2TjomB2ICUBluZdOUGlkf16o68nfcag1Tuf7Bye
         yQIT7p4am9888q8WLlfRWmwsuz5KYUOko3pC7xxvw9FVa+m+NB/Td6okgtb+Nfm8eKJ8
         j68w==
X-Gm-Message-State: AFuF++neG3FoFXz1TqZqUcqwCWooiyjS95O/oVz5gQ/aD+wie00b8zuQ
	v/XYPzR8Hc9+J28H/ILzWTGMn8LvbHc7XzmMsZiSOEYyvu5ic+CvvBIAU6UjzbzNdMlBYucnVke
	zdjQB8ubetPB3FJVrlXfVUq3w/wR5x+c=
X-Gm-Gg: AYBFou3nasUp14O3dUxzfBxfVK1920kRUbKt+TvcfqygsnLt0NH1Qs2Sh8IZqe0m+tN
	emZcebxnqQZbNY3bKpuLAJ/xIh9y+n9GTMPMDmSo4bszV/yqicKwWX+MsKcPlxUlmXbsBo7fnug
	X7sGSdZefccYMhyEYvWBGoIEF6SLK7TL0CXb49DzlRq5Jp2AfI5G9gMxzdKcwwPuHSX37u/it1w
	4a7YSkXLwcxiQL85/xHCWx74+VZAm5Zeo21AwjxP998lg8M4lmhDahXcM/DwQxBBH75LS7zTX4p
	BicsQRHsNmdp5lN4c3aw28uoIR2Efj0B0BMoRzm2Wz8a7NBgGX8hRqXn+9X0G5vZhDR1HEXzkNh
	/9cpPh163wxk=
X-Received: by 2002:a05:6830:60d4:20b0:806:9cdc:1219 with SMTP id
 46e09a7af769-80c4c50aef1mr1062281a34.11.1789611550056; Wed, 16 Sep 2026
 19:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com> <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com> <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com> <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com>
In-Reply-To: <20260916075135.GN106095@black.igk.intel.com>
From: Ben <benstaples10@gmail.com>
Date: Wed, 16 Sep 2026 22:18:59 -0400
X-Gm-Features: AcwNN1XzMdnNO23d03EcZanvTbJACmMN-d08PiLzYYq2tCxtFPGpClJ8gh98Z7Y
Message-ID: <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org, 
	YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mika,

The TCM bit is set.
I have tried two cables. The cablematters premium 40gbps thunderbolt 4
cable as well as the apple thunderbolt 5 pro cable. Both the 1m
version. I believe they should be passive.


> 0x00a2 0x00003701 0b00000000 00000000 00110111 00000001 ..7. PORT_CS_18
>   [00:07]        0x1 Cable USB4 Version
>   [08:08]        0x1 Bonding Enabled (BE)
>   [09:09]        0x1 TBT3-Compatible Mode (TCM)
>   [10:10]        0x1 CLx Protocol Support (CPS)
>   [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
>   [12:12]        0x1 RS-FEC Enabled (Gen 3) (RE3)
>   [13:13]        0x1 Router Detected (RD)
>   [16:16]        0x0 Wake on Connect Status
>   [17:17]        0x0 Wake on Disconnect Status
>   [18:18]        0x0 Wake on USB4 Wake Status
>   [19:19]        0x0 Wake on Inter-Domain Status
>   [20:20]        0x0 Cable Gen 3 Support (CG3)
>   [21:21]        0x0 Cable Gen 4 Support (CG4)
>   [22:22]        0x0 Cable Asymmetric Support (CSA)
>   [23:23]        0x0 Cable CLx Support (CSC)
>   [24:24]        0x0 AsymmetricTransitionInProgress (TIP)


On the options, noted. I will keep them as standard as possible.

 And yes, this is a PCIe add-in card. I poked around my BIOS a bit and
was not able to get it to be recognized on boot. All boot provided to
you were performed with these options set:

> USB4 (ASM4242 Controller) Support Disabled (mutually exclusive with Thund=
erbolt Setting)
> Thunderbolt/USB4 (Intel JHL8540 controller) Support: Enabled
> Thunderbolt/USB4 (Intel JHL8540 controller) Security Level: No Security
> Thunderbolt/USB4 (Intel JHL8540 controller) MMIO Resource: Full Size
> Thunderbolt/USB4 (Intel JHL8540 controller) Wake Up Command: GO2SX


I also have IOMMU enabled.
I tried a boot or two with different MMIO Resource settings (3/4 and
1/2) but that did not solve the problem.

Best,
Ben


On Wed, Sep 16, 2026 at 3:51=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, Sep 15, 2026 at 11:01:20PM -0400, Ben wrote:
> > Hello,
> >
> > I've tested the plug after boot method, and it seems like it is working=
 to get
> > the dock full resources and stay stable.
>
> Okay.
>
> > For the second question:
> > It appears to me like the dock's xHCI is showing up as a distinct PCI d=
evice.
> > (0000:0c:00.0 Goshen Ridge) instead of tunneling. I've compiled togethe=
r some
> > evidence towards this from my investigation in attached md file.
>
> Your Thunderbolt/USB4 host controller is using firmware connection manage=
r
> so we have quite little visibility what it is doing. However, I know that
> it follows the same "rules" as the Linux software connection manager and
> only enables the device xHCI if the link is not USB4. So if you are using
> passive TB3/4/5 cables you should get USB4 link and also active TB4/5
> cables.
>
> You can verify this using tbdump from tbtools [1]
>
>  # tbdump -r 0 -a 1 -vv -N 1 PORT_CS_18
>
> Look at TCM bit. If it is set then the link is TB3 and you get the
> integrated xHCI for that reason. Of it is not set then something is wrong
> and we need to investigate.
>
> (or -a 3 depending on which port you connected the device, tbadapters -r =
0
> shows the active adapters).
>
> [1] https://github.com/intel/tbtools
>
> > Also, if it's useful I tried a cold boot with connected dock with pci=
=3Drealloc
> > as a boot option after gathering these captures. The control died in th=
e same
> > way as initially shared.
>
> Better not to set any non-standard command line options. They typically d=
o
> more harm if you don't absolutely know what they are doing.
>
> In your case if this is a PCIe add-in card then it still requires proper
> BIOS support for resource allocation and power management. Otherwise it
> will not work as expected.
