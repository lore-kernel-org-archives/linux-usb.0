Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72435F180
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782407939; cv=none; b=V0G6NtdaK35irY3uVTwtEvILH+UlJEXgqAP8xkimqOD+eYao5yyJBooMXedBvFvbDw9Lf06yl2gKJI6cVe64egs76zxCtKpsZTcnhjiRhNNreNoXCwwygy4QbylhzmSmEOG+YWffRY4UJsmFuvc8Emr4AiZp4pbXAFD+Xy/cvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782407939; c=relaxed/simple;
	bh=j3Qx0IS00/mV024HFa4j2M0OlqykQOUAcj5GJc2wYk4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcCSXnFxErefLKMwfHYJI8qEQDK41/0wfcxIvCO+EP/BwySwS4UVmrNjBzEkND+NGfo9fKTeHQcYdJ4wByBSguF3FMGDH6HEGv9fn2030UD+QHrnD821K1ol4JEpG9rHH3X+xTSh6mqQ3u5UFXoTk20qNZQtvqtIP+AgjKhxSQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbdLiuNN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbdLiuNN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46e30429b10so544460f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782407937; x=1783012737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Suz2lUACoLx3teOmZbTvIhEiTcrbGDmlBBfnx9PsK68=;
        b=RbdLiuNN/Wa2lysWHQvAinFBT1g1pkJx7qLHzrSt+MCZ+dvb2OFI8oZYr5+MlpRK3e
         m12hfemhFTAqEwbWjrOgwgkGCzgd8cdOVjCWAJIVpugJBZxPvuut7ZpX/KzLz0w5RVSu
         PWmjj5u00n8sSeR59QTSIU/+ePn6MZ9Fr4mZcXcR0KKxjpfFLXTW5f+8pzyYU+0WYfPv
         ZZg+5IPsQeUzUnpJyM3S24QHWGRpFN7pqa6reqc87OamhO/krW5wVeMWMolclRYpFPTs
         q9metR+i1tn/Ww062JkvDdwxKCWDbMwufGKMtt+sF9g78XuFRBr5ZMws5qO81z21ecgv
         gK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782407937; x=1783012737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Suz2lUACoLx3teOmZbTvIhEiTcrbGDmlBBfnx9PsK68=;
        b=hI1G+cWueorlcSEW/voUOvIoKEQCVU0QkhyVM7TLKKV+WPhifsElaHk7lN9LzfUuhg
         HVPkLcFXGBhohZknNM+dqcyLyWYDnj39MaFLFcShjuql4G0pvBUVi+AAMMVJzOn8yRYQ
         FoVzh4chmk52Xf7AxN1iPqooPLAND9h4tuey5HLfcIEIuuG5Ky1q2WCjEeBPTuF2Th4m
         uopDMeTM/ByiE68mSQcwTLAHJAsC0oLndO17Om1yRvjJvmsJKA1eTg8HSHxso39XomC0
         q9bkfnI6u09FmCBo/ZIQBJHV/OJbpJFqoyNc2uSypCZBbln5u00uK7/AAILAiCqFAkRK
         QScw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4p/1d01qLrPLM40Bm+Nl8ylIYdtN6VpAxEnhUt2tdvBK5P9DS0WBzs0YY9PIposnCVDJhntGnmm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Dt1o7EbYxWqOmDdD66JJkj+Dz+BEkOrPYkFyYl5zB2YcCAT5
	KgIiSmXbl/U61B33gSWDwn2n2Ann+JD9eDzMHFrvIx6BXJki6SlV3mvaLaTD3Q==
X-Gm-Gg: AfdE7cnHMSHngFTFkwcFCUv5wrImiW/3SHk/Y9n5z89trH3GlXMzjG2VSHhFYDwUTre
	AVZm98pciF0cZGXlz7VnpeyarBjNG6dKJNG7TSWElFaq2KAbZHIKStUPJg4t+BnNqyY369qeMus
	dZdhKGQ+ygjFvGkKJqnt0q2GJEuT7Huyk+Idnxxj+aHqnIorYBBOaYUTF3nd8KroLJn4jqjyetj
	KyTpDPfI5ddJ51PKt+My2+ziJlYzgridK/5kj2XXZKyrDlIEwkNVivl9N7xL7dX/tZi7cyjHf+9
	XutPpBY8VBgRfE3QK7UfKcb86M0PcwxKCiN0OcVNra/YdsQKOZymjHXulSveqRpF8h9bD23DYf+
	54UsYe5vnJszp/fTXI3OTyq2A/NHtcHfE5vJ85GVtquBD5r4ECnf69Rv9hEPYZZqM+Nwh6Aw17A
	AQ2X4WJAqOIs1LPTU3StnElQ==
X-Received: by 2002:a05:6000:2908:b0:461:a5d6:8794 with SMTP id ffacd0b85a97d-46dbfe8cd75mr5247546f8f.6.1782407936678;
        Thu, 25 Jun 2026 10:18:56 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840eefsm21008147f8f.1.2026.06.25.10.18.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 25 Jun 2026 10:18:56 -0700 (PDT)
Date: Thu, 25 Jun 2026 19:18:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Cc: cyrozap@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260625191852.0a8d511c.michal.pecio@gmail.com>
In-Reply-To: <178235378952.3114334.15752812276771065417.b4-reply@b4>
References: <20260623121847.53749028.michal.pecio@gmail.com>
	<20260624070612.337013-1-zhangxincheng@ultrarisc.com>
	<20260625020421.2e577a94.michal.pecio@gmail.com>
	<178235378952.3114334.15752812276771065417.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Jun 2026 10:16:29 +0800, Xincheng Zhang wrote:
> I re-tested this on our side and collected more details. The machine
> is an UltraRISC DP1000 riscv64 system with a VIA VL805/806 controller:
> 
>   0002:01:00.0 USB controller [0c03]: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller [1106:3483] (rev 01)
> 
> The booted kernel was built with xHCI debug enabled and with the VL805
> XHCI_NO_64BIT_SUPPORT quirk removed, so the controller was allowed to
> use the normal AC64/64-bit DMA path.
> 
> This is a no-IOMMU setup, and the command line does not include
> iommu.forcedac.
> 
> The system has about 64 GB of RAM:
> 
>   MemTotal:       65837388 kB
> 
> With the 64-bit DMA path enabled, xHCI setup logged DMA addresses
> above 0x1000000000:
>
>   xhci_hcd 0002:01:00.0: Enabling 64-bit DMA addresses.
>   xhci_hcd 0002:01:00.0: // Device context base array address = 0x0x0000001075cef000 (DMA), (____ptrval____) (virt)
>   xhci_hcd 0002:01:00.0: First segment DMA is 0x0x0000000108961000
>   xhci_hcd 0002:01:00.0: ERST deq = 64'h1075ca7000
>   xhci_hcd 0002:01:00.0: Slot 1 output ctx = 0x0x0000001075387000 (dma)
>   xhci_hcd 0002:01:00.0: Output Context DMA address = 0x1075387000
> 
> Shortly afterwards the controller stopped responding:
> 
>   xhci_hcd 0002:01:00.0: Command timeout, USBSTS: 0x00000000

Right, your addresses barely exceed the 36 bit limit. And I found why
my chip behaved differently - 40 bit DMA was a firmware upgrade.

After downgrading my controller from 00013704 to 00013600 it truncates
addresses to 36 bits and fails like yours. And it's a pretty nasty bug,
because some of those accesses are writes to scratchpad buffers, so
without IOMMU the chip corrupts unrelated memory below 64GB.

You can check your FW version with this one-liner:
lspci -d 1106:3483 -xxx | awk '/^50:/ { print "VL805 FW version: " $5 $4 $3 $2 }'

More about VL805 firmwares:
https://github.com/jpmorrison/VL805

One could ask whether 36 bits is low enough for all VL805, but I think
it is because the bug is hard not to notice and nobody ever reported it
on systems with less than 64 GB of RAM, even though 16 or 32 GB without
IOMMU was a common option in DDR3 generation PCs, which is also about
the era when this controller was introduced.

Regards,
Michal
