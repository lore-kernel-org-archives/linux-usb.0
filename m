Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAF4F4CF4
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071658; cv=none; b=V5NNB4Y2KW1ShBK1Lzt6c2lRwXk6NvWBu3h9b7xR0HxTnI7jICwiHd/8N4BJRM6EOjlyuKxGoCt9LJA6o0QXcFtdKap1jI6+YijLlpsi/9VQYt8LsCT6egeEOhel7xvWcFKJM4r6r23r9zqMrODm+mvknNQop0/MjMdekkf8CgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071658; c=relaxed/simple;
	bh=e/QbGjIvokxqCfY0OdfhXUChmkjkDlvhD/a0sn0aZeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY+8iPmv7hyv8gzpxJT3fR/P3jRswprqQBP2fYx2kdfBMMp7vpWGOFkta5xaP4nLfxllKH+DTvx+P43egKDDvG0QGri0vwF4odTyWIr0YJhwKb78JQOjAnOolN5wdHIAoUXvtZ1qNuMd4t+Qwx6Qa4gjoHhF61jZuMowk2oJjVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4E02mir; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4E02mir"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso5351816a12.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790071654; x=1790676454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M21NvE6hEk+bHsAyKs+VPRDnarAHkFKIx7tvnOO3mWc=;
        b=Q4E02mirdAFsGxsUn8GNzLsAM6KQFisiieM/GzZeyWlPaRUlF7hx/xx5bvxG2oxT9m
         IzG8gpIIGSAgVIew5LAFmIKMXzEZQ5RYLCeeyw2ayIaiyNGR1hMC0yKS+lovk1bgy/Vn
         r7MCTwZf1p1vdR54p0Un1lDhwdzZN1MmhxeXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071654; x=1790676454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M21NvE6hEk+bHsAyKs+VPRDnarAHkFKIx7tvnOO3mWc=;
        b=udbZvviCHRaKfvWEKokB9Olmho3a07Oy0RFKSTSl/RJP2+CxbCIhyznSDhmjrRIpeU
         EK1MvFSMFSCWLW2sqHT3uIrQ9NVCZNkRuOHf0Igat3e9uEvM83jFQ9148tlQjXFM1RcD
         G6YILxYrW78ATa4xNetklU2F0c4dFZtDbuv0w60oHCTAq0CxJgYuGCCwzEtB4mo32dAg
         wdmwHd1XP7jY+5OeFZkQTDP60wU8Gb5hhfs22kUc45nCCvSKFyEQpO5swnNRaiUeC4i7
         reWtTF6Zd7GtUP6bOY3gAwmVyCBaVzAhlXrrBvNnl6kwauDxljheu/wx1jum3qn0/RAh
         6xsQ==
X-Gm-Message-State: AFuF++kTljILnEGavRlHfkq6G7AuUYiL+E2C4KWvcM/gWRgIX/TsZ52r
	efidos0Fw1VqjJTffBwHeU0V7f0ZMW7fkRf9fxTxrE4G2MmKoRN3MFr4EYWykeqa9LH+90oaUx2
	1hIuNi3xcJw==
X-Gm-Gg: AYBFou0H6X0yrw4cRDC31pOzQ/uO8H382tXS/9Ni3EOKesbOMwCMltpr01OUBUaQax1
	dR/OJ0uBmIg1Avvxfsw6qmBTMcNFcSOyNTTunK81mtWDZbHxzXJGEqzwyh8C0BQP0ruRqsxPVzq
	zh0L9Ts+2fhUiXOxc0lFps3depUwCjnPYDCW/DFY6BgGXxRRb8ql//dlUTzHecAdQ6XUbMf/GJU
	A36cAThhUf4Sb9hTm8WnQpr0/2dI8ZwQTtGPwJQ02ZiDY3TvSP+MotGVPG8Y6LKeTZIaKY8w4ux
	gIYE2FoFY4bnl2WYC5043+h61MN7Wd013w/T36H6QYHWcSBsuSTr6AASXHXgcE+yPYIt9ebzsRC
	e2KXREXzmmh6D4dUUu9QVtV8SwhNxhj1OcuRANnzZLh3P144dL8OGoV0oVChMFq/WI/DQ8cFehM
	KREpPB3979P5E5dg+tRApWy59C3aeB5Ab4/KPQDE4DxT4YISK0QFcIRPPfF6WRSOQI6VHx5jDKc
	BNQVtR1cwk=
X-Received: by 2002:a05:6402:e03:b0:6aa:4529:4cba with SMTP id 4fb4d7f45d1cf-6aa545f7e04mr11215471a12.7.1790071654290;
        Tue, 22 Sep 2026 03:07:34 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440dd61sm774693a12.2.2026.09.22.03.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:07:32 -0700 (PDT)
Message-ID: <2f14b623-7490-48e5-a509-d605a04930d1@linuxfoundation.org>
Date: Tue, 22 Sep 2026 04:07:28 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: add NULL check for calloc in do_standalone_mode
To: longlong yan <yanlonglong@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260817061514.765-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260817061514.765-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 00:15, longlong yan wrote:
> Add a NULL check for the return value of calloc() in
> do_standalone_mode(). If calloc() fails and returns NULL, the
> subsequent access to fds[i].fd would cause a NULL pointer
> dereference.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/src/usbipd.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..dbc2b48363b2 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -544,6 +544,11 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>   	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
>   
>   	fds = calloc(nsockfd, sizeof(struct pollfd));
> +	if (!fds) {
> +		err("calloc for pollfd");
> +		usbip_driver_close(driver);
> +		return -1;
> +	}
>   	for (i = 0; i < nsockfd; i++) {
>   		fds[i].fd = sockfdlist[i];
>   		fds[i].events = POLLIN;

It is theoretically possible for calloc() to fail, however how often
does it fail and were you able to make this allocation to fail?

If not, how did you test this patch? In any case, I am not going to
take this patch and all the other patches you sent adding checks to
calloc() calls in other places in usbip tool.

thanks,
-- Shuah
