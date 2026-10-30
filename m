Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357743;
	b=kzQ/a2cE5QUhlt8ix2GSp63gUpxDmDDPlCAv2bl/8PKEeGHVm9JrBsoPsIhiXP9t9rDf
	 AbZSx/Stp/1hmb2G6BYmWHWKX7AP6xtAizA3RYJsF/m/6s2HNbrOb1PTjYKxk6XHka89t
	 /Tfcqq2UYYSIZYj7m0NaTwTEFJLCZwQhY5qhViV0wVOcPsbZCCDawB530fTpMx1gjsGH5
	 No71Oo095SI1vjgWFdsIN+fr7nZMlKfCe+aVFzXBad580StnamI7VxyvDGxeboHRg2tkC
	 htgiK5lr2E0mgFiQI6wPnkdZgIPoTy5nlQmskkz93Yp+rfBTtVH4jguPKrBLlmA87jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=simdutmdGSMVjEzPTrrjMMiL7ZuecmYjL/SR54lnGWM=;
	b=HCT1b2v9uE4ur4N/hSQNYwOVWOn98ONQRCvb4pUU30py5D5fZ+T7ee52qLlOx9136xhd
	 paZceJKfySsFq6GiSvXOjaJQ8gQz/TK2221BSRVT6y/4OCeaYUo+V19TZGNDdDNdqiZ41
	 k8x0UAjIj1VASXAAq29CYjClI6l5lz3fovyElPhCKIAEGkocf50pv0a7JGSbebRShEImk
	 j2EitQ8ExOGgNgQi+OW0XhPK0zx9A9T5K2MdwCEakgYZ+iBaUKv44+ljJ8vEDq2Xktjwx
	 Znlx76IxlEH2+kcXf7v/7Y8tybgHuFCUCEfvPfzYHaiMyUFKlYm1FTVaCNXSDbO31AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuxdJfuh;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170BA606A8E7
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 10:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170BA606A8E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuxdJfuh
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so5054095e9.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357741; x=1793962541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=simdutmdGSMVjEzPTrrjMMiL7ZuecmYjL/SR54lnGWM=;
        b=vuxdJfuh+CRv4DJwMJwKhupRx3wu50BBg8hQJybwTSl8ANoZepqWiYNRaD/u8ZXNur
         f5O8EbwToO5ajt6AO3xC5aH1DJKHeZHm9y00xalTJvNjvDswjHDqAZUvg8h2fsPIU5Iu
         rV0DYCAPsfA37bQ3qIWInMigu6OogJ8SDyFiXMdgiDTieP0ZNPr/o5H6WPqb1trIP2H3
         kmf/yT5nYVS8KUWmTEJqQE5gZghRIL3c6FZ8Q+GndgDXPcNrp/wEFxFUEiqGJNk9vGz+
         qJXA1qtqOTAdSrD5QCgsDlf0FqF9y9rRogBUn0N0CrQBxWpX5h4RNczIGPqT1iEgnFA8
         /Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357741; x=1793962541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=simdutmdGSMVjEzPTrrjMMiL7ZuecmYjL/SR54lnGWM=;
        b=A6jV2Ww6/3E443KlNxM96qjblIPjLjmU+BW0ZDaUf3cTJaUm4haq2CPlzlpfMzOMAS
         tonbfl/X01V4BBqvLAR+oqAW8nvODfEYom2gbJsNbBKcZ1IycEyh1cwUxwzzQqNOqW4u
         Uyq+Lz+YkkRuVGMhK3ROMNLfllXiSnHFMeG+RbDdffnmPJUPdhDe6zCrxGUzgIT3I2Ol
         hkMYV4/gIzt0Fs9ZeH27R8EItSO5AmKWfuoqYffW93gOqdxpxbiMr3eLQHNg/FFCynLP
         wUTsguaHnKX4DHMHiAZHtQ9/7a/rLIHUaItXw8clM+VN2vNlD9DJPXYnMAMSzGrUcmC0
         kgVw==
X-Forwarded-Encrypted: i=1; AKwUvByiES/d2NiImBdXPD8c7a4H8EdwptY1J0xYHVANGVBy/Es71bGMgINeTNkWuxJLuoOwR7NQt2qZgi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIME4sNQanxNPH67xEG3rOlquBrODO8TWz7e2eKudENWmxA7LWT
	LH4SsAJ0IwmULnAB5SSZ8VFFqZ8cknVpVzYlvPEkfwHCPf7LXWNcKpj+
X-Gm-Gg: AYBFou0Gm+b2zn0U5dmpR4vR4fGghfoNZ72OMd70lzsKE7prd+VQRGjkOD5wxKo+x/U
	r9n/pIzM53SZPXcILkLFkEvzKkpc7Fj9+BSWa+nUj8QfGGiNRK5X49nWiiXV1+iCJweqqY2aP/r
	ino0eUVWOLVFoCKzQ6yZ6Q2Sd60Is1I9bMx0JXmz2iZ5CA74JYdlYKA2m05FWwSKqqbSJqBVVb7
	9xDQ/EAs++jutqeslydbAf4ztG2oAVV6cu9SRK4FlnhQsqF6T569fxy1TSf+DKeFMD1XklBAd01
	WLxYkafO6Wr8mJwUhBv/mN9q4qmdVu52Rv1/VHyoDTTojOpijfrnUVrIEqriCYjrGOge4ANAhpt
	jiDVIRkvOH2aAuuQdfxP+djwGhdMjU4Cs1Osu7IzbjGlsPWuT0EpdQVIWyhLq2ovLiLxMWawB3G
	m6upoXPdptVpGvSD9dSxnci34INtc7nWhiQ7TMufgHHutFZY35qfllXQ+Tx/vn2ONaU4PUog0W3
	zDL9+XBY9iXHeIbcz6O5zZTLu8dCwT5O57mAPylYyUTeztiI79UdqR77O7NjDlfRR9Fwuud5PUZ
	Ln3CG9hzm9olaz6V31iq2zGVlB15LfmzjfShJw==
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr37455335e9.23.1793357741243;
        Fri, 30 Oct 2026 03:55:41 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm69144805e9.12.2026.10.30.03.55.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 03:55:40 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:55:37 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261030115537.088e68f3.michal.pecio@gmail.com>
In-Reply-To: <20261030101518.35876-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
	<20261002113012.271ceead.michal.pecio@gmail.com>
	<179136673328.386669.9410030239460428155@qnap.com>
	<20261008110642.56567a92.michal.pecio@gmail.com>
	<20261008102522.109308-1-henrytseng@qnap.com>
	<20261009173516.681681a6.michal.pecio@gmail.com>
	<20261016101141.42602-1-henrytseng@qnap.com>
	<20261026101004.37f02f78.michal.pecio@gmail.com>
	<20261030101518.35876-1-henrytseng@qnap.com>
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

On Fri, 30 Oct 2026 18:15:17 +0800, Henry Tseng wrote:
> I got a 10 Gbps hub (05e3:0625) and tried it on v7.3-rc5. Unplugging
> the enclosure from the hub still doesn't hang, but disconnecting the
> hub together with the enclosure from the root port does. The stuck
> command is again the one dropping ep 0x83 of a 1c04:0018 hub inside
> the enclosure, 2-1.2.3 (slot 6) here.
> 
>   [   59.162027] usb 2-1.2.3: new SuperSpeed Plus Gen 2x1 USB device number 4 using xhci_hcd
>   [   59.174788] usb 2-1.2.3: New USB device found, idVendor=1c04, idProduct=0018, bcdDevice=94.01
>   ...
>   [   99.662478] xhci_hcd 0000:0c:00.3: Port change event, 2-1, id 5, portsc: 0x202a0
>   [   99.662702] usb 2-1: USB disconnect, device number 2
>   [   99.662721] usb 2-1.2.3: USB disconnect, device number 4
>   [   99.662937] xhci_hcd 0000:0c:00.3: Cancel URB 000000002114d18f, dev 1.2.3, ep 0x83, starting at offset 0xfe68d000
>   [   99.675129] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
>   [  105.027976] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
> 
> So the hang seems tied to the root port going away rather than to
> where the enclosure sits. The NOTATTACHED check handles this case
> as well, since usb_disconnect() marks the whole subtree.

Great, we can confidently deal with this bug internally in xhci-hcd,
without worrying about external hubs that we have no visibility into.

As for actually fixing this, we are now in panic mode because the 7.3
changes in the logic for avoiding HW bugs on disconnection have caused
regressions. We may need to wait till the dust settles there.

Using udev->state instead of xhci-hcd infrastructure might work too
while avoiding the aforementioned drama, but I'm not familiar enough
with USB core to tell off the top of my head if it's 100% reliable.

Regards,
Michal
