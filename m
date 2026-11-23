Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463764;
	b=IrCY2Tg6QlI9WFKkjq6bInovs0XvbMv/f0yvMB1r8mIvo4UY+0q7T4j0H00dryMNPQBb
	 ejs8TnGQiIbRVPBBNpkAPGCBA7ka59EYWG099XBKuHnVnV0ftFOk+LfJdX57vkoSdJW4p
	 VQ9IOwiMUx/9NyWrVsf3k5MhwyBV6fo6KPzK28KTDYLo5s+fT5GYjYHQvofBnreVybaC2
	 1zIz5CdvYE29wN9AZQI1PmDdxzwHp7rLZ/5QkSU8wBSYim+1tvONZthQrw4mn/QoSb8tI
	 ncmHqjGBvqHq6m80AL3kClxPAIPFtW4Q5QwnYUgaqQ+RU+wPJzINheD8kH1C824CoXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
	b=CJ4KqWLuI8qj2JbY1i1yQ2MR0MP8y/Z1B94e2o1Z/CYGuLTA56bSX6v7XoLyNcIERzzZ
	 WyU75zJe33B4BUedESyQ6gU9wqs3P/cyi3z8YcTOfDiBB+BNF/qNpdNUJQs/5uFaZw++9
	 kNfWDXrk7CYSAuPU5mLXFwKL5SHJMiw052+1jQTHEnHxQztsKZS+Q87/SDOg80YcCjLaY
	 LCSTU5w5HO7Ws1SlM9Phv3uoM9QalWJ9tIvliU0aU+vQvDpNWdLsei1Xks7fO/dsDKHBs
	 r9YrNVFRWmDN2bFIAaSdmcWLR6O8eBJaYW9o7YDuvw9sYM/4pWMANESZ/2uXMs7iavg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILRa8rMf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B1606A33B
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174B1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILRa8rMf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso27851425e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463761; x=1796068561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
        b=ILRa8rMfEQRXX8PcvtS2W7TKDKsM/DcDJL5LU18Pte2U3PaLYKSECik2nz2JiQebGB
         h8U3yV6/FiIFQ2ZDOyRMyEX+8hp3azU5Girn+v8Y2xGN9J2Z2eVmV3Tq/PwodzA+8cfD
         w8ReIPvGA0X+f6F0X2YkV7fIkV3M7BgT+20Nw8w/o2zGFYbHApXNxHMEf+s3Ry9Ptf01
         u3ctDnm6bVmTmpv/ngofyCrsB2nhuyJfhkUoT2h1TGQblcjuPDkKDkopCxBxnpZYDdn7
         XI0GrpacwDINdZe30tCByNNsUhEC5sXD8qUQ5v+TUmA7KhsksF5KZR9hdFHNtPGKhK90
         hUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463761; x=1796068561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
        b=szM77tujq5tVn1vRoG03F844/pQbuTu87aOriNj4OSYggt4yi+RhdQal682jo3vgxw
         HIMx4dDC5T3ug4EidfGaqruGiJ6pwHnMxdfVRbhCOq6hfaGi3fZJNIfevDBvcoBQNQM5
         cgAhI/fe2uYZyzyC/VaQR4/jakE1iLMP4kIpqclusrCUPe9GdwpMBNH8EOmhZSGdcuhA
         rPR36nCoFEeTL24S0QwKZ8MUESbyIEsouwb2P3Q1shrESoDGPnFq7lCbBplcqw1BSRke
         Qpn8flCAsgTziuaZ/i2iMYlagdSygPqZjHdbVEsi3oxHLoHg8g8G3pPP3pVqrmGLBghw
         8kfA==
X-Forwarded-Encrypted: i=1; AL+hErHP4Y2cI5jtt2mKCYJDxkK2hWamMi2SGeFlEIhwItUF+61sJ3qJSxnv7Ll7+08zx0PKY2PJSDx+Re0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96LkAFJLP+I8+XG7gwTLNF5BYQTFl3MutU/4Hu7CYqb3zzeIRa
	hFj9ss2h7ZIfVGoqpJ7H4kc/WoxM3w5Clk1BPCAG3WyovePqck5qMROw
X-Gm-Gg: AZFdTZeQfeqVV9ExFwUNHuPl7A1bCaLDzwDFp8KTWC5WxS2GQ8dcmNPszQflHqFOZGz
	gvSPJYu1EpTuSHT0l+xw8Es7NQ0KZO3fT7Ba+c4mhykie7MFZg+73KZJRQDuYrCU2OagtnjYhvv
	xdLvk08ey7BUDRyew5Xn+JwX6id5Plke0PLouzTFZmDay/kKvbw7rP4VMSWSzMcC+3RyyPjsxFs
	K3ffP0xdNDp6aa1ox9cYxHvrf6kBkb86x1Q9I+GPRy8ka65bSsTyATBP+nIpJSr3TrB8K5jPA52
	dBqNC27BeQQzFptTFhnDKfcYlt2pOcqkZyXdpiUGlhqjZskVyi2VbFzTOhLlfxNMc4C1L0MG8Jx
	hwLeC1K8+jUf1pGYD/UDz4JoWi9prZo1fmZAkuep9t7fo7jTBPf6R94e2MmqqRk8ei4Y50dhRar
	q52l2G/lhoxfZ3XC6nW6dJE+l+yhl425X0GGQnBHYrgdBGV7euycGuNmPpLDaukUvlHhzwZVfG3
	LbbLaPZj5gDv2Pg+wrjmXwOOJ6tB8qRpXwv5uj2PI2NTWL6s5zW+nnQEINVVCO54XgUS8qOSvVJ
	KtCsTlFMra5JmxihYyDDFQZrt5G0EROBVgblDgfh
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr241947155e9.0.1795463761275;
        Mon, 23 Nov 2026 11:56:01 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm445229305e9.6.2026.11.23.11.56.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2026 11:56:01 -0800 (PST)
Date: Mon, 23 Nov 2026 20:56:04 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alex Kononov via B4 Relay <devnull+alex.albefly.com@kernel.org>
Cc: alex@albefly.com, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
Message-ID: <20261123205604.5bf490f0.michal.pecio@gmail.com>
In-Reply-To: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
References: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 13:26:32 -0500, Alex Kononov via B4 Relay wrote:
> From: Alex Kononov <alex@albefly.com>
> 
> An isochronous Buffer Overrun event means the device sent more
> data than the TD could hold.
> This is triggered by the device, not by a driver bug, and the
> error is already reported to the class driver as
> -EOVERFLOW in iso_frame_desc[].status.
> 
> Logging it with xhci_warn() can flood the kernel log.
> A USB S/PDIF adapter (262a:9123) whose S/PDIF input loses its
> signal produces this event on nearly every microframe,
> about 7,200 messages per second, keeping systemd-journald
> busy at 100% of a CPU.
> 
> Use xhci_dbg() like the other device-triggerable completion codes.
> 
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Alex Kononov <alex@albefly.com>
> ---
> As suggested by Michal and agreed by Mathias in the discussion:
> https://lore.kernel.org/linux-usb/2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com/T/
> 
> COMP_BANDWIDTH_OVERRUN_ERROR is arguably device-triggerable as well and
> has been reported to flood logs (https://bugs.debian.org/1035939);
> I left it alone here. Happy to send a separate patch if you think
> it should get the same treatment.

That's not device triggerable, it means URB size exceeded bandwidth
allocation. Such URBs shouldn't pass validation by usb_submit_urb().
Only a buggy host controller can produce this warning without any
fault of the kernel.

My Etron does, when multi-TRB isochronous TDs are used. Apparently
it doesn't support those, maybe it needs some ludicrous out-of-spec
workaround. Sadly, patching qemu-xhci to pretend being Etron makes
Windows bluescreen at boot, so IDK how / if Windows deals with the
numerous bugs in those chips.

If somebody sees this warning on current kernel releases with spec-
compliant xHCI controllers, we would be curious to hear about it.

Regards,
Michal
