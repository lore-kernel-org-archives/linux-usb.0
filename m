Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858291;
	b=S7g4gk4jGtCt6nqar3bP9iAJCuBWk6xeOuva67IaZ7rHjKv/C87n2LJTnAo4LhFMnibk
	 qdOd8P4JbN04fQZbmP/t3R/Ic5RDo8NVKElwcd4bibnctJzogbZ8j33IRuI0ynEVlLSLz
	 jZlttPYkWYGCbKCYmElhG+yuJPWq7HuOYqB4CUluXyTu1mxWsuNgoo0qOsypMmhw5a/z6
	 g7K6dmYEp94ldEnhuq2sIPRbdUKLfdLle0PZz/rr6GFeaa5ji88A8hIWuybSvGkt3+KI0
	 YFFy5lwQwXdFAzvpqYp3RRG1GLz9d27jOqvkpthSgkADAJQzrCtpMplGwK2UYXiBxZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Sh600sJo7+XU4Je5y0QQGAR4LZSJRxpxnFWiuCIAQ6k=;
	b=UM8FofVapHthvlBbgkUpFtUp6I5VezRx5bloHA7C4vyPZND0kVMnIpOMNFo2zHSaBAJl
	 eySP0wIFY5Oy6M3DFO5yqS8sJaQ9ml5qzDXHrOVUe/oBvLLruDZrr8TNV98mqSL2XXOS+
	 N+ZCsh8E1cwaKiFboTd4tiOQa9lnADIU3QH14W1xRO49Cl2fQwOhcxjSVWavSPKMaokLz
	 m5kx2uhHlnyrAj6hGP9Ww2AXQC1VL5uHo0fqX0VqvRuVNFCWws4/cZeHjNQROGJaCKSD3
	 A0B48i/59x3h1MP/u57wUI815Ej3FoLW8VGCFOFeiF68BoV5EgU989Isq0UIlHgwMYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XBGGxA4H;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC9606A89B
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 19:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCC9606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XBGGxA4H
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b97460a133so2671655b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794858290; x=1795463090; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh600sJo7+XU4Je5y0QQGAR4LZSJRxpxnFWiuCIAQ6k=;
        b=XBGGxA4H2AmVQtTQrzvyEup4IBw6ADxbtCHdgHdL7OqVvI16q2VaGqMwB6zAvnDfpi
         55P72k4ASbb3FfHc1DgFDSysSfIZ7cQhecsqG9Dph2KqYv28X2oBeljeCrDh08jvrGVO
         Gvqsqrepc6kEdUiHqXzEWxD7bS1q2zuXk4NgHBZ8m8F9mGKtaGOioJdorWpfBZrpweWe
         A7nFi3jH6RDKRITu7jRZ1JQeaOOQIsSXlwM+AIB+U6QIX0zcACQcmC9fR4jSClUqbLA0
         V4ut6hrCTTdDgymMsVUAjNN29sYTziiFCKVuqujjqUhQlMsejr0rFd9fpL9NfhmMND3z
         NT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858290; x=1795463090;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh600sJo7+XU4Je5y0QQGAR4LZSJRxpxnFWiuCIAQ6k=;
        b=bV2ctqasWRv1Yb519lX+B8YxDBqrBtBrbWAQ7/mdcV89et2j+OQqIo8UTMEEbaf5RA
         rxuJXgNQwBVrTduWFo8CiulpnYsrJos3ukv4SK44oKVtrksBRKOz3v7gazzmPczRKT1S
         3rQ7FIKt8pNbblmrPCeldkXVy/+iLsCOSVpI5ItqNyEOcEFhyxEUvAbDAPvogl5HJBYS
         pCeue0hMiRSEmwi0RbEIaq1nk+5O96MaxbmIJU8H+7vrEsP+didVmwmnj+nkEgeXackC
         OCLnJRVMOKEa5DgJodFnud0Zu/637IQZf7/m2I/uusXQ5MtBPoiDHdIBajUJuR1cnm8J
         9bOA==
X-Forwarded-Encrypted: i=1; AL+hErG3CbH82euZXTgiFDNfQDKKwocuSXV2RW9KZ8k52s7KaGe0Or4hbG0EfmOp07a4+ZwhQVAuCOJ/WyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DcJFTgboC3ShiP6qU/UuSmDBtRSNdrl2z8VJmPX1ttsN4uXyA
	DvFP0KOCbUvjwhCg7NQCngTHxNbSCBsjJ9ME6ewFMAL1V1EKUq5xzpCy8sHLinQF7DtB1vZQKlk
	uUB9TEeIyUw==
X-Received: from pfbgq41.prod.google.com ([2002:a05:6a00:3be9:b0:8bc:d2d2:9a42])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1acd:b0:8b6:2fe8:3e16
 with SMTP id d2e1a72fcca58-8beb56c9fb7mr10187478b3a.20.1794858289617; Mon, 16
 Nov 2026 11:44:49 -0800 (PST)
Date: Mon, 16 Nov 2026 19:44:47 +0000
In-Reply-To: <20261028222800.782988-1-kaf@nwlink.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028222800.782988-1-kaf@nwlink.com>
X-Mailer: b4 0.17-dev
Message-ID: <179485828707.2938203.11219663125374064721.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_uac2: prevent invalid bInterval auto-selection
From: Neill Kapron <nkapron@google.com>
To: Kyle Farrell <kaf@nwlink.com>
Cc: nkapron@google.com, gregkh@linuxfoundation.org, pavel.hofman@ivitera.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> When p_hs_bint or c_hs_bint is 0, the driver selects the largest
> bInterval from 4 down to 1 for which the required bandwidth fits the
> maximum packet size. The original implementation intends to keep
> bInterval at 1 when required bandwidth exceeds the single-packet maximum,
> but the search loop instead decrements bInterval to 0 in that case.
> 
> A bInterval of 0 is invalid for an isochronous endpoint. A Linux host
> reports it and substitutes a default:
> 
>   usb 3-8: ... endpoint 0x1 has an invalid bInterval 0, changing to 7
> 
> Stop the search at bInterval=1. Maintain existing clamping of
> wMaxPacketSize and warning about possible data loss when the required
> bandwidth cannot be accommodated.
> 
> Fixes: 355a05dc8367 ("usb: gadget: f_uac2: Optionally determine bInterval for HS and SS")

The change looks good to me but you're missing Cc: stable@vger.kernel.org

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
