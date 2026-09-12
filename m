Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD163344DB5
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203347; cv=none; b=BKrUu53DfNGNoNbXlSWnB4VlsuLQZG9bYdedLZnwuoqUSYqCP0PVT8uQ0cGN2IRiszsHN2x2FMvELgEStQ776JiYfeJg2HFRvDYNTbEZAIFn/WE5MLxK69XDRqrPH1mxM+rwcFPmINjouR7L41JgGHuQEFwezmwY1/zD41ctwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203347; c=relaxed/simple;
	bh=3x+Hh8N7Urs4wO4l3MOxQZn3pRYui7aVsr3+8aKiQps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBOqetqOCOi1M1RCWYIiMmN3Otj0/8xD/xgNQYtq48Y98X2BZFmXxlehHKHkCXgH6BziR33iWQwDYyGvHwS5hHC7pbSoewmZGQwABrkBBTpWtnWPB6uAfMJznENJ97fAL7PbUoDhcnIGPA/gSFrV8Xiqugy7L3rCn8YiBNkMHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSOES1dA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSOES1dA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so1660115e9.1
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203344; x=1789808144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfn95/c9x6fz6xYVpWcEIB6NdSF/TlhDu6Cquq6o5Fw=;
        b=bSOES1dAwHQp6fIUV05g7wFBi6ID05zQHhxe2ZSppgO206gbubRn3V/P64YR1H2bCT
         9zB3f+B+n3Fl2gdUt8GET9Iv0Ep4NHnmvLjv/wjiIu4BiyAUOSbifF7dNTl0mgXPUUuA
         fyM04lPVl4W/4Qqbt4By9UNG3MHUYpmK76hqjYzXQiU24s9yU6W5pLUE26nDvomqe/sr
         GOuVCyzdx1OktvZZeyuv0T9axhN6Bx8SME/CwGDAB72exCuNSnKRwUTeb99+KM0MAvn/
         0K6D2QlmmiV9g9XKFF64cGIhCUkGlOuAW7jClR6zrKsKGpafOAr0Hl5I+XF6To2TSQ/o
         VNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203344; x=1789808144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfn95/c9x6fz6xYVpWcEIB6NdSF/TlhDu6Cquq6o5Fw=;
        b=pkygYkrWvBI75jJI6VblcIs5uxUVATwOs9kWzEPrJTHNMfA0hUiU1WTxqLfBsLAMC8
         5KNb22kp5RXcgYzdmD6aDbOWBAqEuGybbaGr/cMlAbvcqD3ZfkpLwQSLDbI9omPfdVlW
         g9tHYhzD4GGF7xh6G+S0QmgCbs5dywVOg0XZbUwJXIg1/dt1Cp0RZMb6S+s4G7WZ6svB
         uDTxTWQqFkABtOQutxbqThf8KS0vhOCGFrzuUonzZV15HCJ1MmhnQZJii4F6+KwtX9GG
         lR+pe2nXt6Q8Q8RYFh1L9E4AAgumyPI1/e5uaOOePkU9y1p98EWx3RKDm3XOwLfb2N7X
         jbEg==
X-Forwarded-Encrypted: i=1; AKwUvBy68f/8RzRvX/vu5DrUo/c6KLg+mXZe24OE5uHtHpQ73G7lbx7lZBErclYZo4VPdyzgWPrirNI+O10=@vger.kernel.org
X-Gm-Message-State: AFuF++nelCYH4oKV+6fv/frwtGfUGVZRhsAshC4VKNU7sE0eCCr4Ly4v
	eFekv8LnfhY6Fqf0k3w+uAQv3jT1P/htEkvqqkVS6Ftub5kvBwTQHcfmuli0O3lV
X-Gm-Gg: AYBFou1b/zU+Iq25hqbvQBSm7NSVvMsZbCme1UHjsiWbpJilBcMIPjqW9gN/2p8aTJs
	rwQnzua6yXANsGbVyhYo6TUKZGEd/dM3+hW1LO8ELUr8rB8FwqfiuKPIiD0mPZAAlx07RziM0s3
	lY8LNrt7i/4BjfCHllb9eGS7mjr2cSrlnKBGbIAcVqbmbNlmew5PHp4hUV+wiv+BIYJLubngAaK
	9HFfYpZDuujITZ5aoVVoV18jl67itjsYH93MkciziidmObu/vVt3G9Pv4Ws5/Uohq41xYyQVd+A
	3dPGBoNyMBYtNllSM2us9oczbQGeN79zkaxe/480ueZqCkzOhR5beR9ZM2vgnMMmtrULdqfN0AO
	t+gps1YbOuAtNmwNrG3HhjwfYEvMvL3dW+hkeuKM1cj2dg0ulb77Z6IzePx5/nsPOHx4UQDolEA
	YumS3Bv6+wTB321hZ6WwHMH/kWXYL83Y7ZRHYx6ESl7gh0/NEkzExHnmjv89V2iE0ynMVxru265
	iwhv9QodNLWp8g7aR1GT2q/C8wBXaxyIluOBJWIZH2iUJeMHCR9PS8zQmwM8O0w4hQzqYw4k0iM
	6Wi4Tv/doMml2PjTTbkfKXDiK5W+SKYesMlpd2iNoyCUx1UoGJNrXUEu0UjtkZ9PNWFeOGFfJyK
	s
X-Received: by 2002:a05:600c:4709:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49e6cbf7526mr17800435e9.23.1789203343503;
        Sat, 12 Sep 2026 01:55:43 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm10588817f8f.36.2026.09.12.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:55:42 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:55:42 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: handle port status errors in disable_show()
Message-ID: <aqUTa9CgYNT9ua0S@gmail.com>
References: <20260810230432.44511-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810230432.44511-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 01:04:32AM +0100, Karl Mehltretter wrote:
> usb_hub_port_status() leaves its output arguments untouched when the
> status request fails. disable_show() nevertheless uses portstatus, so a
> sysfs read may report the wrong port state instead of an error.
> 
> Propagate the status request error.
> 
> Fixes: f061f43d7418c ("usb: hub: port: add sysfs entry to switch port power")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v2:
> - Simplify error handling (Alan Stern).
> 
> v1: https://lore.kernel.org/r/20260808131601.75096-1-kmehltretter@gmail.com/

Friendly ping. Alan Stern has given his Acked-by for this v2.

Thanks,
Karl
