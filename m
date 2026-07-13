Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E63382C9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976942; cv=none; b=TrBiWRrET1dfA5f0oU1d7qveg2NQ4XRYCLCJ9tsWZnV2HK0qNL9cPaE4c3q5SQ14isXmD0uTQEvVkfI3xHlkItswqrlAZfh55MfFxyUKT/5NgY5J37CfVWM04fZR9OXFtRR4c3IVPDUAF4/NZbx8frDHeMtuiKh+oEklqJaD7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976942; c=relaxed/simple;
	bh=3jQ1hH8GlZgiDKSnvflUdEkxhV2abBPDIrnY3Pptvs4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jedjuVVVPteIVy2ZsJBSU0VytAPdKwUhuxj0bmj/EfCxqczzuNMKDvQLIX5+dwE7jVcp3tqK2dHga+GTByGBTZtOzBcsogXLmtls92/n1IYqer5NBiRszUHmwarMDyqKgiNCRuH1/pOZVYWWId50a0UD6oUikl+qjwjcPztSC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDu2ZxQI; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDu2ZxQI"
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-81c6e4ce922so24115067b3.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976940; x=1784581740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3z11abkydzZ2iKlx8ecIFGRlioo2QGUfIr1WJRM/Diw=;
        b=DDu2ZxQIwHAT+1WUHK+lGcra70p9GFk+7T2LBlyTerpEuC2q1C/ByWyyVwtVPaFrfV
         RgcgDXBMmifKT1gFuRnWONEitVx9R3MwIC9sdRrDsy1nXJFjNYATaapiT72LCJJPHPW0
         nQzYMo/qGKX2LPQVq81+xG8gTPEO1ptDcq7atl0znq8jh+9nRWHHpj/loF79upJY6zC4
         Hp2dQXTV7LQUO6d5MvKqfClQ7WON3H/c/eL8E9O6txblqVrCCwPKcJDiCAowbAqj9Hw0
         05zTftNpF7+wdU92OEq6WaLMdkwdzS+u6fhYpWdX5kJ9gAl6mpmOqNop4yUecJzJOgIT
         czWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976940; x=1784581740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z11abkydzZ2iKlx8ecIFGRlioo2QGUfIr1WJRM/Diw=;
        b=UsLYjy0Vp/t3wzWum9uoGHEZlxvfEr7a1enIqAFhi05125vCwhHW44GcYR5rBxxshW
         G0wOLWxiWVodotOUQUlhv/2ss9NAvoTBqpC95LQ3WFegdzfId+1PKOD3/607WA9NIVQL
         nVNBrJ1lLY5TpkM5TIB5EEnH9AXuf8Jc4xD18WVMs3mWeSg5gjekZ3kCPdb3V9XuIpCh
         XK+wMLtmQzwhNjqHrh8Iowuw/MCb1YZAzUuwbYMmMTPDHV3Zuw12K8FW6iyIoIT4eYKi
         55jYkFeiFU3g1ciXJXCViHHJhs4WKF9IVkJKggopxIAU+TDl0yR955Wkd2zMK1R909qX
         2P5A==
X-Forwarded-Encrypted: i=1; AHgh+RpQmZgLXw342s3lsr2IpPeanBRKCqORnH2+2sr7YV1Gu4izV6Okk82fD4qUJK8EBm4SGX3qpj4sUJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4NIvIKs+uMwdyRVMiX0YKHxfH4xKFYcvRWiaA73R79csK1sfE
	38xKYrVsSHtXELq77I0ig5xL8AfWnW9IsOcyBaDersbO89d9UGkORkoT
X-Gm-Gg: AfdE7ckLv4kFas+XLphUmMrzHPiI/X6POkTFGim4gP1ovFVOVLHWq1xGLRd4/OKB7cL
	7jE6AxcsgbQZG/LDe56AUrnd4bS59rEUIJIsHTv27o/oBT8K7B1TbTwoHrNxKKk19qCUV/0ucPB
	7kCkB570Ld0xy5QKNjEz9iUuKv3PvZthnq90xOZjJx6rFqbuy6ALrXknEz35VhZWPJ423SD6qbg
	8SwYEPJnxsUP/MY9W/S2pGydfmz7ybRJA9kUNRmaheA94WeFT+9HLRkLxrSvcqsJEg+DRu4OMvk
	7XqNAVT8ma1igQZ1beL+MPoON3M5DiSOYuhL0mtfNMkvfU0YgC4wSNZhQdkzhK4j6bNmPr4jOwX
	O1bYj1u4LLxZ9dC08HFZWwRjJPkYZx1mTpDcEy+LPVktzn1CHrHL2YCqHFI9WXPCDuFfVgxVfDx
	6HPsPv95zhYkDMbfmbJNNp5B6ErI+Jt/5V7qgLr2obGvFqnQxkvhXMzqPZzeDiXTmIwfA=
X-Received: by 2002:a05:690c:61c6:b0:81e:b801:34ec with SMTP id 00721157ae682-81ebb2c92b2mr9367897b3.60.1783976940225;
        Mon, 13 Jul 2026 14:09:00 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be98dfbsm126045887b3.2.2026.07.13.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:08:59 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 16:08:58 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 4/4] media: add gv-usb2 audio capture driver
Message-ID: <alVScUlUiOS0ZiIH@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
 <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>

On Mon, Jul 13, 2026 at 04:44:24PM +0200, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 11:08 PM CEST, Colin Braun wrote:
> > +/// Write a vendor-specific control register on the GV-USB2 device.
> > +///
> > +/// Uses a vendor-type control request (`REQ_WRITE_REG`) to write the
> > +/// given `value` to the given `reg` address.
> > +fn write_reg(intf: &usb::Interface<device::Bound>, reg: u16, value: u8) -> Result {
> 
> In addition to raw control messages, this can leverage the generic I/O backend
> infrastructure, so you don't have to roll your own write_reg() function and use
> the register!() infrastructure instead. See also [1] and [2].
> 
> [1] https://lore.kernel.org/driver-core/20260706-io_projection-v6-0-72cd5d055d54@garyguo.net/
> [2] https://lore.kernel.org/lkml/DJVQ852J7SOH.26YBIJTQ9B66G@kernel.org/
> 

Interesting, I had briefly glanced at this macro and was disappointed
that it didn't seem to apply well to my situation, but I see that the
Io and IoCapable traits are generic in a way that does support this.

I'll include this in my next revision, thank you!
