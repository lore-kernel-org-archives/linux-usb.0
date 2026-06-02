Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B671096F
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429579; cv=none; b=quz6luX+7SzMdrv3Mj9ZVskKwDMEKTDC4pH8OsnNthCjZpWr7Ubd3u1/xbc4JF+L0jbAxSlPDFkBag9NrRXRf1jDD5PdEIeYYxgIypq8oUMEUcxo66bJ5qzr9up9f+UDiltIALVQWbhBgySndspPs0GiQLO4JYsDkvKH6O+7GD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429579; c=relaxed/simple;
	bh=qHTUAnVSBu4Vba3z+Ns25t0sDIz3tHDyzYbEJHVz0qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6PME3lQ7X+Bg+F6QwUHgpc+DDBJrK7Y2on6qMhsOr43kXst8WXerql4887SwiC053qx56Vdet7uuiKmMpMdhBT2hZ6lBM99JyngcWY+Ojzzi/+2w60XfsQfs6MUyN2Qp2iPeAi4q33jhqqFKOgKMhHDE3sTsNbK4W4nlukrWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Vg8xOjgm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Vg8xOjgm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91587626a3eso59549285a.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780429577; x=1781034377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv2ncKG8M1V+4Wh4CegWQP5kRr4DZns4w/PkoO/z2+k=;
        b=Vg8xOjgmFwy8mgAgh6aSkPgPrgXwGPqyhQFZ5PT37s39CftLh7cXIQ6wZS5hhW8FdP
         RajYw4fhjesHUDnyVaFc/QSUvtcAIoZZVeke+XESTXOFDAxpMT0ip/wpOY9bCwuYow2+
         tgHATKQl9zniYgHxRmpDBfk57RupZGIR2q4JaPO8yuu39hXkKci2AbLTd1Tb4twiAf11
         NG0wIgjvgEUV9ngumjCW3ZBI0l+B44MPfGDRqhd2df1hnn5syoPOKDo0pwU8Wembdj3S
         Ifgg5+MlH8uSAl12fnaefsW45UseAYu1rSp5M3vrgKHsh5vsNJh3Iz3EEsPi5jD7Y4EG
         p24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429577; x=1781034377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bv2ncKG8M1V+4Wh4CegWQP5kRr4DZns4w/PkoO/z2+k=;
        b=pcWrStusgSsGqQQEzEThZLtvkhg19IPAKzs54nZGZQV0cM06W/AwsbH3s90lWos79O
         KGDjvDcqzptLUysq8KEDgR6dBtSCeEYM8Ru/hoadtq7bEfk3mlDcu537NK7UXmLpq+Y4
         HwHDvAcERJQOBSYmvFmut1gdKhA7o6uo/z6KHpPljw2CWdNZ2zzhLGBsF78F5wqX+WAC
         bzz9wSM+pMXKlCCxT0+mWUdAv63k3bgJEg0ixuDOyvU9wye0teN67NaXcs03dy3iBf66
         pZWzbX4S73ygOQuP7oYPIQhka2wVl7exjogfBeI5mUn5zc9TzotaiTjApIcA7e4vc5q/
         HysQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ScCRUIfszpPDUlHHaqetSmh8jWIj6B3yJtcgLHmZ9EG0j1D+yOax3jDl6pQtF5TwRAtrEsVrFzbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrm7fvDrZUlInsqF30aGJ0/IH91TlmyFF3kOyoq9VJiX5pkMl2
	zbWbYMsj+ak0UOkYMLhckXvAmtNTqvnL8fquSy9fitha3MYdJqk2x/GLthMRBz785qkih4C3e0B
	zyE8=
X-Gm-Gg: Acq92OGIYtaVkOsouDpPyDB6vUYLbkWQmFuDQ7hSJCdm3pBAkCoJDCB1yAOSGNMxyQ1
	5HPGM3Ns0FcJKsOPuca3W6fKmmdklc5I0U9OmNPEsygero6X7RbouKf/zARXzKL+sCu90PZRPRe
	50LBplgVNLbT+Y1Hw5xFH1SwwYVHFbl6GOT2i2SxQpaDw8DWZ41hVttLDppx/UheMUXJ5RRC72z
	257qWsVjm0qBfQOfKYxSoRdL317y62mhjiSH3yR6qEf+TLB5e34aJRR2NrceL6vXH2DmzF1VP52
	MRIutJVpHOqXmj3QwZNXEVJ+0vd8eYo0Xk3k8jvgynLHAaqBQjwV1zykgHzLWx8m80PQ9y2d098
	NVEFI+3QJ8TUorhejXndYKp87DuVzsaBzv+R4ABqHOFP5Z5VNx2WBz58EfTV0s4ceikG58EJgh0
	wqvnUizA7GEaOfGaurKS2hlNOkzJoFaArVtp0+UQQGcEIRWNJzn0Yalg==
X-Received: by 2002:a05:620a:1722:b0:911:de69:ee21 with SMTP id af79cd13be357-9158a656dbdmr95038385a.11.1780429577015;
        Tue, 02 Jun 2026 12:46:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c50bsm34802685a.24.2026.06.02.12.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:46:16 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:46:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Rao <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: storage: include US_FL_NO_SAME in quirks mask
Message-ID: <ec1d29f4-7b81-4cb5-a795-59a927492a74@rowland.harvard.edu>
References: <3BCE5880F9A45C2E+20260602053842.2920137-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3BCE5880F9A45C2E+20260602053842.2920137-1-raoxu@uniontech.com>

On Tue, Jun 02, 2026 at 01:38:42PM +0800, Xu Rao wrote:
> usb_stor_adjust_quirks() parses the usb-storage.quirks module
> parameter into a new flag set and then applies it with the quirk
> mask to override built-in flags.
> 
> The mask is meant to cover the flags that can be overridden by
> the module parameter. The 'k' quirk character sets US_FL_NO_SAME,
> but US_FL_NO_SAME is not included in the mask.
> 
> As a result, the module parameter can set US_FL_NO_SAME, but it
> cannot clear a built-in US_FL_NO_SAME flag by providing an override
> entry that omits 'k'.
> 
> Add US_FL_NO_SAME to the mask so that the module parameter can
> override it in the same way as the other supported flags.
> 
> Fixes: 8010622c86ca ("USB: UAS: introduce a quirk to set no_write_same")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index fa83fe0defe2..064c7fc8e368 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -570,7 +570,7 @@ void usb_stor_adjust_quirks(struct usb_device *udev, u64 *fflags)
>  			US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
>  			US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
>  			US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
> -			US_FL_ALWAYS_SYNC);
> +			US_FL_ALWAYS_SYNC | US_FL_NO_SAME);
> 
>  	p = quirks;
>  	while (*p) {
