Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333597;
	b=cZ1mwC2tA5WRzyGyFzAnsNbREhvDHC2l1Oorqt/Ur+3uvRgZbdrOd+AiB6lbgU+Ba6cD
	 eV1aSvvVQ73FVzZn1vgODvp67A+ZzspMyZeP1PfoN3NLrUENogyAFi4GQ8H5DVWX/NTCK
	 oFuS+06STKKdNTaWY8bCyt+9v+Hf6TAdHlrEWivWY72XmjEKfj6uLKzReh/EwdxERriSy
	 tmTB4Ne+8e+k+UEu5t1P829/MxvwbQ0ViwpTdlfsDpIssaq9DuqyVEmI+4xs2LFnGrO1k
	 pI2sMeswrnxUYQj8IPeJ4oyptQAGAQSBZPFD2YmwZjCLaxgj2DZ3292Re1B3on7skBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
	b=qDgLTnpLlHkYeO5fvKYbZNOpRpi9otYZBbmxnr0cQdrSGSBgDXwKyPOad/cYs6TshpXe
	 Dwixp68L2H2nEM8v9cYAtf5kCgXYYzCEIyF4a1gsDgjveO2HGmJmnwOnyFtzpQ11qHwWE
	 QfR3BUiURhxkDBBcaipberdAGT/48JVJ9VrvDQ1/1/yebA8VS4Xqe/akCnMPJe0GYGAQo
	 dGMl2NzvgB5518lAfpNPDWAJryJqhSJbBnwVY/b2YCFFjBPmP/gpKNKRy7UaVcX4El8bd
	 p7pFcpLNJXGjMuIiRr6NhpbQv/kG13lXh5oEfy0LuWI+jofb8AEm/NDgb7KE7HRrO0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmHh9eFo;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB36606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmHh9eFo
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a1947498bso724139eec.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333596; x=1793938396; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
        b=XmHh9eFoWPFqTU9vbQvOWVzcpX5iba8DyCTBSR91YajmNq0io085Yjff0op3KyMSMI
         MLv8Is/WMWaehxO0rIAXSp1tuBUWB6rfuxiGXqfaDrT7mD8D6jKj292iOe/MYLSzMaWo
         c922BxY6FzLGMX1D91vk68pJzxmsZAPsJw+HTZwha7F2b3vTpqMjjT+Gw8o/oplJLmLG
         1Zeyq4Aso5992NVL2hYM1pp66gd5fancKUq17us2BhiDO4PP78qr+95O5txPzMeqvml+
         hbJYi1PFHhAWztGidgYBFQgyD4X16O0abY3TbIAUWdXOXWxlgoKSthJdTSZhtRgh7bgm
         fmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333596; x=1793938396;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
        b=yUswxYZGTxFZSmgotjdJ4ZvqpsbUb6Pt9xcZ9eteiO6POWDTNpY2Zbdtod0Y2jyjy8
         rZ3r3N+q8cR8o2gGxLqbuiIDjZ60H5P59TowkQ2Kgm7YWSoR2W3twSVlrxcux0q8bOMf
         OYJ5p5e537bk/CS0EJSzcVihf1LWKywF530DNX/3LN3b8YbsMDW+znSlvScBq5vSyWET
         rDLOzcdvkGLg7roBghU2NSIDrf5c68z7xorozLDKCFPjndy2mvWscpqDbVKR8SDq2/Ja
         cko0vvhM7FCJymBfvLXBnCyTG3vU17iugK4O7p4QpsLhdW+8cJKEUEUMg99jY4FvPFgy
         KFYw==
X-Forwarded-Encrypted: i=1; AKwUvBygUzZN+IY68CvWF2omMkf2cQVqjkgviu7dfQYoQQ+gkAqt4dyj8eeX2ql1KylpRIV/49Qx2xVRMr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDiGA/1S1wypLwCtHeVSK9mz3Uo6hsI3MwGMehp9PEpMkSO/pP
	fI9N2Xr2gQgxzOsKBswELY0e81W8Wc2PEej1JQap1pJPU6paCskPgrDD
X-Gm-Gg: AYBFou0SPOhhCOP4ZhbdNoea4EcicYC+dspvTeNX1D2QZInm3AgwMfgX/64quvNDbWc
	+E6myEQhpUoDqckgpAczWmsalIgUOO80nCFXbG1FzJEBVeTm1hKT/iqL1XrG2ouBR9t+bQmkHPm
	q+b+7sB+Ukn3eF1YbaBKLX+IZSK89jbvchdiA8G9giLqTLLVaGzAI5ZqFv9GlKuL9Hbv4K2WxeO
	cF78o3lTFF881AuKNW9GrbKqMAaCKHnmwKRRwNZc6PLtCeSBRPLne4fCB0wT8cvCycNxnirE4p7
	n0ev4OToe/h3Rp7qYbtP5b3/vlQA3/Fr6URsXoKirVqyKnLoWDbq+/2IX6glU8Bub5LyRxnI6Ys
	eHoEvm6AeE7/osx/vuEj8+BnYjtrj41akX/WYiapo74B7kHOUu3x1BancXsHJbFu+ln6a6m/CSo
	4808Uq4L3GEHjLJx18yW6CTeI0Bujd89DIcGDWTqWOe5xUtksfy/W7yn6udlW04EOcMGfu4Fn2U
	Qoyena/d5PX75x+04yEgJM+NfNmWTtN16EDSKEAFUm9VNsaUAbtqESTovRGR5jUp5ONeVfWOBR/
	xD7SGQs/TXJmEgX7h4RnQ/9r+ZZ89PsvBGzhC2x9tb/T3174SQDp/w==
X-Received: by 2002:a05:701b:454f:20b0:152:3812:496a with SMTP id a92af1059eb24-1ac5eea0720mr1479963c88.43.1793333596187;
        Thu, 29 Oct 2026 21:13:16 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm3248156c88.21.2026.10.29.21.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:13:15 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Thu, 29 Oct 2026 21:13:06 -0700
Message-ID: <179333358668.2111112.12827497703998022783@gmail.com>
In-Reply-To: <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Shuah,

Without this change the URB is still completed to usbfs, with status
-EPROTO but with the peer-supplied actual_length intact:

  vhci_recv_ret_submit()
    usbip_pack_pdu() -> usbip_pack_ret_submit():
        urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
    usbip_recv_xbuff():
        size = urb->actual_length;                  (usbip_common.c:849)
        if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
                goto error;  /* rejects the packet, returns < 0 */
    urb->status = -EPROTO; goto error;
  error:
    usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
      -> urb->complete(urb)                         (hcd.c:1657)
      -> usbfs async_completed()                    (devio.c:1911)

usbfs copies data on reap whenever actual_length is non-zero, and does
not look at the URB status:

  processcompl():
    if (as->userbuffer && urb->actual_length)       (devio.c:2050)
        copy_urb_data_to_user(as->userbuffer, urb);
  copy_urb_data_to_user():
    len = urb->actual_length;  /* non-isochronous */ (devio.c:563)

That is deliberate: a legitimate HCD can complete with a short read and
a non-zero status, and userspace still gets the partial data.  But here
the length came from the peer and was already rejected as invalid, so it
must not reach usbfs.  -EPROTO alone does not stop the copy; zeroing
actual_length makes the copy condition false and userspace observes a
failed, zero-length transfer.

I'll fold this into the commit message for the next version.

Thanks,
Cheng Yongkang
