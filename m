Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65873BFAE2
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251293; cv=none; b=f87Iy/eCO3rwHAtv9WBFAvFkiNQW28y2ROdpbxDEDyyVwId/VR4bCGxSxh+oMnydvHh7UxtusLcVyBJxTNE7JzfOITW8jg4x7eHPBIJAQrWI6LIVEkOXk+UpR7+OLxcdXjQ0HWZVuAEzTbYz+ZSh4UovLje1PO2xFSpKw0JtcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251293; c=relaxed/simple;
	bh=8hx4lWUeNsl6WuKb5D+JS28TM0IqYc7QKB2TLo9n1Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=US0qb6p6+XGV2z2BX1W748M4Y7RVNe/o0JsuHFZKJLiRPMW7LO4tm9TbzufvIH/coVDeIp2hwP0rl1zn8xNJtJqNKGaHo1G664Gptn/0e0WdLtqlvkGjLmEmBDQrmNuMbK3rKpPgGrowcb70jYdtJ7dzG/yxf9okpaXV4i4oaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FBuCIVFX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FBuCIVFX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso29943585e9.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788251290; x=1788856090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVfvd1UCarSJibTs2Zkpk5X8/zVFhGRdvXygnFF/0tI=;
        b=FBuCIVFX5bibuvQUxwz2FA8ozSPuAVeQEv/XzhNF+bRdn/ViHf/q+q11E8ogwnnfIe
         1ifKOr7mQbUhd3UFHnS2uJAB0lwRYeJvALh3Z1vwebu+fSmQ9QA7FFfaLsTvuHgMO40X
         XImps/P+RyiE89pTuEIcljNOBzCOHhgmOqiVdR7Ow3IHZOzHZSuT/BHa9XXoc4eBbbvS
         3AXAr8HqoQGXJ1xfp8/PriUufNeUOpRQxkF1e/6xFS7I3xAl52gVNx1ZYaiDGre2ijoQ
         JLXPf0vs5RJ/yYLVRGny9cgEBdrpfgKOgSrarfjEe+tKfAGQaP6vFgdx9f+mvUyqnErr
         YgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251290; x=1788856090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVfvd1UCarSJibTs2Zkpk5X8/zVFhGRdvXygnFF/0tI=;
        b=NRMxhknBQM4Nctr8vpbiCO7jSbTBMXgInjNtgV6lU4zEEUTmx71cieuWFJbmwY8fXn
         njpD+RyG6u9eOktO/Tdg9lzZ/Z4uiC+OSmoH5Lxsk0QdSIiX7kFuizAPo+lTa5fPP8Ql
         XQgok8IOazQlR/XlHdUWtkxmtS3ROF6hyN5hrUNSgQG5BrXF4eOg/awPZSaWrSyRm8yu
         bxayIWR4/4OiSnupgmRFPNUliyFPYZ9cvEaAET6/M8qJncYh5ZPlC3p13jzaJUoJg2pF
         M6PT3+zMasvUqxqtBpqozJhnxBnArOX0x1+hKVVKzlPho11jGkw9XaHbbUkhpUcSRIl6
         n0Vg==
X-Forwarded-Encrypted: i=1; AHgh+RqGRsMGKnN4SOugUVbwylyF7XiOMSVazOeH0iUQ5Z62HOjLjGb6gKC5ep4Q4ol0uHqcuKP+I5GoStY=@vger.kernel.org
X-Gm-Message-State: AFuF++m5lB5qWtAGnRh6t5Sq9W909usvhAx7g+18tlC9Aj6LiPvRTNhu
	PT8LDat8vwWA6uSraKdZDo9jSXqaKJjBW4z2SzeaD9B71ba1ZC9ydUP4kDbb1f2paUQ=
X-Gm-Gg: AR+sD12GOV53fclDb2F1QFID2jRD9BryBeCWLXg6sTTxZm5dm1Ch7l2FOO6X8HkRfl8
	qArYzA7Yq6BUx/XbG8qwdhNnNVYt0coRXGRWLxxZZnsZzkA3YsqGBkmpUhECraPYfBwf/l58bHc
	E2qWeJzh63aY+NduwYB9DEMe9oBNHzQlUTqE1TC3DpZy6xf/f790NtUS/WcyZIOjQnQlCesSKDW
	j2ctmT6wCo7HQK/c1ga0s3Ujze23/0piSBvnt/CGri8ObwmHt2vDuhDGRucmnS7OfiP4asWshPI
	YcxnNaSFIZbtJQDU0X4BY17C/GmxYlRJ6TQkn3zxS5lV4aQ0WeqXBoQBcKGyb+Fn2lx+IVXuaOh
	WRKlD+11QGKmzMz+MCtmtbWo9xyT4+4yCi0GH1F3Xif/l39jmVhG/VDYzUc/bBtzyXVcVHJ5xCG
	bY/l6v5m6LazBKZaSdo519nt8gIQXwpwwoqY9H2bImLx5mvDRVjAknjYugoR9/Z/8eRzRU3WTzO
	nt5vzgvMJiu750PjAN8crl5rJq4qLEylQmwtIPF
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr437716855e9.12.1788251289880;
        Tue, 01 Sep 2026 01:28:09 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:3c01:dee6:bd49:2b83:2f74? ([2001:a61:13f5:3c01:dee6:bd49:2b83:2f74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0d936sm47212295e9.6.2026.09.01.01.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:28:09 -0700 (PDT)
Message-ID: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
Date: Tue, 1 Sep 2026 10:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
To: Julian Oes <julian@oes.ch>, Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901034949.118739-1-julian@oes.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260901034949.118739-1-julian@oes.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.26 05:49, Julian Oes wrote:
> A USB serial port can go permanently silent when its bulk-in endpoint is
> halted: the read URBs complete with -EPIPE, which the generic read
> callback has always treated as fatal, and no further data arrives until
> user space closes and reopens the tty.

But why do you get a port stalling?
It seems your hardware is quite broken.

[..]
> Use a dedicated work item rather than the existing per-port work. The
> latter is scheduled from every write completion and must not be
> cancelled on close, as the line discipline depends on it. Stall
> recovery resubmits the read URBs and must therefore be cancelled
> wherever the reads are stopped, that is, on close, suspend and
> disconnect.

Well, I am sorry, but no.

Your conceptual mistake is seeing the recovery from stall
as an indivisible process. It is not, as it has two parts.
Once your port is in a stall, you should send the feature
request to unblock the halt. There is no reason to cancel the
feature request if you close a port. You just need to refrain
from resubmitting the read URB.
In fact, if you were to be really comprehensive you need
to wait for the result of a feature request on the way
when you reopen a port.

> @@ -128,8 +144,16 @@ void usb_serial_generic_close(struct usb_serial_port *port)
>   		spin_unlock_irqrestore(&port->lock, flags);
>   	}
>   	if (port->bulk_in_size) {
> -		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
> -			usb_kill_urb(port->read_urbs[i]);
> +		usb_serial_generic_kill_read_urbs(port);
> +		/*
> +		 * The read URBs are dead now so no further stall can be
> +		 * reported, but stall recovery may already be running and may
> +		 * have resubmitted them. Wait for it to finish before killing
> +		 * the URBs for good.
> +		 */
> +		cancel_delayed_work_sync(&port->stall_work);
> +		usb_serial_generic_kill_read_urbs(port);

And that is a race condition. Rekilling does not help reliably.
If your timing is unlucky enough any subsequent operation can be a nop.
A correct sequence would be something like

poison URBs -> cancel the works -> unpoison the URBs

	Regards
		Oliver

