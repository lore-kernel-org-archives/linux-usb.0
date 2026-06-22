Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C75393DF2
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122073; cv=none; b=r8S2PWZE6K1H/5/PzlMKzZQ2CRvuki85uF8/lSHib1ht7K/xCvGdBrmgZsreRvv0jdfrar48fVBUH7QOEh1Z1yqp0a9oMYtldm5dz+vLoV6QpzVKTd4lA7vJFSFWRVwHG+FtnKNdvYypJX7J96mbcQJDNhD/OJtwR9nCcLKaOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122073; c=relaxed/simple;
	bh=BiQL4Ri6hGHhI7+3UFpEHk++M44Z1saBPvMN7yLGlQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hm74ggPNprvDhGctZZWTRKH1wEURmYGJkoawhQSdrayHU7ZW+XBnFuLkl8EPiNwKSa2IxmU2pdmi1fBpRDWpZwlH1whSrbOlBT/OrfpvHaoaKggPyk43Ds9VEuG1GGJRfzh5DTs7ETOUEJVa9qtKvm07WqyS1wBWaoOhQdinXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ely6+mvC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ely6+mvC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4924593f45dso24606285e9.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782122069; x=1782726869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SoAl60w2wtS6NmsbuiY2PacmATdoywAl81QEQux4sIM=;
        b=ely6+mvCnu2HWTPRiIvVNmjpIE3FqrsJofr6ikKparf8zQSQKELtEu6/2L1RgEzX8u
         f46ERY7EGB6srem+Yzpg6jLmMIvSVCIplf363bZjes14j9xScKNFBRzxM74Jio0kQpwm
         9DHZVIlgh9L2tCqJFLr6mDl6P4dWg/rws9tq74455w4XZSt54FGkc5Kpcd9PLUUV7VMy
         zJHWaZyzOSxCMg09eijB01N79zeMsQ3GJ0CuAxBYnXqKYnSlAWKqORWFTTrmTZ3UG+h+
         fTyC8Tyxw5ubQ6EmZgnfg6CWe5AblXurKALBaPs5gbDzodaPeqgrHCVO3p0ZQGZ0uNlF
         Pg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122069; x=1782726869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoAl60w2wtS6NmsbuiY2PacmATdoywAl81QEQux4sIM=;
        b=KwMAW40hm9uYAtIpPDWwnq7ECiPsCgBX9sNyta4l12vVA/4d06uQl83irGB6Hh2xVV
         5KxkiXMaOskmr6z1TRlsKK+sKBL0ngkHURzWOCbCq53ws+yIQjhS6zAYl3QwbcC7GXRn
         wEEncpJl0spmLcAEfuopLj2ZVT3mck9h1eFDS0zq1wNPUeODoWS4vsMqu66hUxeK3cbJ
         MmzitQYOHopnRvxgbmIn82GIOdgnoM1J3NZI6zAfggj62CazR/Yw91MDDEzIiAcGoBlB
         BuC0CWhZJuxEBuQqlre/ZjayKdGgdTkzFfXatLIRWRRg3H/o6BuMp9hcninBC2FXPoEs
         7uZQ==
X-Gm-Message-State: AOJu0YyzKzAgbgAsxUQPkbfMRc59cDWORA/SH4g5HEtKjNpiiMXuAjqM
	hILYKLNZrDgwMHzlQQynrFFJeQV8MRFq1MCVLR2teNUmhfG4nC47+0a/h/4bxWWeC70=
X-Gm-Gg: AfdE7cmgVSmoLaZcCC7H4X1/PLRZD1hG3RnzTf1gPAkypepLdGrmNp6lgueDuyqSyIg
	nvEGVD2FXE7cRY8iptXjJBva+XdOPwe7D/WkDsjkx/xQU0ExLnFgqpUgnsJj36nlykB/bf4EANm
	TAjb3BEs97leM2RTojbmh/Xk0FoFojAz7pxSqv01VmPSEJ9UvFDL0KboEGWKn3ZPsndqs9Z57zc
	NaBs5SK1ZC5+uLzdSR0Dkh8kmwQPPrxKyzK33lCy6ZmkYoNA5PjsHczMMihRrAttIuRoGizF7CS
	Zr+FRPTIfKPFpex0uTMTHu6cyG5ltTJ4dZ3GPV1oChEtrw8SR4o07jw17koPxq8vOnJ+j/YBbRg
	Nuk1S7pxLCfP51rbUwJ7Nr2WFh0DnCe4Hx/FKHUqQaFcP6VSh62es4caqr1hDCuG/iYB1p0ZEbK
	S/uyzeKmQq12MlFRxLNt25mbU3bJJdLKKGgDUAI9VXutp/9/UwYotfuOI=
X-Received: by 2002:a05:600c:1f92:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-4923f593d92mr235161675e9.27.1782122068647;
        Mon, 22 Jun 2026 02:54:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:13d4:6901:78ed:1f08:f691:11a2? ([2001:a61:13d4:6901:78ed:1f08:f691:11a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc63fsm178656235e9.1.2026.06.22.02.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:54:28 -0700 (PDT)
Message-ID: <90bd1abb-1ce8-4936-bedc-59bedb3c8201@suse.com>
Date: Mon, 22 Jun 2026 11:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/9] rust: usb: add synchronous control transfer
 support
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, linux-kernel@vger.kernel.org
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260617145946.1894-3-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260617145946.1894-3-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.06.26 16:59, Mike Lothian wrote:

> +        to_result(unsafe {
> +            bindings::usb_control_msg_send(
> +                self.as_raw(),
> +                0,
> +                request,
> +                request_type,
> +                value,
> +                index,
> +                data.as_ptr().cast::<kernel::ffi::c_void>(),
> +                data.len().try_into()?,
> +                timeout.as_millis().try_into()?,
> +                bindings::GFP_KERNEL,

No, you cannot do this. You cannot just blindly resort to GFP_KERNEL.
These parameters exist for a reason.

Basically USB devices share error handling among the drivers for
all interfaces. That means that all drivers for the purpose of
error handling (and power management) are block drivers.

As such they are restricted in how they can allocate memory. In particular
you cannot do paging. That means that a USB driver must be able
to specify whether GFP_KERNEL, GFP_NOIO or GFP_NOFS are to be passed
to the USB layer.

You must include them in the API exposed to drivers.

	Regards
		Oliver



