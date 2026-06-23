Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0253037B003
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209936; cv=none; b=j6yDZrekpnYttdqF5mvU4ytSqlCJXEX5aOEUCNix/TYBZyade4rx1C0Chon3TuDjNHtqLPBwbw88DI3J4HM/UB+GrDo9uPCYpR6eUqJJiuexSF6UfKAgrw4ZR96YrCnJdiC6FsfkOcxYPX3W6C0ciVBLOLKNFSKWuScZkJHwi2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209936; c=relaxed/simple;
	bh=4yVtieu1FINk50HoSpYCICOnuN8un5ZUI4obEuDBsgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKuEqEpZQ7zrTFm9IOOq7UnqynyExpUmUQZP+apxpP90bbUeh+x0JJVRLO+Q/Y0peqQ9qEedy5C/yQHkoZ5aQNv4GzkYCbMdUuxPpZ+LFFkOR5FWm6RZluKXGrl8S7S9mbLvBgUqEQKSmFbnp2wWgR7xTg2JhERmW5Y0ACsWl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP9VWScm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP9VWScm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso36996695e9.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209932; x=1782814732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HksytDu/NjeYLcnU9j7CUQon3uwx8r9Gnd6yYJuLK7s=;
        b=ZP9VWScm/LXInfDxpFK36yHgyec2tlm0q1lKZuKBytE05ALu14MBsqCVPSX6Ta7Ytl
         nhNiijzgjuhC2ESodUxcdyB++CH0nq19UL2Q7aKgViLvCuajct/792s/V2t3lbG7xx+S
         5xRoZiPMYEr6wY0lIJfwVUx2pUIVpYBkgd9YCHjxULncat2x43YQvwtOp5G3jacdQQ8j
         bYx4EVpajO1/G7ZXhRfvH02KJuuHy22C8rw7oSfV5UksiVsAxXAxpyUyY4O47RI5K0gq
         FreE5s6SQt+ZU4HPvPxcjBxD5ivUDZORt0JsYrwnwi1xaKqZ9g6eS+gyr87f5hKwb32w
         PJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209932; x=1782814732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HksytDu/NjeYLcnU9j7CUQon3uwx8r9Gnd6yYJuLK7s=;
        b=hJDLVL4i1YJtYMJNbzra3G7hUBeLSTvWVAtpZs3GQM7zwMnScgIFLS4h77fGJ5MUrw
         gQIx+Z+OzO1fQDWQsJ2B2lCMABL5PT3Mh5gJdFLi9rpXfJxaLGcfrNNZpVQZMYg+hyCW
         RNaPM0vzUNBdBypjbKZiGyHJ2O56HwI7ZYBAj2i4MXqqUuZZOz8+KdFdmeFbnAxOSGLm
         pKcHKhEeB44bwal+pd9qbsSrRsokAK3HUVr/WJHCQGZkB4A/NlcIom45LS5L3ZLJB4hV
         vVKtBkzQE4MwiQs/U2W57HM2bWvrPI4y8TE7xTPRouEMCn+7xDsClW3mBr7Gz1QfLhHK
         KgPw==
X-Forwarded-Encrypted: i=1; AFNElJ8P74unRY+gScFAbyYLuIXtg6s9czbcjKusmEf7ZAlAGh5+S/7BeXBsvp/Dnf8WdT4zbwXyEUCiyiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWa8ke1FeFd2RISKd3ALlbGkebgTKslV28rAUyrc1DizkWp88
	iMLCZFfxohuRnj1HMM5JXtE+RJzxQ2KZr5tlvbv7M9e/bdb4UMNCy3vugGff7g==
X-Gm-Gg: AfdE7ck51uOlzrYTQMDCAOm/2ATpiwXMRtPvZb4zKRaZCvnXpU+A1CEro5bR1PTlYQY
	/Bd8t5puoICSqAsumoc4Bn41/bZlkEIC8/n2CrMjrAN1kLADvRJ/1PMwrGU4az9eGHvX/SMS8Xh
	rjpROczet2RTY4cz1t0l8i3nGmmKJzNIuLRL6OJlo1G+oFucO5uJYQyB5tqpsEKocYYJD/5STX5
	oljj3lyaeG/A4p02NgTQhQ7tMD1nU5SaJh/URMLfEms9NHp7zwtlwcYBunUj/nEBYSzm7R3MgRs
	j74z9KH++weaKZ2ioqrJNI6NrWBHwhdc26DFQeYCIMa4Ti8KgnnV81CaVfSMVy2I6tmR+9ho9bY
	6+6ByCSQ2oPYK0tjDOKlWQhYkPPlcpNytRcu5mMN31Ut8nW96dKJ3ZoRjYREsrIoN6cJiNXZFAX
	mAj/ytIHV3floEXtgkCHor+g==
X-Received: by 2002:a05:600c:4346:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-49240e20cc6mr185664695e9.6.1782209932133;
        Tue, 23 Jun 2026 03:18:52 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b359sm350117885e9.9.2026.06.23.03.18.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jun 2026 03:18:51 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:18:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Forest Crossman <cyrozap@gmail.com>
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260623121847.53749028.michal.pecio@gmail.com>
In-Reply-To: <20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com>
References: <20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jun 2026 15:32:02 +0800, Xincheng Zhang wrote:
> The VIA VL805 XHCI controller (Device ID 0x3483) fails to handle DMA
> addresses correctly when they exceed 0x1000000000 (64GB). On systems
> with large amounts of RAM, this hardware limitation causes device
> failures.
> 
> Add the XHCI_NO_64BIT_SUPPORT quirk to restrict DMA addressing to
> 32-bit, preventing the controller from receiving addresses beyond its
> hardware limit.
> 
> Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>

It could make sense to put a fix for this in stable too.

But I don't like this abuse of the quirk. Firstly, it causes
unnecessary bouncing on systems with >4GB RAM and no IOMMU.
I found other drivers that use DMA_BIT_MASK(36) or even weirder
numbers, so it seems that we too could request 64 gigs exactly
with a bit of driver refactoring.

Secondly, it makes the driver pretend that AC64 capability is absent.
Differences go beyond address bits, notably including register width
and whether QWORD or only DWORD writes cane be used. For example, if
we want to improve command abort on AC64 chips using QWORD writes, we
will need to know the true state of this capability, regarless of
whether the chip really implements all 64 address bits or not.

Forest, you have added a number of similar quirks for ASMedia chips.
Do you happen to know what is their real address width? I think it
might prove useful to have this on record.

Regards,
Michal
