Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814633;
	b=W8BwQRkOro1KI7lucXNxTn2EE2+LPZyk2ouZP3k0oXewbMTtl5LOF6QlhRcdbCMjdI/k
	 +HQd9NYFurfGt0GXexc370nUw0R/csBmCS2034fnJ4jzVwZqN/bSpcR5CXcmF1mSs99dC
	 s3Mq84+exHvsKlBKBLUVKZX1j77viOq2YTx0MJoa+oHAUXRt8w07meSoNzt2ntue1Kn7N
	 uMNUEWJDu1SH34hiFA5GXMAU58fRvSjI491qyTms1VyemoA/30n16GHtCQv8zX22wT2IO
	 FO1mFO+axyzFE1t5Iu1++R1u1XcBM8aDkPg6RlRGJ8lXv5iEwT1XxIzGSB+x0Q7HYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
	b=bUZ8Qrc43F8Hb2rPh7iAdpLbnBt5bwcwscsfGPv31k/m2G5lDmKGSB0bFVLi/t32iYvk
	 UbSJetmcd+Vy90G4UdvPweX8lgJBlK+7HXr/A1uMEfTGXsZo0arrFwrY9IPVkE66PsZRl
	 NJBg/IxCg94pVrDPUfw/8e3YzBtLA7jYxRplXrnACXqIkbwowWyt3MPvbdEVARRPPDHb0
	 8RLQ1N+L/NeLavqOvxyoC872oPtwfXVwytTuTFfaikoGnVcI9SyQxtsKbflrRoMhvec6m
	 GF451Xu58iUPQB1s6ZQMIdRSkMVbkXv7fE8E1ytLlQryz1Dd6UKwJO4lXVlYuyASr4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IijA1Apk;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC97606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 21:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IijA1Apk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so83226765e9.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814631; x=1796419431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
        b=IijA1Apk/LX+GHQL8a+IPGwp3W8JtVJOoEiUSZiDxVJQ6TGFrl74k5qMbEYi5yLTRJ
         uZkmgKaEwwtBy6Z6bnNjSGQKpyL3DQb3DvPWjnlzf9IkhjzPCMmhrNH4WvvChhDUhDYP
         YcFq0JMH8xJvyiLml7KiR7Y3hg+pXnq75RvcEk2g4Ow8c1e2GU4e2lyHt86GzOoDpFtY
         dlJDYdKdQqmWoAQUMENrdqtq8gWbHeKFZydqirshnnrb8a3THj/EDIu+x9/i1mLZpdXK
         zNmvjXVwc2B29G/e5zmGBgUl78GOMivpfSgAYZUcupc5t+aNtz+137DEHgiZ4wI+uOQ2
         nraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814631; x=1796419431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
        b=F1GrLoaNEpnlEMAXUAGa+Q538mwc4cihodkNi4toYs0TTvCMdIoTmrBeeFkiIVdzwJ
         W43iLpAMfESq2L8wfLwP8KRh8seeIYMwDmd5blEOpzGbV1lbDTOievVc8i9eyvuE1TAk
         Pc/c0KM4gggDIXhbnvMRSL+NjSk2MXoHUvoE3UFn45ph1kn9KN4YlNXpaots6R7kchPt
         Vn13RkstQbDhFBflzZVhoJmbLSZddSn7SGMkSa4D/D9aK7Yb4ol8TN28J4vGnZRg+8wd
         lipsEOlowQtBC/+vIrW0tzj+IsK8tKKFeO+fzo77Pxa3nNu6ft4pxbCbDqGaTlNKdBj6
         Zcpg==
X-Forwarded-Encrypted: i=1; AL+hErFQy51w3hrD0A83mdCWejtzTGRsyNS85QCH27gcua+0rPyJUrGzfQRQj/fCQi367X/wDWaqabsFvBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yditGXFiEQD+9xem4u/IWddTX48eNu3bbbOhjSkvR+zvgAuw6
	EktmroZL50CVjSFfVgQiD2YoNyVsoPOOqV0IwIUvUMM1PHcg64fql89A
X-Gm-Gg: AZFdTZf6WRZMD8KbbRQABT/DmsqJn9DKN6Ym+AN4G6I45+C09OPsknZPFtAQzx68CcN
	6UQJnagcZ9c5TKwJDPX6vISBOEkRwRgfr/tXKnEX4j5GcZEXhsg7kpQDfjpMVJ0zRFuLyCHRd3V
	FiVt3GL2OBZbZk8xxCXXmoCV1Npqs3q1ED/J7J6irvk9IZ/wttWDH8L0o1bqDOjzaDdd1GnF67Z
	UxmcOqLzOfX1FMDT5I4MoBnbcBrr8hw0f0GWNaCvVn7AGkGnMBxqM36SrhPOxUK3KRC1+pKLtmf
	3M398jCsMiIYVlq3sWy03jleLmk3pMMRs0zdwbPuNhS2JfLebJNUbmQLwVG1FrcN032T1Q0wash
	+fZTCvw7sY+dWgFxnnkIolNYpz+Kxro5vX6dGUp4RiRsH0pjBQ5/9JdJv3DC1ohe8pxG+RZZMky
	6bJIQr+m9UufcRMvB/Lj24PWOsF9t6X1tPiq3fLS5pIg3OKjdyfQBOJmGSeCGkzbX/JoeBSj9Jw
	xQUBXBJhBXs9ZAWwUKM2mJV9H5jBDyFy06+Jn+5j9pAT638oVwL6Tepl9RYDeZ2jaMOJguA4pca
	BFC3iA7/4XDBYKTRjPieKc54KUlxUGmw+xROs1BxVDrAMULoWW1N8ocWeUmqe9DjZQ==
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr511383095e9.10.1795814630486;
        Fri, 27 Nov 2026 13:23:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm478848635e9.1.2026.11.27.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 13:23:50 -0800 (PST)
Date: Fri, 27 Nov 2026 21:23:49 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: use isdigit() in
 usb_console_setup()
Message-ID: <20261127212349.1b393b5b@pumpkin>
In-Reply-To: <20261106090304.2410-2-blum@kernel.org>
References: <20261106090304.2410-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Fri,  6 Nov 2026 10:03:05 +0100
Thorsten Blum <blum@kernel.org> wrote:

> Use isdigit() to replace the open-coded implementation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/usb/serial/console.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
> index 29f09190846e..25ea57c8fd3f 100644
> --- a/drivers/usb/serial/console.c
> +++ b/drivers/usb/serial/console.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/console.h>
> +#include <linux/ctype.h>
>  #include <linux/serial.h>
>  #include <linux/usb.h>
>  #include <linux/usb/serial.h>
> @@ -70,7 +71,7 @@ static int usb_console_setup(struct console *co, char *options)
>  	if (options) {
>  		baud = simple_strtoul(options, NULL, 10);
>  		s = options;
> -		while (*s >= '0' && *s <= '9')
> +		while (isdigit(*s))
>  			s++;

What was wrong with:
		baud + simple_strtoul(options, &s, 10);
Seems to do just what was wanted.

David

>  		if (*s)
>  			parity = *s++;
> 

