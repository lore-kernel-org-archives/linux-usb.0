Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795487936;
	b=syrvu28bk5aNrZgaDRe8YS7aVeK6c6xRPM6tf4Xpd1dfti9m7Ij3bqbT9E5SSwrtX4Bq
	 AvdsBpz2ymvWy5r1tIrMs+nLgeQYszevx2vUOWBNRpFADzkv51b5ScvF1p+rH9AFIRLjx
	 9aXIuXUDE55PgcNHlYSLZm6uMVIsRo5z2wWsPn+b6v7Ek+iON6BkT8XWnoosWMUkrylgV
	 eepqDibFnu5jZ5zeQAldG1YRqt1wkMPWSdbbX3elKsdvg5sV6PSsuYJgaTBkhJUwtTWTq
	 WJUBnxIyAuzK3XxzBh2FJrqOdkKjOK4GCg+MKFlEEA9MsrcQZY3GiDzih+BQrA3iA5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
	b=j4Cxb7I46BzydqSu4wgCHuKuEwXTr1Cx1c/7wXp6UWbyl8JwB0c9QGourvppkwSU9CTK
	 5Gv30Yassjolr6+atrJkXVi7avR7qZSwQdMRrc6X2EN93gEjGKb+lMhzSS28zrOV3qSHB
	 EuVjM6U39KOC62W8pfsDJPaERbIRgWDdrcX6+Uv/7ySrvj9+QWTC2Su2A44LOTp3T5suS
	 ce9hINk+P5EikK+JXpvgn5QwG/XSiYHoGszKNdTKlyZMi7DkHqcl0GBysuCgHtv4odiPS
	 3lt+SZiTPCDTf5J3OkUwnVtLmqWDQFbhlg/djEoT0ixnQWStorieTH9kJ7vmyxEakRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xoD+G/iL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DA606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoD+G/iL
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14a204305so2606845e87.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795487934; cv=none;
        d=google.com; s=arc-20260327;
        b=MZO94tHCWeJShetpqBQRSyWlF0it23BfvGIEX+tmaEhzTWh4CxjyCAVhbcAd3A0K7h
         hh7F6FH0yYtvJDNjHupkdWNL4EhwqEImy9WMU/HrBjbkMZqncwNm+C4TmAxPtOBPaatf
         lgAyQk1LUD1t+ZDRDQQlT/vPyNzold5PWRLoSi5YVJj1Jux6CpoL6gSat8ioIpXFaaO5
         RYPgjWN7uPUr0Sr4nwba73NUj45tnvcpqHjFBXCb2pioP2nP3yrBi1DeKw8YjvzbdVmh
         Ph0Rt1DzfDogpsAe2XcRYyU9vZiq1263ErM8Mb4F5a/54Lx49z7tAQ4jrW7WZRPtFFaM
         CB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        fh=2yS2hjtq7BoJZ2jAnV2u1ik/dQIrL56z7J7OWXlI36s=;
        b=F2ltdC3FQ+prupMZfZ5JmHFZda3WhHP1fE3hHtSjjDYOKQV2IJMlz2VfadbaBUTKre
         uOjY1EpvcxpzKfz39nIPCTH16Wn+rGtBWbQYJgnRzZxKAI5rYj45splGMCgwgWDyvYKz
         RfjmLI3gfumW98SaDA1T3reo8I0uiljgfQhh6CPUy3nombFRfx6dPTtaK1o+2Rj29EPI
         LLICavSdIbF8Vyz6Hatn7Yh9KNX8FM/t3bJJgqmQHyTlvfBT8OmsKn5XXhB50BoI8xQJ
         /sfjeQZcvN0FK3pl6enN8gfar16gzKDFFAtIqI3ExZiSS0XeM6G1ZKNI9DDtk1VYWERD
         SeXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487934; x=1796092734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        b=xoD+G/iLC2Qi60bhFhUJSnXDGTaqc34WzPiTT5HSgB5D6PeK9bEHMrEh6LJfIWgFMO
         2tdso5HKdkNqjhedW7aYa1p8BOguqDYzXOWFX6qfzZ7jhviAfKRR7KdCCD+tPoMxQ9ck
         23fnU4g9Wxyp+aiAP6po1VS/Ato3+cG5TepftNKXW7z+2YuWzdAvo4tCFsIwqR8H32Hy
         MQzvuUwhTVHlJ2yv4hKjU3x+gKGKtGoNOXFSGF6fa3ZGTOcr7DL35XsxfcL5tLroxPXG
         dlaAaX7LhPqjLI95gWvpNFcN9hycUENH3iwKJnFUh+29T3ulj1AXlGiwBsxjy71R7iCf
         milA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487934; x=1796092734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        b=GVMN42JlurzCn7aGijX/FsvaYn/74ftLOtPVjpXwR7Yhz5ZbVcK5RJtb5SFuxKaxs8
         e6ADWiKQ3jyEmM99Tj+bA6MkiKLw0mbIj+IeKAifMuMP0pzyPtZhVU+DT3DM8dHjJ5bZ
         kd0CQFsZrfdOFXzR9Bxn6Sq3TQKzbY/Fqs4iWjW/SpVHmenC50fFyDwJw4JqQTJ/ipV0
         uquBo6/ARhNaTcXdjtRv+Phznwm7Q3V0EyqEyz4eAach4hf3xetpODzR0OT68jLQlRT9
         qjeeKQV3EbPH9+GCQLcMD4hivnrnGBzfconhKLQfL9ZcMIYaQgW+uoMWYNYuxY4uhDpu
         WM/w==
X-Gm-Message-State: APuU4Z9oyRmu2oi38IpPSdEqPN0oFmVHleCOD9L1bRmfP7Pml7I0RHoQ
	AAHI3WzU6fUOm39vH0XMXHG6aI3fl2FSZnwxfq4VIpW554QrFAa6HMKos4adWq9mdc89kbvKlFC
	LnYAzYpxm7kHSRpmkfkT58znqf1FGW1I=
X-Gm-Gg: AZFdTZeyeDx+WNagXlBhmPtBgB2XwgubKBhvYcxwkP2AJg6E8PVRDkhap28RyWiXnRp
	IyPpUC1cE6HxovocgOhhcO6PliKyZVZ7Baxu4p2BGehqCvowOY1TwMpYasFTPEX1lxkzoyHkeDv
	Ha3/iVqGj/JZdlNGSLfi1HqfOxKwLap4JJZgO5CFPhX+V/5LuEH/2HqMbmzblXSbcYrS3As2vAy
	GCrdQnlMpdG71u3G+6o+Cz8MpMF1qTJpI0XbMFYRQxvU8wo8GFofuuNluwdWaxp+rWEHNnCQe/M
	fxDlrfJMkX5KkdZLyK4oNCaJZquz+z4wgZuOQxdg8bjN/QPXLuQAcAwlcdhS2YbP/0XrZ1R3sbQ
	DvDtbIQNycp2EQmUQ9Syx1tfrHdJgW/YDGZGKuHwJ4B8IeDC0YcnoHPKOCj+OjOW4Km/IY00r68
	kCa+KeFXqXLynwugVW
X-Received: by 2002:a05:6512:10c7:b0:5c1:56fa:9fdc with SMTP id
 2adb3069b0e04-5c1bc7ad55dmr3682973e87.21.1795487933842; Mon, 23 Nov 2026
 18:38:53 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
In-Reply-To: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 24 Nov 2026 03:38:40 +0100
X-Gm-Features: Aa3M54owmmaBS4fvAhNZ-dyZA9dp91Th1OcHhphTXncOy8CVOF5xtAczTloDKLQ
Message-ID: <CA+fCnZc1qd7hpgp1sN00CHw3JzhkhBCtHMjQhw_OKbzfVMeEOw@mail.gmail.com>
Subject: Re: [PATCH v3] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
To: hanzhijian1991@gmail.com
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:28=E2=80=AFAM <hanzhijian1991@gmail.com> wrote:
>
> From: Zhijian Han <hanzhijian1991@gmail.com>
>
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
>
> Release the request before returning in that case.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3Dd83b3c49738aea97c0e5

Why does this change fix the linked issue? The syzbot reproducer does
a bind-unbind-bind sequence without raw_queue_event() failing AFAICT.

> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
> Changes in v3:
> - Move the changelog below the --- separator and drop the duplicated
>   entry, as requested by Greg KH.
>
> Changes in v2:
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.
>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..33d70b552b6d 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
>         ret =3D raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
>         if (ret < 0) {
>                 dev_err(&gadget->dev, "failed to queue connect event\n");
> +               usb_ep_free_request(gadget->ep0, dev->req);
> +               dev->req =3D NULL;
>                 set_gadget_data(gadget, NULL);
>                 return ret;
>         }
> --
> 2.43.0
>
